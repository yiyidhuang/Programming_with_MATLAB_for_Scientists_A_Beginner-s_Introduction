function [m] = merit_psi(v, k, L)
    % merit for the potential well problem
    alpha = v(1);
    B = v(2);
    
    m = (sin(k * L) - B * exp(-alpha * L))^2 + (k * cos(k * L) + alpha * B * exp(-alpha * L))^2;
end