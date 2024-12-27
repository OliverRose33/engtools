classdef Shape

    properties (Abstract)
        Sides
    end

    properties (Abstract, Dependent)
        Area
        Perimeter
        Coordinates
    end

    methods
        function plot(obj, axes, options)
            arguments
                obj
                axes = gca
                options.filled = false
            end

            if options.filled
                patch(axes, ...
                    "XData", rmmissing(obj.Coordinates(:,1)), ...
                    "YData", rmmissing(obj.Coordinates(:,2)));
            else
                plot(axes, obj.Coordinates(:,1), obj.Coordinates(:,2));
            end
        end
    end
end