classdef Circle < engtools.geometry.shapes.Shape

    properties (Constant, Hidden)
        Sides = 1
    end

    properties
        Radius
    end

    properties (Hidden)
        Resolution
    end

    properties (Dependent)
        Diameter
        Area
        Perimeter
        Coordinates
    end

    methods
        function obj = Circle(radius, options)
            arguments
                radius = 1
                options.resolution = 20
            end

            obj.Radius = radius;
            obj.Resolution = options.resolution;
        end

        function diameter = get.Diameter(obj)
            diameter = 2 * obj.Radius;
        end

        function obj = set.Diameter(obj, diameter)
            obj.Radius = diameter / 2;
        end

        function area = get.Area(obj)
            area = pi * obj.Radius^2;
        end

        function perimeter = get.Perimeter(obj)
            perimeter = 2 * pi * obj.Radius;
        end

        function coordinates = get.Coordinates(obj)
            theta = linspace(0, 2*pi, obj.Resolution + 1)';
            coordinates = obj.Radius * [sin(theta), cos(theta)];
        end
    end
end