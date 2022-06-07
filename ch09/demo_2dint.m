f = @(x, y) x .^ 2 + y .^ 2;
% integrate_in_2d(f, [0, 2], [0, 1])
integral2(f, 0, 1, 0, 1)
