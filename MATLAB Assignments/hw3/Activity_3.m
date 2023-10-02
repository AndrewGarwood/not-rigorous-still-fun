clc; close all; clear all;

A = [ 55, -10, -20; 
     -10,  30, -15;
     -20, -15,  65];

b = [ 20;
      10;
       5];
% Ax = b
x = A\b;

D = eye(3) * 3;
u = [1; 2; 3];
ex = solve_diagonal(D, u);

% Assume A is diagonal
function x = solve_diagonal(A, b)
% Code to find x
  for i = 1:length(b)
      x(i, 1) = b(i) / A(i, i);
  end

end