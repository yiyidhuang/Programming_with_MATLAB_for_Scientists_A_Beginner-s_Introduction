function [x1, x2] = quadSolverImproved2nd(a, b, c)
% solve quadratic equation a * x^2 + b * x + c = 0
D = b^2 - 4 * a * c
if (D < 0)
    error("Discriminant is negative: cannot find read roots");
end
x1 = (-b - sqrt(D)) / (2 * a);
x2 = (-b + sqrt(D)) / (2 * a);
