function fvec = free_fall_forces(x, y)
    % free fall forces example
    % notice that physical meaning of the independent variable 'x' is time
    % we are solving y''(x) = -g, so the transformation to the canonical
    % form is y1 = y; y2 = y'
    % f = (y2, -g);

    g = 9.8;    % magnitude of the acceleration due to 
                % the free fall in m/s^2
    fvec(1) = y(2);
    fvec(2) = -g;
    % if we want to be compatible with Matlab solvers, fvec should be a
    % column
    fvec = fvec.';  % Note the dot in .' 
                    % This avoids complex conjugate transpose
end