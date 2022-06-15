function [x, y] = odeeuler(fvec, xspan, y0, N)
    %% Solves a system of ordinary differential equations 
    %% with the Euler method
    % x - column vector of x positions
    % y - solution array values of y, each row corresponds to particular
    % row of x. Each column corresponds, to a given derivative of y,
    % including y(:,1) with no derivative
    % fvec - handle to a function f(x, y) returning forces column vector
    % xspan - vector with initial and final x coordinates i.e. [x0, xf]
    % y0 - initial conditions for y, should be row vector
    % N - number of points in the x column (N >= 2), i.e. we do N - 1 steps
    % druing the calculation

    x0 = xspan(1);  % start position
    xf = xspan(2);  % final position

    h = (xf - x0) / (N - 1);    % step size
    x = linspace(x0, xf, N);    % values of x where y will be evaluated

    odeorder = length(y0);
    y = zeros(N, odeorder);     % initialization
    x(1) = x0; y(1,:) = y0;     % initial conditions
    for i = 2:N                 % Number ot steps is less by 1 then 
                                % number of points since we know x0, y0
       xprev = x(i - 1);
       yprev = y(i - 1, :);
       % Matlab somehow always send column vector for 'y' to the forces
       % calculation code transposing yprev to make this method compatible
       % with Matlab. Note the dot in .' this avoid complex conjugate
       % transpose
       f = fvec(xprev, yprev.');
       % We receive f as a column vector, thus we need to ranspose again
       f = f .';
       ynext = yprev + f * h;   % vector of new values of 
                                % y: y(x + h) = y(x) + f * h
       y(i, :) = ynext;
    end
end