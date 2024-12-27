classdef Quantity < engtools.mixin.operations.HyperoperationDown

    properties %(SetAccess = immutable)
        time int32
        length int32
        mass int32
        current int32
        temperature int32
        amountOfSubstance int32
        luminousIntensity int32
    end

    properties (Dependent) %, SetAccess = immutable)
        Value
        Vector (7, :) int32
    end

%% Constructor

    methods

        function obj = Quantity(options)

            arguments
                options.time {isValidInteger} = 0
                options.length {isValidInteger} = 0
                options.current {isValidInteger} = 0
                options.temperature {isValidInteger} = 0
                options.amountOfSubstance {isValidInteger} = 0
                options.luminousIntensity {isValidInteger} = 0
                options.mass {isValidInteger} = 0
                options.vector {isValidQuantityVector} = []
            end

            import engtools.functions.validation.isValidInteger

            if ~isempty(options.vector)
                obj.time = options.vector(1);
                obj.length = options.vector(2);
                obj.mass = options.vector(3);
                obj.current = options.vector(4);
                obj.temperature = options.vector(5);
                obj.amountOfSubstance = options.vector(6);
                obj.luminousIntensity = options.vector(7);
                return
            end

            obj.time = options.time;
            obj.length = options.length;
            obj.mass = options.mass;
            obj.current = options.current;
            obj.temperature = options.temperature;
            obj.amountOfSubstance = options.amountOfSubstance;
            obj.luminousIntensity = options.luminousIntensity;

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
            vector = [obj.time; obj.length; obj.mass; obj.current; ...
                obj.temperature; obj.amountOfSubstance; obj.luminousIntensity];
        end

        function obj = set.Vector(obj, vector)
            obj.time = vector(1);
            obj.length = vector(2);
            obj.mass = vector(3);
            obj.current = vector(4);
            obj.temperature = vector(5);
            obj.amountOfSubstance = vector(6);
            obj.luminousIntensity = vector(7);
        end

    end

end

function tf = isValidQuantityVector(vector)
    tf = (length(vector) == 7) || isempty(vector);
end