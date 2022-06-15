%% time dependence governing parameters
Displacement = -0.1;
f_one = 10; A_one = .7;
f_two = 30; A_two = .2;
f = @(t)Displacement + A_one * cos(2 * pi * f_one * t) + ...
        A_two * cos(2 * pi * f_two * t + pi / 4);

%% time parameters
t_start = 0;
T = 5 / f_one;  % should be longer than the slowest component period
t_end = t_start + T;

% sampling frequency should be more than twice faster than the fastest
% component
f_s = f_two * 4;
dt = 1 / f_s;   % spacing between sample points times
N = T / dt; % total number of sample points

t = linspace(t_start + dt, t_end, N);   % sampling times
y = f(t);   % total number of sample points

%% DFT via the Fast Fourier Transform algorithm
Y = fft(y);
Y_normalized = Y / N; % number of samples independent normalization

