function r = lcgrand(Nrows, Ncols, a, c, m, seed)
    % Linear Congruential Generator - pseudo random number generator
    r = zeros(Nrows, Ncols);
    r(1) = seed; % This eqivalent to r(1, 1) = seed;

    for i = 2:Nrows * Ncols
        r(i) = mode((a * r(i - 1) + c), m);
        % notice r(i) and r(i - 1)
        % there is  a way to address multidimensional array
        % with only one index
    end
    r = r / (m - 1); % normalization to [0, 1] interval
end