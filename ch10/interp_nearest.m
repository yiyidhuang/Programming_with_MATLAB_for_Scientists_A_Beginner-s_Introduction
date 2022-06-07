function yi = interp_nearest(xdata, ydata, xi)
%% Interpolates by the nearest neighbor method
% xdata, ydata - known data points
% xi - points at which we want the interpolated values yi
% WARNING: no checks is done that xi values are inside xdata range

%% It is crucial to have yi preinitialized !
% It significantly speeds upthe algorithm,
% since computer does not have to reallocate memory for new data points.
% Try to comment the following line and compare the execution time
% for a large length of xi
yi = 0 .* xi;   % A simple shortcut to initialize return vector with zeros.
                % This also takes care of deciding the yi vector type (row
                % or column).

%% Finally, we interpolate.
N = length(xi);
for i = 1:N     % We will go through all points to be interpolated
    distance = abs(xdata - xi(i));
    % MATLAB's min function returns not only the minimum but its index too
    [distance_min, index] = min(distance);
    % there is a chance that 2 points of xdata have the same distance to the xi
    % so we will take the 1st one
    yi(i) = ydata(index(1));
end
end
