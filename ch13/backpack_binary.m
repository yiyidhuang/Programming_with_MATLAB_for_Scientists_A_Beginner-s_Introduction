function [items_to_take, max_packed_value, max_packed_volume] = ...
    backpack_binary(backpack_size, volumes, values)
% Returns the list of items which fit in backpack and have maximum total
% value
% backpack_size - the total volume of the backpack
% volumes - the vector of items volumes
% values - the vector of items values

% We need to generate vector x which holds designation:
% take or do not take for each item.
% For example x = [1, 0, 0, 1, 1] means take only 1st, 4th and 5th items.
% To generate all possible cases, go over all possible combos of 1 and 0
% It is easy to see the similarity to the binary number presentation.
% We will start with x = [0, 0, 0, ..., 1] and add 1 to the last element
% accroding to the binary arithmetic rules until we reach 
% x = [1, 1, 1, ..., 1] and then x = [0, 0, 0, ..., 0], which is the
% overfilled [111..1] + 1.
% This routine will sample all possible combinations.

% nested function does the analog to the binary 1 addition 
function xout = add_one(x)
    xout = x;
    for i = N:-1:1
        xout(i) = x(i) + 1;
        if (xout(i) == 1)
            % We added 1 to 0. There is no overfill, and we can stop here.
            break;
        else
            % We added 1 to 1. According to the binary arithmetic, it is
            % equal to 10.
            % We need to move the overfilled 1 to the next digit.
            xout(i) = 0;
        end
    end
end

% Initialization
N = length(values); % The number of items
xbest = zeros(1, N);    % We start with empty backpack, as the current best
max_packed_value = 0;   % The empty backpack has zero value

x = zeros(1, N);    x(end) = 1; % assining 00000..001 the very first choice 
                                % set
while ( any(x~=0) ) % while the combination is not [000..000]
    items_volume = sum(volumes .* x);
    items_value = sum(values .* x);
    if ((items_volume <= backpack_size) && (items_value > max_packed_value))
        xbest = x;
        max_packed_value = items_value;
        max_packed_volume = items_volume;
    end
    x = add_one(x);
end

indexes = 1:N;
items_to_take = indexes(xbest == 1);    % Converting x in the human notation
end
