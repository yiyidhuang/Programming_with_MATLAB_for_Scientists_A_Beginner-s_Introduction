function [t, x, y, vx, vy] = ...
    ode_projectile_with_air_drag_model()
    %% Solves the equation of motions for a projectile
    % r'' = F = Fg + Fd
    % Where r is the radius vector, Fg is the gravity pull force, and Fd is
    % the air drag force.
    % The above equation can be decomposed to x and y projections
    % x'' = Fd_x
    % y'' = -g + Fd_y
    % Fd = 1/2 * rho * v^2 * Cd * A is the drag froce magnitude
    % where v is speed.
    % The drag force directed against the velocity vector
    % Fd_x = - Fd * v_x / v; % vx / v takes care of the proper sign of the
    % drag projection
    % Fd_y = 0 Fd * v_y / v; % vy / v takes care of the proper sign of the
    % drag projection
    % where vx and vy are the velocity projections
    % at the first look it does not look like ODE but since x and y depends
    % only on t. it is actually a system of ODEs
    % transform system to the canonical form
    % x -> y1
    % vx -> y2
    % y -> y3
    % vy -> y4
    % t -> x
    %
    % f1 -> y2
    % f2 -> Fd_x
    % f3 -> y4
    % f4 -> -g + Fd_y
    % Some constants
    rho = 1.2;  % the density of air kg/m^3
    Cd = .5;    % an arbitrary choice of the drag coefficient
    m = 0.01;   % the mass of the projectile in kg
    g = 9.8;    % the acceleration due to gravity
    A = .25e-4; % the area of the projectile in m^2, a typical bullet is 5mm x 5mm

    function fvec = projectile_forces(x, y)
        % it is crucial to move from the ODE notation to the human notation
        vx = y(2);
        vy = y(4);
        v = sqrt(vx ^ 2 + vy ^ 2);  % the speed value

        Fd = 1 / 2 * rho * v^2 * Cd * A;

        fvec(1) = y(2);
        fvec(2) = -Fd * vx/v/m;
        fvec(3) = y(4);
        fvec(4) = -g - Fd * vy/v/m;

        % To make matlab happy we need to return a column vector.
        % So, we transpose (note the dot in .')
        fvec = fvec.';
    end

    %% Problem parameters setup:
    % We will set initial conditions similar to a bullet fired from a rifle
    % at 45 degree to the horizon.
    tspan = [0, 80];    % time interval of interest
    theta = pi / 4;     % the shooting angle above the horizon
    v0 = 800;           % the initial projectile speed in m/s
    y0(1) = 0;          % the initial x position
    y0(2) = v0 * cos(theta);    % the initial vx velocity projection
    y0(3) = 0;          % the initial y position
    y0(4) = v0 * sin(theta);    % the initial vy velocity projection

    % We are using matlab solver
    [t, ysol] = ode45(@projectile_forces, tspan, y0);

    % Assigning the human readable variable names
    x = ysol(:,1);
    vx = ysol(:,2);
    y = ysol(:,3);
    vy = ysol(:,4);
    v = sqrt(vx.^2 + vy.^2);    % speed

    % The analytical drag-free motion solution.
    % We should not be surprised by the projectile deviation from this
    % trajectory
    x_analytical = y0(1) + y0(2) * t;
    y_analytical = y0(3) + y0(4) * t - g / 2 * t .^ 2;
    v_analytical = sqrt(y0(2) .^ 2 + (y0(4) - g * t) .^ 2); % speed

    ax(1) = subplot(2, 1, 1);
    plot(x, y, 'r-', x_analytical, y_analytical, 'b-');
    set(gca, 'fontsize', 14);
    xlabel('Position x component, m');
    ylabel('Position y component, m');
    title('Trajectory');
    legend('with drag', 'no drag', 'Location', 'SouthEast');

    ax(2) = subplot(2, 1, 2);
    plot(x, v, 'r-', x_analytical, v_analytical, 'b-');
    set(gca, 'fontsize', 14)
    xlabel('Position x component, m');
    ylabel('Speed');
    title('Speed vs. the x position component');
    legend('with drag', 'no drag', 'Location', 'SouthEast');
    linkaxes(ax, 'x'); % very handy for related subplots
end
