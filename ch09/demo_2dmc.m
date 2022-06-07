f = @(x, y) 2 * x .^ 2 + y .^ 2;
bx = 2; ax = 0;
by = 1; ay = 0;
% first we prepare x and y components of random points
% rand provides uniformly distributed points in the (0, 1) interval
N = 1000;   % number of random points
x = ax + (bx - ax) * rand(1, N);    % 1 row, N columns
y = ay + (by - ay) * rand(1, N);    % 1 row, N columns

% Finally integral evaluation
integral2d = (bx - ax) * (by - ay) / N * sum(f(x, y))
% integral2d = 6.1706
