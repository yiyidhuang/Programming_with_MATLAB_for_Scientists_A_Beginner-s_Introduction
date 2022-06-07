
function Av = accountValue(Ms, p, N)
% calculates grows of the initial account value (Ms)
% in the given amount of years (N)
% for the bank interest percentage(p)

% We sanitize input the ensure that stop condition is possible
    if (N < 0)
        error('Provide positive and integer N value');
    end
    if (N ~= floor(N))
        error('N is not an integer number')
    end

% Do we meet stop condition
    if (N == 0)
        Av = Ms;
        return
    end
    Av = (1 + p/100) * accountValue(Ms, p, N - 1);
end
