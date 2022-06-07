function integral1d = integrate_in_1d(f, a, b)
% integration with simple rectangle/box method
% int_a^b f(x) dx
N = 100;    % number of points in the sum
x = linspace(a, b, N);

s = 0;
for xi = x(1:end - 1)   % We need to exclude x(end) = b
    s = s + f(xi);
end

%% Now we calculate the integral
integral1d = s * (b - a) / (N - 1);
