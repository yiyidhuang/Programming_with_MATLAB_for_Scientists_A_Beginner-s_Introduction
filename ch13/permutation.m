function pnew = permutation(p)
    % Generates a new permuation from the old one in such a way that new
    % one will be lexicographically larger.
    % If one wants all possible permutations, she must prearrange elements
    % of the permuation vector p in ascending order for the first input,
    % and then feed the output of this function to itself.
    % Elements of the input vector allowed to be not unique.
    %
    % See "The Art of Computer Programming, Volume 4: Generating All Tuples
    % and Permuations" by Donald Knuth for the discussion of the algorithm.
    % This implementation is optimized for MATLAB. It avoids cycles which
    % are costly during execution.

    N = length(p);
    index = 1:N;    % indexes of permutation elements

    % Looking for the largest k where p(k) < p(k + 1)
    k_candidates = index(p(1:N - 1) < p(2:N));
    if (isempty(k_candidates))
        % No such k is found thus nothing to permute.
        pnew = p;
        % We must check at the caller for this special case pnew = p as
        % condition to stop.
        % All possible permutations are probed by this point.
        return;
    end
    k = k_candidates(end);  % note special oerator 'end' the last element 
                            % of array
    % Assign the largest l such that p(k) < p(l).
    % Since we are here at least one solution is possible: l = k + 1
    index = index(k + 1: end);  % We need to gruncate the list of possible 
                                % indexes
    l_candidates = index(p(k) < p(k + 1:end));
    l = l_candidates(end);

    tmp = p(l); p(l) = p(k); p(k) = tmp; % Swap p(k) and p(l)

    % reverse the sequence between p(k + 1) and p(end)
    p(k + 1 : end) = p(end : -1 : k + 1);
    pnew = p;
end