function yi = interp_linear(xdata, ydata, xi)
    %% Interpolates with the linear interpolation method
    % xdata, ydata - known data points
    % xi - points at which we want interpolated values yi
    % WARNING: no checks is done that xi values are inside xdata range
    
    % First, we need to sort our input vectors along the x coordinate.
    % We need the monotonous growth of x
    
    % MATLAB's sort function has an extra return value: the index.
    % The list of indexes is such that x = xdata(index), where x is sorted
    [x, index] = sort(xdata);
    % We reuse this index to sort 'y' vector the same way as 'x'
    y = ydata(index);
    
    %% Second we want to calculate parameters of the connecting lines.
    % For N points we will have N - 1 intervals with connecting lines.
    % Each of them will have 2 parameters slope and offset,
    % so we need the parameters matrix with Nintervals x 2 values
    Nintervals = length(xdata) - 1;
    p = zeros(Nintervals, 2);
    % p(i, 1) is the slope for the interval between x(i) and x(i + 1)
    % p(i, 2) is the offset for the interval between x(i) and x(i + 1)
    % so y = offset * x + slope = p1 * x + p2 at this interval
    for i = 1:Nintervals
        slope = (y(i + 1) - y(i)) / (x(i + 1) - x(i));  % slope
        offset = y(i) - slope * x(i);   % offset at x = 0
        p(i, 1) = slope;
        p(i, 2) = offset;
    end

    %% It is crucial to have yi preinitialized !
    % It significantly speeds up the algorithm,
    % since computer does not have to reallocate memory for new data points
    % Try to coment the following line and compare the execution time for a
    % large length for xi
    yi = 0 .* xi;   % A simple shortcut to intialize return vector with zeros.
                    % This also takes care of deciding the yi vector
                    % type(row or column).
    
    %% Finally, we interpolate.
    N = length(xi);
    for i = 1:N     % We will go through all points to be interpolated
        % Let's find nearest left neighbor for xi.
        % Such neighbor must have the smallest positive displacement
        displacement = (xi(i) - x);
        [displ_min_positive, interval_index] = min(displacement(displacement >= 0));
        if (interval_index > Nintervals)
            % We will reuse the last interval parameters.
            % Since xi must be within the xdata range, this the case
            % when xi = max(xdata)
            interval_index = Nintervals;
        end
        % The index tells which interval to use for the linear
        % approximation.
        % The line is the polynomial of the degree 1.
        % We will use the MATLAB's 'polyval' function
        % to evaluate value of the polynomial of the degree n
        % at point x: y = p_1 * x^n + p_2 * x^(n - 1) + p_n * x + p_{n + 1}
        % yi(i) = p(interval_index, 1) * xi(i) + p(interval_index, 2);
        poly_coef = p(interval_index, :);
        yi(i) = polyval(poly_coef, xi(i));
    end
end