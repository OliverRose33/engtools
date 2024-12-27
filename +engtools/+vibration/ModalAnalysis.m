classdef ModalAnalysis
    properties
        % Input parameters
        DegreesOfFreedom
        InertiaMatrix
        StiffnessMatrix
        ForceVector engtools.vibration.HarmonicForce
        InitialDisplacement
        InitialVelocity
        % Calculated quantities
        DynamicMatrix
        Eigenvalues
        NaturalFrequencies
        ModalMatrix
        InverseModalMatrix

        ModalInertiaMatrix
        ModalStiffnessMatrix
        ModalForceVector
        ModalInitialDisplacement
        ModalInitialVelocity
    end

    properties (Hidden, Dependent)
        ModalInitialDisplacementMatrix
        ModalInitialVelocityMatrix
    end

    methods
        function obj = ModalAnalysis(M, K, F, x0, v0)
            arguments
                M
                K
                F = zeros(size(M, 1), 1)
                x0 = zeros(size(M, 1), 1)
                v0 = zeros(size(M, 1), 1)
            end

            obj.DegreesOfFreedom = size(M, 1);
            obj.InertiaMatrix = M;
            obj.StiffnessMatrix = K;

            % Solve eigenvalue problem, find natural frequencies
            obj.DynamicMatrix = M \ K; % Equal to inv(M) * K;
            [obj.ModalMatrix, obj.Eigenvalues] = eig(obj.DynamicMatrix);
            obj.NaturalFrequencies = sqrt(diag(obj.Eigenvalues))';
            obj.InverseModalMatrix = inv(obj.ModalMatrix);

            % Transform to principal coordinate system
            obj.ModalInertiaMatrix = ...
                obj.ModalMatrix' * obj.InertiaMatrix * obj.ModalMatrix;
            obj.ModalStiffnessMatrix = ...
                obj.ModalMatrix' * obj.StiffnessMatrix * obj.ModalMatrix;

            % Set forces and initial conditions
            obj.ForceVector = F;
            obj.InitialDisplacement = x0;
            obj.InitialVelocity = v0;
        end
    end

    methods % Get/Set

        function obj = set.ForceVector(obj, F)
            obj.ForceVector = F;
            obj = obj.transformForceVector();
        end

        function obj = set.InitialDisplacement(obj, x0)
            obj.InitialDisplacement = x0;
            obj = obj.transformInitialDisplacement();
        end

        function obj = set.InitialVelocity(obj, v0)
            obj.InitialVelocity = v0;
            obj = obj.transformInitialVelocity();
        end

        function X = get.ModalInitialDisplacementMatrix(obj)
            X = repmat(obj.ModalInitialDisplacement, ...
                [1, obj.DegreesOfFreedom]);
        end

        function V = get.ModalInitialVelocityMatrix(obj)
            V = repmat(obj.ModalInitialVelocity, ...
                [1, obj.DegreesOfFreedom]);
        end

    end

    methods (Access = private)

        function x = convertToGeneralCoordinates(obj, q)
            x = obj.ModalMatrix * q;
        end

        function q = convertToPrincipalCoordinates(obj, x)
            q = obj.InverseModalMatrix * x;
        end

        function obj = transformForceVector(obj)
            obj.ModalForceVector = ...
                obj.ModalMatrix' * obj.ForceVector;
        end

        function obj = transformInitialDisplacement(obj)
            obj.ModalInitialDisplacement = ...
                obj.convertToPrincipalCoordinates(obj.InitialDisplacement);
        end
        
        function obj = transformInitialVelocity(obj)
            obj.ModalInitialVelocity = ...
                obj.convertToPrincipalCoordinates(obj.InitialVelocity);
        end

    end

    methods (Access = public)

        function xt = computeResponse(obj, t)
            qt = obj.computeTransientResponse(t) ...
                + obj.computeSteadyStateResponse(t);
            xt = obj.convertToGeneralCoordinates(qt);
        end

        function qt = computeTransientResponse(obj, t)
            % https://www.brown.edu/Departments/Engineering/Courses/En4/Notes/vibrations_mdof/vibrations_mdof.htm
            t = reshape(t, 1, 1, []); % Move t into third dimension

            % Calculate coefficients
            A = dot(obj.ModalInitialDisplacementMatrix, obj.ModalMatrix) ...
                ./ dot(obj.ModalMatrix, obj.ModalMatrix);

            B = dot(obj.ModalInitialVelocityMatrix, obj.ModalMatrix) ...
                ./ dot(obj.ModalMatrix, obj.ModalMatrix) ...
                ./ obj.NaturalFrequencies;

            qt = A .* obj.ModalMatrix .* cos(obj.NaturalFrequencies .* t) ...
                + B .* obj.ModalMatrix .* sin(obj.NaturalFrequencies .* t);

            qt = sum(qt, 2); % Sum response over all modes
            qt = permute(qt, [1, 3, 2]); % Permute t to original dimension
        end

        function qt = computeSteadyStateResponse(obj, t)
            % t = reshape(t, 1, 1, []); % Move t into third dimension
            omega = obj.ForceVector.Frequency;
            % disp(obj.ModalForceVector.evaluate(t))
            A = obj.ModalStiffnessMatrix - obj.ModalInertiaMatrix * omega^2;
            X = A \ obj.ModalForceVector.Magnitude;
            qt = X .* cos(omega * t);
        end

        function plotResponse(obj, t)
            xt = obj.computeResponse(t);
            fig = figure("OuterPosition", [0, 0, 1, 1], ...
                "WindowState", "Maximized");
            ax = axes(fig);
            plot(ax, t, xt)
        end

    end

end