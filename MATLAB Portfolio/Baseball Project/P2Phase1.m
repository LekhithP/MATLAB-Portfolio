% Project 2 Phase 1

% Phase 1 requires the Computation of x(t) and y(t) numerically, using the
% net force on the baseball, without air resistance, but treating the net
% force as non-constant, and using the analytic time of flight to determine
% the upper limit of time t. Then, compare the numeric solutions to the
% analytic solutions. Finally, plot two trajectories, y vs. x, one analytic
% and one numeric.

clear; clf;

% Given information
R0 = 141.096; % range of HR, meters
v0 = 116; % exit velocity, mph
angle = 28; % launch angle, degrees

% Initial values
x0 = 0; y0 = 0;
g = 9.81; % gravity, m/s^2

% Conversion factors
speedconvert = 0.44704; % mph to m/s conversion
convertrad = pi/180; % degrees to radians

% Initial conditions
v0mps = v0 * speedconvert; % initial speed, m/s
angle = angle * convertrad; % launch angle, radians

% Complements of velocity
v0x = v0mps * cos(angle); 
v0y = v0mps * sin(angle); 

% Baseball mass
mass = 0.145; % in kg

% Analytical computation of trajectory
tH = v0y/g; % time to reach max height
tL = 2*tH; % time to land

H = tH * v0y / 2; % max height
R = v0x * tL; % range

% Range estimate check
check_r = 100 * (R - R0) / R0;

% Analytical solution
tmin = 0; tmax = tL;
N = 2000; % intervals

t = linspace(tmin, tmax, N+1); % time array

xa = x0 + v0x * t; % analytical x(t)
ya = y0 + v0y * t - 0.5 * g * t.^2; % analytical y(t)

% Numerical solution
dt = (tmax - tmin) / N;

xn = zeros(1, N+1); % position x as a function of time
yn = zeros(1, N+1); % position y as a function of time
xn(1) = x0; % initial position x
yn(1) = y0; % initial position y

fprintf('\nAnalytical and Numerical Results:\n');

for n = 1:N
    Fg = -mass * g; % Force due to gravity
    
    % Forces and accelerations
    Fx = 0; % force in x-direction
    Fy = Fg; % force in y-direction (gravity only)

    ax = Fx / mass; % acceleration in x-direction
    ay = Fy / mass; % acceleration in y-direction
    
    % Update speeds and positions using numerical integration
    vx = v0x + ax * dt; % x-component of velocity
    vy = v0y + ay * dt; % y-component of velocity
    
    xn(n+1) = xn(n) + vx * dt; % new x position
    yn(n+1) = yn(n) + vy * dt - 0.5 * g * dt^2; % new y position
    
    v0x = vx; % update initial velocity for the next iteration
    v0y = vy;
end

fprintf('\nUpper Time Limit: %.3f s\n', tL);

% Numerical solution check
y_check = max(yn - ya)
x_check = max(xn - xa)

% Plots
plot(xa, ya, xn, yn, '--', 'LineWidth', 2);

grid on;
ax = gca; ax.FontSize = 14;

xlabel('x (m)', 'FontSize', 16);
ylabel('y (m)', 'FontSize', 16);

title({'ECE 202 Project 2 Phase 1',...
    'Projectile Motion of a Baseball',...
    'Analytical vs. Numerical Trajectory'}, 'FontSize', 18);

legend('Analytical', 'Numerical', 'FontSize', 16);