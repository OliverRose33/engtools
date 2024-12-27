classdef Rectangle < engtools.geometry.shapes.Shape

    properties (Constant, Hidden)
        Sides = 4
    end

    properties
        Width
        Height
    end

    properties (Dependent)
        Area
        Perimeter
        Coordinates
        Diagonal
    end

    methods
        function obj = Rectangle(width, height)
            arguments
                width = 1
                height = 1
            end
            
            obj.Width = width;
            obj.Height = height;
        end

        function area = get.Area(obj)
            area = obj.Width * obj.Height;
        end

        function perimeter = get.Perimeter(obj)
            perimeter = 2 * (obj.Width + obj.Height);
        end

        function coordinates = get.Coordinates(obj)
            coordinates = [obj.Width, obj.Height] ...
                .* [0, 0; 0, 1; 1, 1; 1, 0; 0, 0];
        end

        function diagonal = get.Diagonal(obj)
            diagonal = norm([obj.Width, obj.Height]);
        end
    end
end