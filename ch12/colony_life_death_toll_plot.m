% only real illness counts
bar(killed_by_disease(:, [hard_to_heal_weakly_contagious, easy_to_heal_very_contagious]), ...
    'stacked'); % notice the array slicing
ylim([0, 150]);
set(gca, 'FontSize', 20); % font increase
legend('death by hard to heal but not contagious', 'death by easy to heal but highly contagious');
xlabel('Cycle number');
ylabel('Death toll');
