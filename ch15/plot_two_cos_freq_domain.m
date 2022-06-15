two_cos;

freq = fourier_frequencies(f_s, N); % Y(i) has frequency freq(i)

plot(freq, abs(Y_normalized), 'bo');
fontSize = FontSizeSet; set(gca, 'FontSize', fontSize);
xlabel('f_n, Hz');
ylabel('|Y(f_n)| / N');
