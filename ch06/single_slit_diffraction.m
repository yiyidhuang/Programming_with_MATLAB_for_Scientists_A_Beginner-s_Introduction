function [I] = single_slit_diffraction(I0, alpha, B, x0, x)
    % calculates single slit diffraction intensity pattern
    % I0 - intensity of the maximum
    % B - background level
    % alpha - (pi * d) / (lambda * l), where
    % d - slit width
    % lambda - light wavelength
    % l - distance between the slit and the screen
    % x - distance across the screen
    % x0 - position of the intensity maximum

    xp = alpha * (x - x0);
    I = I0 * (sin(xp) ./ xp) .^ 2 + B;
end