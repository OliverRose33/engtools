m_cup = 0.056;
m_bracket = 0.17;
m_phone = 0.2;
k = 130;
theta = pi / 6;
kz = 10000;

m = m_bracket + m_phone;
kx = k / 2;
ky = k / 2;

%% Vertical System Only
M_vert = [m_cup, 0; 0, m];
K_vert = [kz + ky, -ky; -ky, ky];
A_vert = engtools.vibration.ModalAnalysis(M_vert, K_vert);

% 
% M = [m, 0; 0, m];
% K = [kx, 0; 0, ky];
% F = engtools.vibration.HarmonicForce([0; 0], 1);
% 
% A = engtools.vibration.ModalAnalysis(M, K, F);

%% Natural Frequency Analysis
m_phone = linspace(0, 0.3);
ks = logspace(2, 6)';
ky = 65;
m0 = 0.056;
m_bracket = 0.17;
m = m_bracket + m_phone;

a = m0 .* m;
b = -m0 .* ky - m .* ky - m .* ks;
c = ks .* ky;

omega1Squared = (-b + sqrt(b.^2 - 4 * a .* c)) ./ (2 * a);
omega2Squared = (-b - sqrt(b.^2 - 4 * a .* c)) ./ (2 * a);
omega1 = sqrt(omega1Squared);
omega2 = sqrt(omega2Squared);

% fig = figure("WindowState", "maximized");
% ax = axes(fig);
% hold(ax, "on");
% surf(ax, m_phone, ks, omega1);
% surf(ax, m_phone, ks, omega2);
% set(ax, "YScale", "log")
% title(ax, "Natural Frequency of Vertical System")
% xlabel(ax, "Mass of Phone [kg]")
% ylabel(ax, "Suction Cup Stiffness [N/m]")
% zlabel(ax, "Natural Frequency [rad/s]")
% 
% fig2 = figure("WindowState", "maximized");
% ax2 = axes(fig2);
% surf(ax2, m_phone, ks, omega2);
% set(ax2, "YScale", "log")
% title(ax2, "Lower Natural Frequency of Vertical System")
% xlabel(ax2, "Mass of Phone [kg]")
% ylabel(ax2, "Suction Cup Stiffness [N/m]")
% zlabel(ax2, "Natural Frequency [rad/s]")

% We will assume ks = 10,000 N/m = 10 N/mm
ks = 10000;
% Exploring what happens when the bracket is displaced by 5cm
x0 = [0; -0.05];
% Consider 2 cases:
% Case 1: m_phone = 0.25kg
M1 = [m0, 0; 0, m_bracket + 0.25];
K1 = [(ks + ky), -ky; -ky, ky];
A1 = engtools.vibration.ModalAnalysis(M1, K1);
A1.InitialDisplacement = x0;
% [U1, E1] = eig(M1 \ K1);
% omega1 = sqrt(E1);

% Case 2: empty bracket, i.e. m_phone = 0kg
M2 = [m0, 0; 0, m_bracket];
K2 = K1;
A2 = engtools.vibration.ModalAnalysis(M2, K2);
A2.InitialDisplacement = x0;
% [U2, E2] = eig(M2 \ K2);
% omega2 = sqrt(E2);

%% Base Excitation
m = 0.17 + 0.25;
k = 130;
M = [2*m, 0; 0, 2*m];
K = [k, 0; 0, k];

theta = pi/6;
Z = 2e-3;
omega = logspace(-2, 4, 100);
t = 0:0.01:20;

fig = figure("WindowState", "maximized");
ax = axes(fig);
hold(ax, "on")
maxVert = nan(size(omega));

for i = 1:length(omega)
    F = engtools.vibration.HarmonicForce(k*Z*[sin(theta); -cos(theta)], omega(i));
    A_base = engtools.vibration.ModalAnalysis(M, K, F);
    omegan1 = A_base.NaturalFrequencies(1);
    xt = A_base.computeResponse(t);
    plot3(ax, t, repmat(omega(i), size(t)), xt);
    maxVert(i) = min(xt(2,:));
