function [xg, fg, N_eval] = bisection(f, xn, xp, eps_f, eps_x)
% Solves f[x] = 0 with bisection method
% 
% Outputs:
%   xg is the root approximation
%   fg is the function evaluated at final guess f(xg)
%   N_eva is the number fo function evaluations
% Inputs:
%   f is the function hadnle to the desired function,
%   xn and xp are broders of search, i.e. root brackets,
%   eps_f defines maximum deviation of f(x_sol) from 0,
%   eps_x defines maximum deviation from the true solution
%   
% For simplicity reasons, no checks of input validity are done:
%   it is up to user to check that f(xn) < 0 and f(xp) > 0,
%   and that all required deviations are positive

%% initialization
xg = (xp + xn) / 2;     % initial root guess
fg = f(xg);             % initial function evaluation
N_eval = 1;             % We just evaluated the function

%% here we search for root
while ((abs(xg - xp) > eps_x) || (abs(fg) > eps_f))
    if (fg > 0)
        xp = xg;
    else
        xn = xg;
    end
    xg = (xp +xn) / 2;  % Update the guessed x value
    fg = f(xg);         % evaluate the function at xg
    N_eval = N_eval + 1;% update evaluation counter
end

%% solution is ready
end
