% Andrew Garwood
% Written hw 3 problem 2

clc; clear all; close all;

% 2a
A = readmatrix('example_matrix.csv');

% 2b
r1 = zeros(1, 100);
tic
for i = 1:100
    b = rand(3000, 1);
    x = A\b;
    r = A * x - b;
    r1(i) = max(abs(r));
end
t_b = toc
r1_average = mean(r1)


% pre e Elapsed time is 29.775509 seconds.
% t_b = 29.775509;

% 2c now use LU decomp
r2 = zeros(1, 100);
tic
[L, U, P] = lu(A);
for i = 1:100
    b = rand(3000, 1);
    y = L\(P * b);
    x = U\y;
    r = A * x - b;
    r2 = max(abs(r));
end
t_c = toc 
r2_average = mean(r2)

% pre e = 2.054032800000000

% % 2d Ax = b   x = A_inv * b
r3 = zeros(1, 100);
tic
A_inv = inv(A);
for i = 1:100
    b = rand(3000, 1);
    x = A_inv * b;
    r = A * x - b;
    r3(i) = max(abs(r));
end
t_d = toc
r3_average = mean(r3)

% pre e = 0.846639800000000

% 2e
% compare accuracy of algo.
%          time          average residual
%-----------------------------------------------
% GE 30.623165000000000  7.865930129469233e-15
% LU  2.587481200000000  3.119726699196690e-14
% INV 1.226056100000000  1.845068542394302e-13

% 2g
% For speed, the inverse method is the fastest. LU is somewhat close, it's
% about twice as long. GE is not close.

% 2h
% for accuracy only, I would choose GE because it has the smallest average
% residual. LU is one magnitude (10 times) larger than GE, Inverse is 100 
% times larger than GE.

% 2i
% If I wanted to balance speed and accuracy, I'd choose LU decomposition.

% 2j
% Yes, this is important and will affect the results. LU decomposition has 
% O(n^3) runtime and Matrix inversion has O(n^3) runtime. So if we increase
% the size complexity by a lot then it will have more drastic effects on
% performance.

% 2k
% oh dear what to say. Perhaps we could instead time each x = A\b operation
% rather than the whole loop. And then sum the results at the end. I think
% this will be more precise. Why you ask? well my brilliant intuition tells
% me so. Well. My thinking is that there is more opportunity for background
% processes to affect our measurements if we have a single measurement for
% the for loops. 



    
    
    
    
