classdef HarmonicForce
    properties
        Magnitude
        Frequency (1,1)
        PhaseAngle (1,1)
    end

    methods
        function obj = HarmonicForce(magnitude, frequency, phaseAngle)
            arguments
                magnitude = 0
                frequency = 1
                phaseAngle = 0
            end

            obj.Magnitude = magnitude;
            obj.Frequency = frequency;
            obj.PhaseAngle = phaseAngle;
        end

        function F = evaluate(obj, t)
            F = obj.Magnitude .* cos(obj.Frequency * t - obj.PhaseAngle);
        end

        function C = mtimes(A, B)
            disp(B)
            disp(A)
            disp(A * B.Magnitude)
            C = engtools.vibration.HarmonicForce( ...
                (A * B.Magnitude), B.Frequency, B.PhaseAngle);
        end
    end
end