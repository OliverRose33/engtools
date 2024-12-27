classdef Unit

    properties
        Quantity engtools.units.Quantity = engtools.units.QuantityLibrary.Dimensionless

        Name (1,1) string = "Default Unit"
        Alias (:,1) string = strings(0)
        Abbreviation (1,1) string = ""
        AbbreviationAlias (:,1) string = strings(0)
        Description (1,1) string = ""

        ConversionFactor (1,1) double = 1
        AffineConversionFactor (1,1) double = 0
    end

%% Constructor

    methods

        function obj = Unit(options)

            arguments
                options.?engtools.units.Unit
            end

            for property = string(fieldnames(options))'
                obj.(property) = options.(property);
            end

        end

    end

end