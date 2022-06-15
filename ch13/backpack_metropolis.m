function [items_to_take, max_packed_value, max_packed_volume] = ...
    backpack_metropolis(backpack_size, volumes, values)
    % Returns the list of items which fit in the backpack and have the
    % maximum total value.
    % Solving the backpack problem with the simulated annealing (aka
    % Metropolis) algorithm.
    % backpack_size - the total volume of backpack
    % volumes - the vector of items volumes
    % values - the vector of items values

    N = length(volumes);    % number of items

    function xnew = change_x(xold)
        % x is the state vector consisting of the take or no take flags
        % (i.e. 0/1 values) for each item
        % The new vector will be generated via random mutation of every
        % take or no take flag of the old one.
        flip_probability = 1 ./ N; % in average 1 bit will be flipped
        bits_to_flip = (rand(1, N) < flip_probability);
        xnew = xold;
        xnew(bits_to_flip) = xor(xold(bits_to_flip), 1);    % xor operator 
                                                    % flips the chosen flag
        if (any(xnew ~= xold))
            % at least 1 flag is flipped, so we are good to return
            return;
        else
            % none of the flags is flipped, so we try again
            xnew = change_x(xold);  % recursive call to itself
        end
    end

    function [E, items_value, items_volume] = ...
        backpack_merit(x, backpack_size, volumes, values)
        items_volume = sum(volumes .* x);
        items_value = sum(values .* x);
        % The Metropolis algorithm is the minimization alogrithm, thus, we
        % flip the packed items value (which we are maximizaing) to make
        % the merit function to be minimization algorithm compatible.
        E = -items_value;

        % We should take care of the situations when the backpack is
        % overfilled
        if ((items_volume > backpack_size))
            % Items do not fit and backpack, i.e. bad choice of the input
            % vector 'x'.
            % We need to add a penalty.
            penalty = (items_volume - backpack_size); % Overfill penalty
            % The penalty coefficient (mu) must be quite big, but not too
            % big or we will get stack in the local minimum. Choosing this
            % coefficient require a little tweaking ad depends on size of
            % backpack, values and volumes vectors
            mu = 100;
            E = E + mu * penalty;
        end
    end

    %% Initialization
    % the current 'x' is the best one, since no other choices were checked.
    xbest = zeros(1, N);
    [Ebest, max_packed_value, max_packed_volume] = ...
        backpack_merit(xbest, backpack_size, volumes, values);
    Ncycles = 10000;    % number of annealing cycles
    kT = max(values) * 5; % should be large enough to permit even large 
                            % and non optimal merit vlues
    kTmin = min(values) / 5;    % should be smaller than the smallest 
                                % step in energy
    % we choose annealing coefficient by solving: kTmin = kT *
    % annealing_coef ^ Ncycles
    annealing_coef = power(kTmin / kT, 1 / Ncycles); % the temperature
                                                    % lowering rate
    best_energy_at_cycle = NaN(1, Ncycles); % this array is used for 
                            % illustrations of the annealing
    % the main annealing cycle
    for c = 1:Ncycles
        xnew = change_x(xbest);
        [Enew, items_value_new, items_volume_new] = ...
            backpack_merit(xnew, backpack_size, volumes, values);
        prob = rand(1, 1);
        if ((Enew < Ebest) || (prob < exp(-(Enew - Ebest)/kT)))
            % Either this point has smaller energy and we go there without
            % thinking or according to the Metropolis algorithm there is
            % the probability exp(-dE / kT) to move away from the current
            % optimum
            xbest = xnew;
            Ebest = Enew;
            max_packed_value = items_value_new;
            max_packed_volume = items_volume_new;
        end

        % anneal or cool the temperature
        kT = annealing_coef * kT;

        best_energy_at_cycle(c) = Ebest;    % Keeping track ofthe current 
                                        % best energy value
    end

    plot(1:Ncycles, best_energy_at_cycle); % the annealing illustrating plot
    xlabel('Cycle number');
    ylabel('Energy');

    % the Metropolis algorithm can return a non valid solution,
    % i.e. with combined volume larger than the volume of the backpack.
    % For simplicity, no checks are done to prevent it.
    indexes = 1:N;
    items_to_take = indexes(xbest == 1);
end