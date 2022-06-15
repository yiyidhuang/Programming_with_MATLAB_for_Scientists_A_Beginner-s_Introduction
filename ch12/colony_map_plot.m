% plot the map of the colony evolution
colony_color_scheme = [...
    % color coded as RGB triplet
    0, 0, 0;    % color 1, black is for dead
    0, 0, 1;    % color 2, blue is for weakly contagious
    1, 0, 0;    % color 3, red is for highly contagious
    0, 1, 0;    % color 4, green is for healthy
    ];
image(member_stat_map);
set(gca, 'FontSize', 20);   % font increase
colormap(colony_color_scheme);
xlabel('Member position');
ylabel('Cycle');
