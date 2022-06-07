% load initial data file
data = load('single_slit_data.dat');
x = data(:, 1);     % 1st column is x
y = data(:, 2);     % 2nd column is y

%% defining fit model
f = fittype(@(I0, alpha, B, x0, x) single_slit_diffraction(I0, alpha, B, x0, x));

%% prepare the initial guess
% _g is for guessed parameters
B_g = 0.5;
I0_g = 10;
x0_g = .5e-3;
alpha_g = pi / (2e-3 - x0_g);

% pin = [I0, alpha, B, x0] in order of appearance in fittype
pin = [I0_g, alpha_g, B_g, x0_g];

%% Finally, we are ready to fit our data
[fitobject] = fit(x, y, f, 'StartPoint', pin)
