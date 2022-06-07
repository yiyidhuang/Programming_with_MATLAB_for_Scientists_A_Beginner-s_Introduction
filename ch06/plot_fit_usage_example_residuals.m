buildin_fitter_usage_example; % run fit one more time
%% Let's see how well our fit follows the data
plot(fitobject, x, y, 'residuals')
set(gca, 'FontSize', 24);   % adjusting font size
xlabel('x');
ylabel('y');
