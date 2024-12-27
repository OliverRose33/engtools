classdef (Abstract) EnumerationPrintName

    properties (Dependent, SetAccess = immutable)
        PrintName
    end

    methods
        function printName = get.PrintName(obj)
            printName = strtrim(regexprep(string(obj), "([A-Z])", " $1"));
        end
    end

end