function [x_sol, f_at_x_sol, N_iterations] = newtonraphson(f, xguess, eps_f, ...
    df_handle)
% Finds the root of equation f(x) = 0 with the Newton-Raphson alogrithm
% f - the function to solve handle
% xguess - initial guess (starting point)
% eps_f - desired precision for f(x_sol)
% df_handle - handle to the derivative of the function f(x)
%
% We need to sanitize the inputs but this is skipped for simplicity
    N_iterations = 0;   % initialization of the counter
    fg = f(xguess);     % value of function at guess point

    while((abs(fg) > eps_f))    % The xguess convergence check is not implemented
        xguess = xguess - fg / df_handle(xguess);   % evaluate new guess
        fg = f(xguess);
        N_iterations = N_iterations + 1;
    end
    x_sol = xguess;
    f_at_x_sol = fg;
end
