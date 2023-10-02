% written hw 9
% I wish to die
clear all; close all; clc;
a = 10;
b = 2;
theta0 = 1;
theta_dot0 = 0;

% y(t) = theta_dot(t)
% => y_dot + by + atheta = 0
% v_dot = [theta_dot; y_dot] =
% theta_dot = y
% y_dot = -a*theta - by

% => A = [0, 1; -a, -b]

A = [0, 1; -a, -b];

f = @(t, v)([ -1 * v(2); -a * v(1) - b * v(2)]);
true_solution = @(t)((1/3) .* exp(-1 .* t) .* sin(3.*t) + exp(-1 .* t) .* cos(3.*t));
t0 = 0;
T = 8;
dt = 2^-4;


fe4 = f_euler(f, t0, T, dt, true_solution, [1, 0])
fe5 = f_euler(f, t0, T, 2^-5, true_solution, [1, 0])
fe6 = f_euler(f, t0, T, 2^-6, true_solution, [1, 0])
fe7 = f_euler(f, t0, T, 2^-7, true_solution, [1, 0])
fe8 = f_euler(f, t0, T, 2^-8, true_solution, [1, 0])
fe9 = f_euler(f, t0, T, 2^-9, true_solution, [1, 0])
fe10 = f_euler(f, t0, T, 2^-10, true_solution, [1, 0])

function max_error = f_euler(f, t0, T, dt, true_solution, m0)
    t = t0:dt:T;
    n = length(t);
    V = zeros(2, n);
    V(1, 1) = m0(1);
    V(2, 1) = m0(2);
    for k = 1:n-1
        V(:, k+1) = V(:, k) + dt*f(t(k), V(:, k));
    end
    theta = V(1,:);
    max_error = max(abs(theta - true_solution(t)));
end

% (g) conclusions:
