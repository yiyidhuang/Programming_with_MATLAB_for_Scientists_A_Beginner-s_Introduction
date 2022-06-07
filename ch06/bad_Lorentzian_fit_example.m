%% load intial data file
data = load('data_to_fit.dat');
x = data(:, 1);     % 1st column is x
y = data(:, 2);     % 2nd column is y

%% define the fitting function with fittype
% notice that is quite human readable
% Matlab automatically treats x as independent variable
f = fittype(@(A, x0, gamma, x) A ./ (1 + ((x - x0) / gamma) .^ 2));

%% assign initial guessed parameters
% [A, x0, gamma] they are in the order of the appearance
% in the above fit function definition
pin = [.1, 25, .1]; % <------------- very bad initial guess!

%% Finally, we are ready to fit our data
[fitobject] = fit(x, y, f, 'StartPoint', pin)
