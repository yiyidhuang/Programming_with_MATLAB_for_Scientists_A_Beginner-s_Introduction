function [my_new_infection, infect_left_neighbor, infect_right_neighbor] ... 
    = disease_outcome(disease)
    %% For a given disease/infection (defined below) returns possible outcomes/actions.
    % The disease probabilities matrix:
    % notice that probabilities of self actions (prob_self)
    % i.e. stay ill, die, and heal shold add up to 1
    % probabilities distrbuted in a vector where each
    % positions corresponds to
    die = 1;
    heal = 2;
    % there is no 3rd element since probability of stay ill = 1 - p_die -
    % p_heal
    % array of probability to spread disease (prob_to_spread) per cycle for
    % each disease
    left = 1;
    right = 2;
    % the probabilities to infect the left or right neighbors are
    % independent,
    % the only requirement they should be <= 1
    
    % normal dead member (death is non contagious)
    prob_self(1, :) = [0.0, 0.0];   % [prob_die, prob_heal]
    prob_to_spread(1, :) = [0.0, 0.0];  % [left, right]

    % weakly contagious but high mortality, hard to heal
    prob_self(2, :) = [0.8, 0.0];
    prob_to_spread(2, :) = [0.1, 0.1];

    % highly contagious but low mortality, easy to heal
    prob_self(4, :) = [0.0, 0.0];
    prob_to_spread(4, :) = [0.0, 0.0];

    %% 1st, do we infect anyone?
    % roll the dices for the left neighbor
    p = rand();
    if (p <= prob_to_spread(disease, left))
        infect_left_neighbor = true;
    else
        infect_left_neighbor = false;
    end

    p = rand(); % reroll the dices for the right neighbor
    if (p <= prob_to_spread(disease, right))
        infect_right_neighbor = true;
    else
        infect_right_neighbor = false;
    end
    
    %% 2nd, what is our own fate?
    p = rand();
    if (p <= prob_self(disease, die))
        my_new_infection = 1; % death
    elseif (p <= (prob_self(disease, die) + prob_self(disease, heal)))
        % notice the sum!
        my_new_infection = 4; % healing, recovery to normal
    else
        my_new_infection = disease; % keep what you have
    end
end