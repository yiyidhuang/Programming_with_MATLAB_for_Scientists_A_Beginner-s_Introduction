%% We are solving y '' = -g, i.e. free fall motion

% Initial conditions
y0 = [500, 15]; % We start from the height of 500m and our 
                % initial velocity is 15 m/s
% independent variable 'x' has the meaning of time in our case
timespan = [0, 13]; % free fall for duration of 13 seconds

Npoints = 20;

%% Solve the ODE
[time, y] = odeeuler(@free_fall_forces, timespan, y0, Npoints);
% We can use MATLAB's built-ins, for example ode45.
% In this case, we should omit Npoints. See the line below.
% [time, y] = ode45(@free_fall_forces, timespan, y0);

%% Calculating the analytical solution
g = 9.8;
yanalytical = y0(1) + y0(2) * time - g / 2 * time .^ 2;
vanalytical = y0(2) - g * time;

%% Plot the results
subplot(2, 1, 1);
plot(time, y(:, 1), '-', time, yanalytical, 'r-');
set(gca, 'fontsize', 20);
legend('numerical', 'analytical');
xlabel('Time, S');
ylabel('y-position, m');
title('Position vs. time');
grid on;
subplot(2, 1, 2);
plot(time, y(:, 2), '-', time, vanalytical, 'r-');
set(gca, 'fontsize', 20);
legend('numerical', 'analytical');
xlabel('Time, S');
ylabel('y-velocity, m/s');
title('Velocity vs. time');
grid on;
