% Andrew Garwood
% Coding HW 5

% qing shale wo
clc; clear all; close all;
% Problem 1 -------------------------------------------------------------

% Newton's Method.

tolerance = 1e-8; % instantiate tolerance
x0 = 2; % initial guess

% Problem 1a -----
f = @(x)(x^2);
fprime = @(x)(2 * x);
fdprime = @(x)(2); % just return 2.
[num_guesses_1a, x_star_1a, X_1a] = newton_min(f, fprime, fdprime, x0, tolerance);
A1 = num_guesses_1a;
A2 = x_star_1a;

% Problem 1b -----
f = @(x)(x^500);
fprime = @(x)(500 * x^499);
fdprime = @(x)(500 * 499 * x^498);
[num_guesses_1b, x_star_1b, X_1b] = newton_min(f, fprime, fdprime, x0, tolerance);
A3 = num_guesses_1b;
A4 = x_star_1b;

% Problem 1c -----
f = @(x)(x^1000);
fprime = @(x)(1000 * x^999);
fdprime = @(x)(1000 * 999 * x^998);
[num_guesses_1c, x_star_1c, X_1c] = newton_min(f, fprime, fdprime, x0, tolerance);
A5 = num_guesses_1c;
A6 = x_star_1c;

% Problem 1d -----
% golden search
a = -2;
b = 2;
c = (-1 + sqrt(5)) / 2;
[f_calls_1d, x_star_1d] = golden_section_search(f, a, b, c, tolerance);
A7 = f_calls_1d;
A8 = x_star_1d;

% Problem 2 -------------------------------------------------------------
% Multidrug therapy
C = @(t)(1.3 * (exp( -1 * t / 11) - exp(-4 * t / 3)));
% find max concentration = > multiply by -1
t_star = fminbnd(@(t)(-C(t)), 0, 100);
A9 = t_star;
max_C = C(t_star);
A10 = max_C;

% Problem 3 -------------------------------------------------------------
% two min, one max
h = @(x)(-1 .* (1 ./ ((x - .3).^2 + .01) + 1 ./ ((x - .9).^2 + .04) + 6)); 

min = fminbnd(h, 0, 0.5);
% xplot = linspace(0, .5, 100);
% yplot = h(xplot);
% plot(xplot, yplot);
A11 = min;

max = fminbnd(@(x)(-h(x)), 0.5, 0.8);
% xplot = linspace(.5, .8, 100); by plot, we lookin for max
% yplot = h(xplot);
% plot(xplot, yplot);
A12 = max;

min = fminbnd(h, .8, 2); % negate h to find max
% xplot = linspace(.8, 2, 100); by plot, we looking for min
% yplot = h(xplot);
% plot(xplot, yplot);
A13 = min;

% Problem 4 -------------------------------------------------------------
% Himmelblau's Function
f = @(v)( (v(1)^2 + v(2) - 11)^2 + (v(1) + v(2)^2 - 7)^2);
minima = fminsearch(f, [-2, 3]);
A14 = minima'; % transpose to get 2 x 1 column vector0

maximum = fminsearch(@(v)(-f(v)), [0, 0]); % negate to find max
A15 = maximum';


% golden section search. .. . 
function [f_calls, x_star] = golden_section_search(f, a, b, c, tolerance)
    x = c * a + (1 - c) * b;
    fx = f(x);
    y = (1 - c) * a + c * b;
    fy = f(y);
    f_calls = 2;
    intolerable = true;
    % recall a<x<y<b
    while intolerable
        if fx < fy
            % assign new bounds, throw away right side
            b = y; 
            y = x;
            fy = fx;
            x = c * a + (1 - c) * b;
            fx = f(x);
            f_calls = f_calls + 1;
        else % fy <= fx
            % assign new bounds, throw away left side
            a = x;
            x = y;
            fx = fy;
            y = (1 - c) * a + c * b;
            fy = f(y);
            f_calls = f_calls + 1;
        end
        
        if abs(b - a) < tolerance % found x_star
            intolerable = false;
            x_star = b;
            % break;
        end
    end
end

% Newton's Method; storing all guesses
function [num_guesses, x_star, X] = newton_min(f, fprime, fdprime, x0, tolerance)
    k = 1;  
    X(k) = x0;
    num_guesses = 1;
    intolerable = true;
    % prev = initial_guess;
    while intolerable
        X(k + 1) = X(k) - fprime(X(k)) / fdprime(X(k));
        num_guesses = num_guesses + 1;
        if abs(fprime(X(k + 1))) < tolerance
            intolerable = false; % redundant since we gonna break
            x_star = X(k + 1);
            % break;
        end
        k = k + 1; % Increment K!!!!
    end
    % num_guesses = length(X);
end