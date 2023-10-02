% Andrew Garwood
% Written Homework 3

clc; close all; clear all;

% ----- Problem 1 --------------------------------------------------------
% errors and stuff

% ----- Problem 1a -----
a = 1e21 - (1e21 - 1e5);
b = (1e21 - 1e21) + 1e5;
abs(a - b);

% abs(a - b) = 31072. I think this is a significant error; These values should be the same, but
% because of rounding errors. a is around 30 percent off its "expected"
% value.

% use LU Decomposition to do large calculation.

% consider A
A = [10e-20, 1; 1, 1];

% 1b find condition number of A
cond(A)

% 1c LU decomp (no pivoting)
L = [1    , 0; 
     10e20, 1];
U = [10e-20, 1;
     0     , 1 - 10e20];
% LU = 
% [1    , 0; * [10e-20, 0]' + [1    , 0; * [1, 1 - 10e20]'
%  10e20, 1]                   10e20, 1 ] 
% LU = 
% [10e-20, 1]' + ([1, 10e20]' + [0, 1 -10e20]')
% LU =
% [10e-20, 1]' + ([1, 1]')
% LU = 
% [10e-20, 1; 1, 1]
%   
% This is what I got:
%
%   1.0e+02 *
%
%   0.000000000000000   0.010000000000000
%   1.000000000000000                   0
%
% I do not believe that this is close to A. This demonstrates that
% catastrophic cancellation can drastically change the elements of the
% matrix which will ruin calculations we do when solving problems
%
%
% 1d B = [1, 1; 10e-20, 1]
B = [1, 1; 10e-20, 1];
L = [1, 0; 10e-20, 1];
U = [1, 1; 0, 1 - 10e-20];
% ans =
% 
%    1.000000000000000   1.000000000000000
%    0.000000000000000   1.000000000000000
% upon inspection, LU(2, 1) = 1e-19
% So yes this is pretty damn close. we seemed to have avoided the 
% catastrophic cancellation by not having 10e20 in our decomposition, this
% eliminated the error that would have arisen when operating with it.

% 1e 
% use lu function
% [L, U, P] = lu(A);
% L =
%    1.000000000000000                   0
%    0.000000000000000   1.000000000000000
% U =
%      1     1
%      0     1
% P =
%      0     1
%      1     0
%
% [L, U, P] = lu(B)
% L =
%    1.000000000000000                   0
%    0.000000000000000   1.000000000000000
% U =
%      1     1
%      0     1
% P =
%      1     0
%      0     1
% We end up with the same matrices from part d for both decompositions,
% this demonstrates that the permutation matrix P rearranges the rows such
% that we (hopefully) avoid catastrophic cancellation.

% ----- Problem 2 --------------------------------------------------------
% see other script


