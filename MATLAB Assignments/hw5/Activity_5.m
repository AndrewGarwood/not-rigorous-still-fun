% Activity 5
% Need shotgun slug to brain stem
clc; clear all; close all;

% Create a new MATLAB or python script and define the function f(x, y) 
% from the previous problem.  The function should be named f and it should 
% take two arguments (x and y).  Copy the code you used to define the 
% function into the answer box below.  


v0 = [6; 4];

phi = @(t)(v0 - t * fgrad(v0));
f_of_phi = @(t)( fv(phi(t)) );


function fx = f(x, y)
    fx = (x - 2).^2 + (y + 1).^2 + 5 * sin(x) * sin(y) + 100;
end

function fv = fv(v)
    fv = (v(1,:) - 2).^2 + (v(2,:) + 1).^2 + 5 * sin(v(1,:)) * sin(v(2,:)) + 100; 
end

function partials = fgrad(v)
    partials(1,:) = 2 * (v(1,:) - 2) + 5 * cos(v(1,:)) * sin(v(2,:));
    partials(2,:) = 2 * (v(2,:) + 1) + 5 * sin(v(1,:)) * cos(v(2,:)); 
end



