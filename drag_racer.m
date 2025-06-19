% Drag Racer Simulation
% Models vehicle acceleration and top speed performance over an 8-meter track.
% Abdel A.


clc; clear; close all;

%% Input Parameters
Accel = 0.37;       % Acceleration (m/s^2)
velTop = 2.63;      % Top speed (m/s)
timestep = 0.1;     % Time step for simulation (seconds)

%% Initialize Arrays
vel(1) = 0;         % Initial velocity (m/s)
pos(1) = 0;         % Initial position (m)
time(1) = 0;        % Initial time (s)

i = 1;

%% Simulation Loop – until position reaches 8 meters
while pos(i) < 8

    % Stage 1 – Accelerating to top speed
    if vel(i) < velTop
        pos(i+1) = pos(i) + vel(i) * timestep + 0.5 * Accel * timestep^2;
        vel(i+1) = vel(i) + Accel * timestep;
    
    % Stage 2 – Constant velocity at top speed
    else
        pos(i+1) = pos(i) + vel(i) * timestep;  % No acceleration
        vel(i+1) = vel(i);                      % Maintain top speed
    end

    % Update time
    time(i+1) = time(i) + timestep;
    i = i + 1;
end


figure

% Subplot 1: Position vs Time
subplot(2,1,1)
plot(time, pos, 'b-', 'LineWidth', 2)
grid on
xlabel('Time (s)')
ylabel('Position (m)')
title('Drag Racer – Position Over Time')

% Subplot 2: Velocity vs Time
subplot(2,1,2)
plot(time, vel, 'r-', 'LineWidth', 2)
grid on
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Drag Racer – Velocity Over Time')
