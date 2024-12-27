classdef Square < engtools.geometry.shapes.Rectangle

    % properties
    %     Side
    % end

    properties (Dependent)
        Side
    end

    % properties (Hidden)
    %     Width
    %     Height
    % end

    methods
        function obj = Square(side)
            arguments
                side = 1
            end
            
            obj.Side = side;
        end

        function side = get.Side(obj)
            side = obj.Width;
        end

        function obj = set.Side(obj, side)
            obj.Width = side;
            obj.Height = side;
        end
    end

    % properties (Dependent)
    %     Area
    %     Perimeter
    %     Coordinates
    % end

    % methods
    %     function obj = Square(side)
    %         arguments
    %             side = 1
    %         end
            
    %         obj.Side = side;
    %     end 

    %     function area = get.Area(obj)
    %         area = obj.Side^2;
    %     end

    %     function perimeter = get.Perimeter(obj)
    %         perimeter = 4 * obj.Side;
    %     end

    %     function coordinates = get.Coordinates(obj)
    %         coordinates = obj.Side * [0, 0; 0, 1; 1, 1; 1, 0; 0, 0];
    %     end
    % end
end