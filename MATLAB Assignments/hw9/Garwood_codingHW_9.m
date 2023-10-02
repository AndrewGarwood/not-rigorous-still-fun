% Garwood Coding HW 9
% I'm back I guess
clear all; close all; clc;
% Problem 1

a = 0.7;
b = 1;
tao = 12;

dt = 0.5;
t = 0:dt:100;
n = length(t);


% external electrical current
I = @(t)((1/10) * (5 + sin(pi * t * (1/10))));

f = @(t, y)([y(1) - (1/3) * y(1)^3 - y(2) + I(t); (a + y(1) - b * y(2)) / tao]);

y0 = [1; 0];

Y = zeros(2, n);
Y(:, 1) = y0;

% RK2
for k = 1:n-1
    f1 = f(t(k), Y(:, k)); % f1 = f(t_k, x_k) 
    Y(:, k+1) = Y(:, k) + dt * f(t(k) + dt/2, Y(:, k) + (dt/2) * f1);
end

%  plot(t, Y(1,:))

% Problem 1a
% voltages at time t, 1x201
V = Y(1, :);
A1 = V;

% Problem 1b 
% Find what time voltage FIRST reaches maximum



max_voltage = V(1);
index_of_max_voltage = 1; % index of max will give index of time

% find max in range(1, 20) use graph to see that it should be between 1 and
% 10.
for i = 2:20
    if V(i) > max_voltage
        max_voltage = V(i);
        index_of_max_voltage = i;
    end
end
first_max_voltage_time = t(index_of_max_voltage);
A2 = first_max_voltage_time;

% tried fminsearch but struggled

% Problem 1c, when does voltage reach second peak?
max_voltage = V(75);
index_of_max_voltage = 75; % index of max will give index of time

% use graph to see that time should be between 40 & 50 => index 80 and 100
for i = 76:105
    if V(i) > max_voltage
        max_voltage = V(i);
        index_of_max_voltage = i;
    end
end
second_max_voltage_time = t(index_of_max_voltage);
A3 = second_max_voltage_time;

% Problem 1d, calculate firing rate
% firing rate = 1 / firing period
% firing period = distance between two adjacent peaks = abs(first - second)

rk2_firing_period = abs(second_max_voltage_time - first_max_voltage_time);
rk2_firing_rate = 1 / rk2_firing_period;
A4 = rk2_firing_rate; % = 0.023, period = 43.5

% Problem 1e Solve system using rk4
% same time parameters
dt = 0.5;
t = 0:0.5:100;
n = length(t);

Y = zeros(2, n);
y0 = [1; 0]; % same....
Y(:, 1) = y0;

for k = 1:n-1
    f1 = f(t(k), Y(:, k));
    f2 = f(t(k) + dt/2, Y(:, k) + (dt/2)*f1);
    f3 = f(t(k) + dt/2, Y(:, k) + (dt/2)*f2);
    f4 = f(t(k) + dt, Y(:, k) + dt*f3);
    Y(:, k+1) = Y(:, k) + (dt/6)*(f1 + 2*f2 + 2*f3 + f4);
end

% Problem 1e ctd
% voltages at time t, 1x201
V = Y(1, :);
A5 = V;

max_voltage = V(1);
index_of_max_voltage = 1; % index of max will give index of time

% find max in range(1, 20) use graph to see that it should be between 1 and
% 10.
for i = 2:20
    if V(i) > max_voltage
        max_voltage = V(i);
        index_of_max_voltage = i;
    end
end
first_max_voltage_time = t(index_of_max_voltage);
A6 = first_max_voltage_time;
% A6 - A2 % A6 - A2 = 0.5


% Problem 1f, when does voltage reach second peak?
max_voltage = V(75);
index_of_max_voltage = 75; % index of max will give index of time

% use graph to see that time should be between 40 & 50 => index 80 and 100
for i = 76:105
    if V(i) > max_voltage
        max_voltage = V(i);
        index_of_max_voltage = i;
    end
end
second_max_voltage_time = t(index_of_max_voltage);
A7 = second_max_voltage_time;
% A7 - A3 = 0
% Problem 1h, calculate firing rate
% firing rate = 1 / firing period
% firing period = distance between two adjacent peaks = abs(first - second)

rk4_firing_period = abs(second_max_voltage_time - first_max_voltage_time);
rk4_firing_rate = 1 / rk4_firing_period;
A8 = rk4_firing_rate; % = 0.0227, period = 44
% rk4_firing_rate - rk2_firing_rate = -0.00026123

% Problem 2 Boundary Value Problem -------------------------
% x'' + x = 5cos(4t)

T = 6; % end time
dt = 0.1;
t = (0:dt:T)';
% set boundary conditions
x0 = 1;
xT = 0.5;
n = length(t);

v = -2*ones(n-2, 1); % set 2s along diagonal of matrix
u = ones(n-3, 1); % set 1s above and below diagonal of matrix,
A = (1/dt^2)*(diag(v) + diag(u, 1) + diag(u, -1));


% Note that the x in the equation requires us to add a matrix to the
% equation
I = eye(n - 2);

b = zeros(n-2, 1); 
% set interior values
for i = 1:length(b)
    b(i) = 5 * cos(4 * t(i));
end

b(1) = b(1) - x0/dt^2; % add boundary conditions
b(end) = b(end) - xT/dt^2;

A9 = A + I;
A10 = b;
% solve for x
x_int = (A + I)\b;
x = zeros(n, 1);
x(1) = x0;
for i = 2:length(x) - 1
    x(i) = x_int(i - 1);
end
x(end) = xT;
A11 = x;
    
% % 2c find max error between approx and true
C1 = ((1/3) + (1/3) * cos(24) - (4/3) * cos(6)) / sin(6);
C2 = 4/3;
x_true_solution = @(t)(C1 * sin(t) + C2 * cos(t) - (1/3) * cos(4 * t));

max_error = max(abs(x - x_true_solution(t)));
A12 = max_error; % = 1.5580

% 2d -----------------
T = 6; % end time
dt = 0.01;
t = (0:dt:T)';
% set boundary conditions
x0 = 1;
xT = 0.5;
n = length(t);

v = -2*ones(n-2, 1); % set 2s along diagonal of matrix
u = ones(n-3, 1); % set 1s above and below diagonal of matrix,
A = (1/dt^2)*(diag(v) + diag(u, 1) + diag(u, -1));


% Note that the x in the equation requires us to add a matrix to the
% equation
I = eye(n - 2);

b = zeros(n-2, 1); % set interior values 
for i = 1:length(b)
    b(i) = 5 * cos(4 * t(i));
end
b(1) = b(1) - x0/dt^2; % add boundary conditions
b(end) = b(end) - xT/dt^2;

% 1e solve for x
x_int = (A + I)\b;
x = zeros(n, 1);
x(1) = x0;
for i = 2:length(x) - 1
    x(i) = x_int(i - 1);
end
x(end) = xT;
A13 = x;

% 1f max error
max_error = max(abs(x - x_true_solution(t)));
A14 = max_error; % =1.5776

% 1g find ratio between the two calculaitons
A15 = A12/A14;









% 
