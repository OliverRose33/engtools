classdef (Abstract) HyperoperationDown

    properties (Abstract)
        Value
    end
    
    methods

        function tf = eq(obj1, obj2)
            tf = all(obj1.Value == obj2.Value);
        end

        function c = plus(a, b)
            assert(a == b)
            c = a;
            c.Value = a.Value;
        end

        function c = uminus(a)
            c = a;
            c.Value = a.Value;
        end

        function c = minus(a, b)
            c = a;
            c.Value = a.Value + (-b.Value);
        end

        function c = times(a, b)
            c = a;
            c.Value = a.Value + b.Value;
        end

        function c = rdivide(a, b)
            c = a;
            c.Value = a.Value - b.Value;
        end

        function c = power(a, b)
            c = a;
            c.Value = a.Value .* b;
        end

    end

end