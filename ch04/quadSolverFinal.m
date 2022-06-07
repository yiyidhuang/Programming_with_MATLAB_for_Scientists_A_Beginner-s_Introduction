
function [x1, x2] = quadSolverFinal(a, b, c)
% solve quadratic equation a * x^2 + b * x + c = 0
% ALWAYS check and sanitize input parameters
if ((a == 0) && (b == 0))
    error('a == 0 and b == 0: impossible to find roots');
end

if ((a == 0) && (b ~= 0))
    % special case: we essentially solve b * x = -c
    x1 = -c / b;
    x2 = x1;
else
    D = b^2 - 4 * a * c; % Discriminant of the equation
    if (D < 0)
        error('Discriminant is neative: no real roots');
    end
    x1 = (-b - sqrt(D)) / (2 * a);
    x2 = (-b + sqrt(D)) / (2 * a);
end
end
