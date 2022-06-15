% We will calculate the deviation of the Monte Carlo
% integration algorithm from the true integral value
% of the function below
f = @(x) sqrt(1 - x .^ 2);
% integral of above on 0 to 1 interval is pi / 4
% since we have shape of a quoter of the circle
trueInteralValue = pi / 4;

Np = 100;   % number of trials
N = floor(logspace(1, 6, Np));  % number of random points in each trial

% initialization of error arrays
erand = zeros(1, Np);
elcg = zeros(1, Np);

a = 2; c = 1; m = 100; seed = 1;
for i = 1:Np
    % calculate integration error
    erand(i) = abs(sum(f(rand(1, N(i)))) / N(i) - trueInteralValue);
    elcg(i) = abs(sum(f(lcgrand(1, N(i), a, c, m, seed))) / N(i) - trueInteralValue);
end

loglog(N, erand, 'o', N, elcg, '+');
set(gca, 'fontsize', 20);
legend('rand', 'lcg');
xlim([N(1), N(end)]);
xlabel('Number of requested random points');
ylabel('Integration error');
