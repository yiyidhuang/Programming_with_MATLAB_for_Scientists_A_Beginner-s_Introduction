function [best_route, shortest_distance] = traveler_comb(x, y)
% x - cities x coordinates 
% y - cities y coordinates

% helper function
function dist = route_distance(route)
    dx = diff(x(route));
    dy = diff(y(route));
    dist = sum(sqrt(dx .^ 2 + dy .^ 2));
end

% Initialization
N = length(x);  % number of cities
init_sequence = 1:N;

p = init_sequence(2:N - 1); % since we start at the 1st city and finish 
                            % in the last
pold = p * 0;   % pold MUST not be equal to p
route = [1, p, N]; % any route is better than none
best_route = route;
shortest_disance = route_distance(route);
% Show the initial route with the fist and the last cities marked with 'x'
plot(x(1), y(1), 'x', x(N), y(N), 'x', ...
    x(2:N - 1), y(2:N - 1), 'o', x(route), y(route), '-');

while(any(pold ~= p))  % As long as the new permutation is different from 
                        % the old one
    % Notice the 'any' operator above.
    pold = p;
    p = permutation(pold);
    route = [1, p, N];
    dist = route_distance(route);
    if (dist < shortest_distance)
        shortest_distance = dist;
        best_route = route;
        % Uncomment the following lines to see the currently best route
        % plot(x(1), y(1), 'x', x(N), y(N), 'x', x(2:N - 1), y(2:N - 1), 
        % 'o', x(route), y(route), '-');
        % drawnow; % forces the figure update
    end
end

% plot all the cities and the best route
plot(x(1), y(1), 'x', x(N), y(N), 'x', x(2:N-1), y(2:N-1), 'o', ...
    x(best_route), y(best_route), '-')
end
