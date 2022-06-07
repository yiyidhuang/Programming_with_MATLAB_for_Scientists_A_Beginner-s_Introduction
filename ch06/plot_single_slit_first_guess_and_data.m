% load initial data file
data = load('single_slit_data.dat');
x = data(:, 1);     % 1st column is x
y = data(:, 2);     % 2nd column is y

% _g is for guessed parameters
B_g = 0.5;
I0_g = 10;
x0_g = .5e-3;
alpha_g = pi / (2e-3 - x0_g);

% We have a liberty to choose x points for the model line
Nx = 1000;
xmodel = linspace(-1e-2, 1e-2, Nx);
ymodel = single_slit_diffraction(I0_g, alpha_g, B_g, x0_g, xmodel);
plot(x, y, 'bx', xmodel, ymodel, 'r-');
legend({'data', 'first guess'});
set(gca, 'FontSize', 24);
xlabel('x');
ylabel('I(x)');
