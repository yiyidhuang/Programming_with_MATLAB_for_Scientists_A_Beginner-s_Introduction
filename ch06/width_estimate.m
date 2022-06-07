fit_single_slit_data;   % run the filter
%% assigning values known from the experiment
l = 0.5;    % the distance to the screen
lambda = 800e-9;    % the wavelength in m

%% reading the fit results
alpha = fitobject.alpha;    % note .alpha, fitobject is an object
ci = confint(fitobject);    % confidence intervals for all parameters
alpha_col = 2;  % recall the order of appearance[I0, alpha, B, x0]
dalpha = (ci(2, alpha_col) - ci(1, alpha_col)) / 2; % uncertainty of alpha

%% the width related calculateions
a = alpha * l * lambda / pi;    % the slit width estimate
da = dalpha * l * lambda /pi;   % the slit width uncertainty
% a = 2.0016e-04
% da = 9.2565e-07
