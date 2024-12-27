classdef Annulus < engtools.geometry.shapes.Shape

    properties (Constant, Hidden)
        Sides = 2
    end

    properties
        OuterRadius
        InnerRadius
    end

    properties (Hidden)
        Resolution
    end

    properties (Dependent)
        OuterDiameter
        InnerDiameter
        Area
        Perimeter
        Coordinates
    end

    methods
        function obj = Annulus(dimension1, dimension2, options)
            arguments
                dimension1 = 1
                dimension2 = 0.5
                options.resolution = 20
            end
            
            obj.OuterRadius = max(dimension1, dimension2);
            obj.InnerRadius = min(dimension1, dimension2);
            obj.Resolution = options.resolution;
        end

        function outerDiameter = get.OuterDiameter(obj)
            outerDiameter = 2 * obj.OuterRadius;
        end

        function obj = set.OuterDiameter(obj, outerDiameter)
            obj.OuterRadius = outerDiameter / 2;
            obj.InnerRadius = min(obj.OuterRadius, obj.InnerRadius);
        end

        function innerDiameter = get.InnerDiameter(obj)
            innerDiameter = 2 * obj.InnerRadius;
        end

        function obj = set.InnerDiameter(obj, innerDiameter)
            obj.InnerRadius = innerDiameter / 2;
            obj.OuterRadius = max(obj.OuterRadius, obj.InnerRadius);
        end

        function area = get.Area(obj)
            area = pi * (obj.OuterRadius^2 - obj.InnerRadius^2);
        end

        function perimeter = get.Perimeter(obj)
            perimeter = 2 * pi * (obj.OuterRadius + obj.InnerRadius);
        end

        function coordinates = get.Coordinates(obj)
            theta = linspace(0, 2*pi, obj.Resolution + 1)';
            coordinates = cat(1, ...
                obj.OuterRadius * [sin(theta), cos(theta)], ...
                [NaN, NaN], ...
                obj.InnerRadius * [sin(theta), cos(theta)]);
        end
    end
end