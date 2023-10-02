% Andrew Garwood
% Coding HW 4

clc; clear all; close all;

% Consider linear system A * phi = p

% ----- Problem 1 --------------------------------------------------------

% ----- Problem 1a -----
A114 = zeros(114, 114);

% I populated the vectors in different ways. not sure why
v2 = zeros(1, 114);
v2(1:end) = 2;

v_neg1 = zeros(1, 113);
for i = 1:113
    v_neg1(i) = -1;
end

diag_2 = diag(v2);

diagPlusOne = diag(v_neg1, 1);
diagMinusOne = diag(v_neg1, -1);

A114 = A114 + diagMinusOne + diagPlusOne + diag_2;
A1 = A114;

% ----- Problem 1b -----
% Construct 114x1 vector P
p = zeros(114, 1);

for j = 1:114
    p(j) = 2 * (1 - cos(53 * pi / 115)) * sin(53 * pi * j / 115);
end
A2 = p;

% ----- Problem 2 --------------------------------------------------------
% Use jacobi method to solve for phi
% linear system A * phi = p

% Jacobi Partition
P = diag(diag(A114));
T = A114 - P;

% Get M Matrix
M = -P\T;

% ----- Problem "2c" -----
lambda = eig(M);
max_lambda  = max(abs(lambda));
A3 = max_lambda;

% ----- Problem "2d" -----
% Solve for phi using Jacobi method.

% construct initial guess
phi0 = zeros(114, 1);
phi0(:, 1) = 1;
% max_lambda is less than 1, so no infinite while loop

% designate template for previous guess and new guess
new_phi = zeros(114, 1);
% Set previous guess to phi0
prev_phi = phi0;

tolerance = 1e-5; % initialize tolerance level
error = tolerance + 1; % ensure loop runs at least once
k = 1; % indexing variable
if max_lambda < 1
    while error >= tolerance
        new_phi = P\(-T * prev_phi + p);
        error = max(abs(new_phi - prev_phi));
        k = k + 1;
        prev_phi = new_phi; % set previous guess to new one to progress!!
    end
end

% last time loop runs should give us the attempt number and final guess
final_guess = new_phi;
A4 = final_guess;
final_guess_num = k; % 10348!!!!
A5 = final_guess_num;

% ----- Problem "2e" -----

% Compare true solution to computed solution
true_solution = zeros(114, 1);
for j = 1:114
    true_solution(j) = sin(53 * pi * j / 115);
end

% test efficacy of Jacobi method, find max error beteween ...
max_error = max(abs(final_guess - true_solution));
A6 = max_error;

% ----- Problem 3 --------------------------------------------------------
% Use Gauss-Seidel method to solve for phi

% linear system A * phi = p

% GS Partition
P = tril(A114);
T = A114 - P;

% Get M Matrix
M = -P\T;

% ----- Problem "3f" -----
lambda = eig(M);
max_lambda  = max(abs(lambda));
A7 = max_lambda; % = 0.9993 => barely converge?


% ----- Problem "3g" -----
% Solve for phi using Gauss-Seidel method.


% construct initial guess
phi0 = zeros(114, 1);
phi0(:, 1) = 1;
% max_lambda is less than 1, so no infinite while loop

% designate template for previous guess and new guess
new_phi = zeros(114, 1);
% Set previous guess to phi0
prev_phi = phi0;

tolerance = 1e-5; % initialize tolerance level
error = tolerance + 1; % ensure loop runs at least once
k = 1; % indexing variable
if max_lambda < 1
    while error >= tolerance
        new_phi = P\(-T * prev_phi + p);
        error = max(abs(new_phi - prev_phi));
        k = k + 1;
        prev_phi = new_phi; % set previous guess to new one to progress!!
    end
end

% last time loop runs should give us the attempt number and final guess
final_guess = new_phi;
A8 = final_guess;
final_guess_num = k; % 6104!!!
A9 = final_guess_num;

% ----- Problem 3h -----

% test efficacy of Gauss-Seidel method, find max error beteween final guess
% and actual solution
max_error = max(abs(final_guess - true_solution));
A10 = max_error; %  = % 0.0134 about 2times better than Jacobi


% ----- Problem 4 --------------------------------------------------------
% Use Successive Over-RElaxation method to solve for phi

% A = diagonal + upperTri + lowerTri
% Then P = (1 / omega) * D + L, T = ((omega - 1) / omega) * D + U
% omega between 1 and 2. 1 => GS

D = diag(diag(A114));
L = tril(A114) - D;
U = triu(A114) - D;
omega = 1.973;

P = (1 / omega) * D + L;
T = ((omega - 1) / omega) * D + U;

% 4i
A11 = P;

% Get M Matrix
M = -P\T;

% ----- Problem "4j" -----
lambda = eig(M);
max_lambda  = max(abs(lambda));
A12 = max_lambda; % = 0.8


% ----- Problem "4k" -----
% Solve for phi using SOR method.


% construct initial guess
phi0 = zeros(114, 1);
phi0(:, 1) = 1;
% max_lambda is less than 1, so no infinite while loop

% designate template for previous guess and new guess
new_phi = zeros(114, 1);
% Set previous guess to phi0
prev_phi = phi0;

tolerance = 1e-5; % initialize tolerance level
error = tolerance + 1; % ensure loop runs at least once
k = 1; % indexing variable
if max_lambda < 1
    while error >= tolerance
        new_phi = P\(-T * prev_phi + p);
        error = max(abs(new_phi - prev_phi));
        k = k + 1;
        prev_phi = new_phi; % set previous guess to new one to progress!!
    end
end

% last time loop runs should give us the attempt number and final guess
final_guess = new_phi;
A13 = final_guess;
final_guess_num = k % = 2525!!!
A14 = final_guess_num;

% ----- Problem 3i -----

% test efficacy of Gauss-Seidel method, find max error beteween final guess
% and actual solution
max_error = max(abs(final_guess - true_solution))
A15 = max_error; %  about 0.0045





