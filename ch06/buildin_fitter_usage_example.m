%% load initial data file
data = load('data_to_fit.dat');
x = data(:,1);  % 1st column is x
y = data(:,2);  % 2nd column is y

%% define the fitting function with fittype
% notice that it is quite human readable
% Matlab automatically treats x as independent variable
f = fittype(@(A, x0, gamma, x) A ./ (1 + ((x - x0) / gamma) .^ 2));

%% assign intial guessed parameters
% [A, x0, gamma] they are in the order of the appearance
% in the above fit function definition
pin = [3, 3, 1];

%% Finally, we are ready to fit our data
[fitobject] = fit(x, y, f, 'StartPoint', pin)
