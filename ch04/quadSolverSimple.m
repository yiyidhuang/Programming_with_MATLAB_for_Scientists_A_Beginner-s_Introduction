
function [x1, x2] = quadSolverSimple(a, b, c)
% solve quadratic equation a * x ^ 2 + b * x + c = 0
x1 = (-b - sqrt(b^2 - 4 * a * c)) / (2 * a);
x2 = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a);
end
