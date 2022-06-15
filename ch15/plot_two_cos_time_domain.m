two_cos;
%% This will be used to provide the guide for the user
t_envelope = linspace(t_start, t_end, 10 * N);
y_envelope = f(t_envelope);
plot(t_envelope, y_envelope, 'k-', t, y, 'bo');
fontSize = FontSizeSet; set(gca, 'FontSize', fontSize);
xlabel('Time, X');
ylabel('y(t) and y(t_k)');
legend('y(t)', 'y(t_k)');
