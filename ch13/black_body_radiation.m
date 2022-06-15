function I_lambda = black_body_radiation(lambda, T)
    % black body radiation spectrum
    % lambda - wavelength of EM wave
    % T - temperature of a black body
    h = 6.626e-34;  % the Plank constant
    c = 2.998e8;    % the speed of light
k=1.380e-23;  % the Boltzmann constant

I_lambda = 2*h*c^2 ./ (lambda.^5)  ./ (exp(h*c./(lambda*k*T))-1);
end
