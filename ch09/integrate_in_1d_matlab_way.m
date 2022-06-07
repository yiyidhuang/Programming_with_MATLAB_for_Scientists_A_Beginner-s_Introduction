function integral1d = integrate_in_1d_matlab_way(f, a, b)
% integration with a simple rectangle/box method
% int_a^b f(x) d(x)

N = 100;    % number of points in the sum
x = linspace(a, b, N);

% if function f can work with vector argument then we can do
integral1d = (b - a)/(N - 1) * sum(f(x(1:end - 1)));    % We exclude x(end) = b
