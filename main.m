% M = [1, 4; 4, 1];
% K = [2, -1; -1, 3];
% F = engtools.vibration.HarmonicForce([2; 1], 1);
% 
% A = engtools.vibration.ModalAnalysis(M, K, F);


M = [4.3, 0; 0, 4.3];
K = [200, -100; -100, 100];
Z = M \ K;
[modes, eigenvalues] = eig(Z);
w = eigenvalues .^ 0.5;

Z = K - (M .* 20^2);
F = [0; 333];
X = Z \ F;