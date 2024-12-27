classdef Ngon < engtools.geometry.shapes.Shape

    properties
        Sides
        Side
    end

    properties (Dependent)
        CentralAngle
        InteriorAngle
        Apothem
        Radius
        Height
        Width
        Area
        Perimeter
        Coordinates
    end

    methods
        function obj = Ngon(sides, side)
            arguments
                sides {mustBeGreaterThanOrEqual(sides, 3)} = 6
                side = 1
            end

            obj.Sides = sides;
            obj.Side = side;
        end

        function centralAngle = get.CentralAngle(obj)
            centralAngle = 2 * pi / obj.Sides;
        end

        function interiorAngle = get.InteriorAngle(obj)
            interiorAngle = pi - obj.CentralAngle;
        end

        function apothem = get.Apothem(obj)
            apothem = obj.Side / (2 * tan(pi / obj.Sides));
        end

        function radius = get.Radius(obj)
            radius = obj.Side / (2 * sin(pi / obj.Sides));
        end

        function height = get.Height(obj)
            if mod(obj.Sides, 2) == 0
                height = 2 * obj.Apothem;
            else
                height = obj.Apothem + obj.Radius;
            end
        end

        function width = get.Width(obj)
            if mod(obj.Sides, 2) == 0
                if mod(obj.Sides, 4) == 0
                    width = 2 * obj.Apothem;
                else
                    width = 2 * obj.Radius;
                end
            else
                width = 2 * obj.Radius ...
                    * sin(pi * (obj.Sides - 1) / (2 * obj.Sides));
            end
        end

        function area = get.Area(obj)
            area = 0.5 * obj.Sides * obj.Side * obj.Apothem;
        end

        function perimeter = get.Perimeter(obj)
            perimeter = obj.Sides * obj.Side;
        end

        function coordinates = get.Coordinates(obj)
            theta = linspace(0, 2*pi, obj.Sides + 1)';  
            coordinates = obj.Radius * [sin(theta), cos(theta)];
        end
    end
end