end
set(ax, "YScale", "log")
title(ax, "Base Excitation Response (250g Phone)")
xlabel(ax, "Time [s]")
ylabel(ax, "Driving Frequency [rad/s]")
zlabel(ax, "Displacement [m]")
% surf(ax, t', omega, -0.05 * ones([length(omega), length(t)]), ...
%     "FaceAlpha", 0.3);
view(ax, [-45, 30])

fig2 = figure("WindowState", "maximized");
ax2 = axes(fig2);
hold(ax2, "on")
plot(ax2, omega, maxVert)
set(ax2, "XScale", "log")
title(ax2, "Maximum Vertical Displacement")
xlabel(ax2, "Driving Frequency [rad/s]")
ylabel(ax2, "Maximum Vertical Displacement [m]")


m2 = 0.17;
k2 = 130;
M2 = [2*m2, 0; 0, 2*m2];
K2 = [k2, 0; 0, k2];

fig3 = figure("WindowState", "maximized");
ax3 = axes(fig3);
hold(ax3, "on")
maxVert2 = nan(size(omega));

for i = 1:length(omega)
    F = engtools.vibration.HarmonicForce(k2*Z*[sin(theta); -cos(theta)], omega(i));
    A_base = engtools.vibration.ModalAnalysis(M2, K2, F);
    omegan2 = A_base.NaturalFrequencies(1);
    xt = A_base.computeResponse(t);
    plot3(ax3, t, repmat(omega(i), size(t)), xt);
    maxVert2(i) = min(xt(2,:));
end
set(ax3, "YScale", "log")
title(ax3, "Base Excitation Response (No Phone)")
xlabel(ax3, "Time [s]")
ylabel(ax3, "Driving Frequency [rad/s]")
zlabel(ax3, "Displacement [m]")
view(ax3, [-45, 30])

hold(ax2, "on")
plot(ax2, omega, maxVert2)
xline(ax2, omegan1, "Color", [0 0.4470 0.7410])
xline(ax2, omegan2, "Color", [0.8500 0.3250 0.0980])
yline(ax2, -0.05, "r-")
legend(ax2, ["250g Phone", "No Phone", "Natural Frequency with Phone", "Natural Frequency without Phone", "Dashboard"])

%%
M3 = [m, 0; 0, m];
K3 = [k/2, 0; 0, k/2];
A3 = engtools.vibration.ModalAnalysis(M3, K3);




% omega = logspace(-2, 4, 100);
% wn = 12.44;
% cc = 20.89;
% r = omega / wn;
% r = 1;
% c = linspace(0, 100, 100)';
% zeta = c / cc;
% Z = 2e-3;
% Xp = Z * sqrt((1 + (2*zeta.*r).^2) ./ ((1 - r.^2).^2 + (2*zeta.*r).^2));
% fig = figure("WindowState", "maximized");
% ax = axes(fig);
% surf(ax, omega, c, Xp)
% % plot(ax, c, Xp)
% set(ax, "XScale", "log")
% % title(ax, "Maximum Displacement at r = 1")
% title(ax, "Maximum Displacement vs Driving Frequency and Damping Coefficient")
% xlabel(ax, "Driving Frequency [rad/s]")
% ylabel(ax, "Damping Coefficient [Ns/m]")
% zlabel(ax, "Maximum Displacement [m]")
% view(ax, [-45, 30])

cc = [20.89; 13.2966];
c = linspace(0, 100, 200);
zeta = c ./ cc;
r = 1;
TR = sqrt( (1 + (2*zeta).^2) ./ (2*zeta).^2 );
fig = figure("WindowState", "maximized");
ax = axes(fig);
plot(ax, c, TR)
title(ax, "Transmissibility Ratio at Resonance")
xlabel(ax, "Damping Coefficient [Ns/m]")
ylabel(ax, "Transmissibility Ratio [-]")
legend(ax, ["250g Phone", "No Phone"])
