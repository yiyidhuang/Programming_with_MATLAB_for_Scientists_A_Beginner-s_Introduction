% lorentzian_fit_example; % run fit
bad_Lorentzian_fit_example; % run fit
%% Let's see how well our fit follows the data
plot(fitobject, x, y, 'fit')
set(gca, 'FontSize', 16);   % adjusting font size
xlabel('x');
ylabel('y');
