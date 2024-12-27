function A = calculateArea(shape, varargin, options)

    arguments
        shape (1,1) {mustBeMember(shape, ...
            ["circle", "square", "rectangle", "annulus"])} ...
            = "circle"
    end

    arguments (Repeating)
        varargin
    end

    arguments
        options.radius = NaN
        options.diameter = NaN
    end

    switch shape

        case "circle"
            if ~isnan(options.radius)
                A = calculateAreaCircle(options.radius);
            elseif ~isnan(options.diameter)
                A = calculateAreaCircle(options.diameter/2);
            else
                A = calculateAreaCircle(varargin{1});
            end

       case "square"
            A = calculateAreaSquare(varargin{1}); 

    end

end

function A = calculateAreaCircle(radius)
    A = pi * radius^2;
end

function A = calculateAreaSquare(side)
    A = side^2;
end