fit_single_slit_data;   % run the fitter

%% plot the data resulting fit, and residuals
plot(fitobject, x, y, 'fit', 'residuals')
xlabel('x');
ylabel('y')
