classdef Quantity < engtools.mixin.operations.HyperoperationDown

    properties
        Time int32
        Length int32
        Mass int32
        Current int32
        Temperature int32
        AmountOfSubstance int32
        LuminousIntensity int32
    end

    properties (Dependent)
        Value
        Vector (7, :) int32
        QuantityName string
    end

%% Constructor

    methods

        function obj = Quantity(quantity, options)

            arguments
                quantity = []
                options.time {isValidInteger} = 0
                options.length {isValidInteger} = 0
                options.current {isValidInteger} = 0
                options.temperature {isValidInteger} = 0
                options.amountOfSubstance {isValidInteger} = 0
                options.luminousIntensity {isValidInteger} = 0
                options.mass {isValidInteger} = 0
            end

            import engtools.fcn.isValidInteger

            if ~isempty(quantity)
                if ismember(quantity, engtools.unit.Quantities.List)
                    obj = engtools.unit.Quantities.Library(quantity);
                else
                    error("engtools:unit:Quantity:InvalidQuantity", ...
                        "Unrecognized quantity '%s'.", quantity)
                end
                return
            end

            obj.Time = options.time;
            obj.Length = options.length;
            obj.Mass = options.mass;
            obj.Current = options.current;
            obj.Temperature = options.temperature;
            obj.AmountOfSubstance = options.amountOfSubstance;
            obj.LuminousIntensity = options.luminousIntensity;

        end

    end
    
%% Get/Set Methods

    methods

        function value = get.Value(obj)
            value = obj.Vector;
        end

        function obj = set.Value(obj, value)
            obj.Vector = value;
        end

        function vector = get.Vector(obj)
            vector = [obj.Time; obj.Length; obj.Mass; obj.Current; ...
                obj.Temperature; obj.AmountOfSubstance; obj.LuminousIntensity];
        end

        function obj = set.Vector(obj, vector)

            arguments
                obj
                vector {isValidQuantityVector}
            end

            obj.Time = vector(1);
            obj.Length = vector(2);
            obj.Mass = vector(3);
            obj.Current = vector(4);
            obj.Temperature = vector(5);
            obj.AmountOfSubstance = vector(6);
            obj.LuminousIntensity = vector(7);

        end

        function quantityName = get.QuantityName(obj)
            quantityName = engtools.unit.Quantities.getQuantityName(obj.Value);
            % libValues = [engtools.unit.Quantities.Library.values.Value];
            % matchingIndex = find(all(libValues == obj.Value));
            % if ~isempty(matchingIndex)
            %     quantityName = engtools.unit.Quantities.List(matchingIndex(1));
            % else
            %     quantityName = "Complex Quantity";
            % end
        end

    end

end

function tf = isValidQuantityVector(vector)
    tf = length(vector) == 7;
end