function gain = bet_outcome(bet_fraction, N_games)
	% We will play a very simple game:
    % one bets a 'bet_fraction' of her belongings
    % with 50/50 chance to win/lose.
    % If lucky she will get her money back quadrupled,
    % otherwise 'bet_fraction' is taken by a casino

    % arguments check
    if (bet_fraction < 0 || bet_fraction > 1)
        error('bet fraction must be between 0 and 1');
    end
    N_games = floor(N_games);
    if (N_games < 1)
		error('number of games should be bigger than 1');
    end

    p = rand(1, N_games);   % get array of random numbers
    outcome_per_game = zeros(1, N_games);

    outcome_per_game(p <= .5) = 1 + 4 * bet_fraction; % lucky games
    outcome_per_game(p > .5) = 1 - bet_fraction;    % unlucky games

    gain = prod(outcome_per_game);
end
