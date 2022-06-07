function [x1, x2] = quadSolverImproved(a, b, c)
% solve quadratic equation a * x^2 + b * x + c = 0
D = b^2 - 4 * a * c
x1 = (-b - sqrt(D)) / (2 * a);
x2 = (-b + sqrt(D)) / (2 * a);
end
