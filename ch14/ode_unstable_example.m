%% We are solving y '= 3 * y - 4 * exp(-x) with y(0) = 1
y0 = [1];   % y(0) = 1
xspan = [0, 2];

fvec = @(x, y)  3 * y(1) - 4 * exp(-x);
% The fvec is scalar, there is no need to transpose it to make a column
% vector
Npoints = 100;
[x, y] = odeeuler(fvec, xspan, y0, Npoints);

% General analytical solution is 
% y(x) = C * exp(3 * x) + exp(-x), where C is some constant
% from y(0) = 1 follows C = 0
yanalytical = exp(-x);
plot(x, y(:, 1), '-', x, yanalytical, 'r.-');
set(gca, 'fontsize', 24);
legend('numerical', 'analytical');
xlabel('x');
ylabel('y');
title('y vs. x');
