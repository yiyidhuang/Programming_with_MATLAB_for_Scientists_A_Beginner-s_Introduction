two_cos;

n = (1:N) - 1;  % shifting n from MATLAB to the DFT notation

plot(n, abs(Y_normalized), 'bo');
fontSize = FontSizeSet; set(gca, 'FontSize', fontSize);
xlabel('Index n');
ylabel('|Y_n| / N');
