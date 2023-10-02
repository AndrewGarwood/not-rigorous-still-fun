% Andrew Garwood
% Coding Assignment 3

clc; close all; clear all;

% ----- Problem 1 --------------------------------------------------------

%     2   3   4
%     o---o---o 
% 1 / | \ | / | \ 5
% o---o---o---o---o------------
%     8   7   6  


% A(13x13)
% Af = b; f = 13x1 vector of unknown forces

A = readmatrix('bridge_matrix.csv');

% Assume 3 vehicles at 6 w/ 4tons, 7 w/ 8tons, 8 w/ 2tons
% so b = [0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 4]
b = [0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 4]'; % Transposed 1x13 -> 13x1

% ----- Problem 1a -----
% Solve x = A\b
A1 = A\b;

% ----- Problem 1b -----
% Find LU decomposition of A
[L, U, P] = lu(A);
A2 = L;

% ----- Problem 1c -----
% Solve Af = b using LU decomposition.
% Recall: 
% PAf = Pb; 
% LUf = Pb -> Uf = y
% Ly = Pb
% Uf = y
% LUf = b
y = L\(P * b); % P * b -> allow for back substituion
A3 = y;
f = U\y;

% ----- Problem 1d -----
% Add weight to truck in position 8. 9th entry of b. do it in increments of
% 0.01 until the bridge collapses. Each girder can withstand 30 tons of
% compression or tension (i.e. + or - forces) before breaking. Bridge will
% collaps when the largest magnitude of force in f is larger than 30. Find
% smallest weight possible = A4 and index of girder = A5

% f is vector of forces
girder_index = 0;
current_weight = 2; % current weight at position 8
unbroken = 1;


while unbroken
    
    % Increment at position 8 (9th entry of b) by 0.01 ton.
    current_weight = current_weight + 0.01;
    b(9) = current_weight;

    % Calculate new f vector .
    y = L\(P * b); % P * b -> allow for back substituion
    f = U\y;
    
    % get status of bridge.
    [unbroken, girder_index] = isBroken(f);   
    % if      unbroken = 0, we reached force magnitude of 30 exit loop
    %                       on next condition check
    % else if unbroken = 1, we have not reached breaking point yet, 
    %                       continue going through loop    
end
A4 = current_weight;
A5 = girder_index;


% ----- Problem 2 --------------------------------------------------------

% Model Oscillatory motion

% x(t) = [xx(t), y(t)]'
% Motion: Ax(t + 1) = x(t)
% A = [ 1 - a, -w ;
%       w      1 - a ];
% e.g. Ax(1) = x(0), Ax(2) = x(1)
% Assume a = -0.003, w = 0.05, x(0) = [1, -2]'
a = -.003;
w = .05;
x_0 = [1, -1]';

% ----- Problem 2a -----
% Find location of object at times 0:1000. Save x coords in 1x1001 row
% vector A6. y coords in 1x1001 row vector A7

% e.g. x(1) = A\x(0)
A = [1 - a, -w; w, 1 - a];
% Instantiate vectors, then assign initial conditions
A6 = zeros(1, 1001);
A7 = zeros(1, 1001);
A6(1) = x_0(1);
A7(1) = x_0(2);

% LU decomposition. . . faster. . .
%    y = L\(P * b); % P * b -> allow for back substituion
%    x = U\y;
[L, U, P] = lu(A);

% Initial conditions already set, start at second index
for i = 2:1001
    % Get previous x and y coordinate (t)
    prev_position = [A6(i - 1), A7(i - 1)]';
    
    % calculate new x and y coordinate (t + 1) and assign to A6 and A7 
    y = L\(P * prev_position);
    new_position = U\y;
    A6(i) = new_position(1);
    A7(i) = new_position(2);
end

% ----- Problem 2b -----
% Calculate distance from origin for each position 
% d(t) = sqrt( x(t)^2 + y(t)^2) store in 1x1001 row vector A8

A8 = zeros(1, 1001);
for i = 1:1001
    A8(i) = sqrt( (A6(i))^(2) + (A7(i))^(2) );
end  

% ----- Problem 2c -----
% Find fist time when distance from object to origin is less than 0.05
% save the time in A9 and distance in A10. Account for not 0th indexing
format long;
time = 0;
for i = 1:length(A8)
    if A8(i) < 0.05
        time = i; 
        break;
    end
end
distance = A8(time); % =  0.049985320697561; rounds to 0.05 on short format
% should be 789; initially 790th out of 1001, 
% account for 0th indexing -> subtract 1
time = time - 1; 
A9 = time;
A10 = distance;

% ----- Problem 3 --------------------------------------------------------

% object at position x = [x, y, z]'
% rotate counterclockwise by theta about yx axis, multiply 
% by rotation matrix R(theta) = [cos(theta),  0,  sin(theta);
%                                    0,       1,     0      ;
%                                -sin(theta), 0, cos(theta)];
% rotated x = y = Rx

% ----- Problem 3a -----
% Write function that takes in theta and returns matrix R(theta). then
% caclulate A10 = R(pi/10)
A11 = rotation_matrix_y(pi/10);

% ----- Problem 3b -----
% given vector x = [0.3, 1.4, -2.7]' Rotate about y axis by an angle of
% 3pi/8. result A12 should be 3x1
x = [0.3, 1.4, -2.7]';
R = rotation_matrix_y(3 * pi / 8);
A12 = R * x;

% ----- Problem 3c -----
% given y = [1.2, -0.3, 2]' that was obtained by rotating x about y axis
% by angle of pi/7. Find x
y = [1.2, -0.3, 2]';
R = rotation_matrix_y(pi / 7);
A13 = R\y;

% ----- Problem 3d -----
% Find inverse matrix of R(5pi/7)
A14 = inv(rotation_matrix_y(5 * pi / 7));

% ----- Problem 3e -----
% Find angle such that inv(R(5pi/7)) = R(phi)
% initial guess: phi = -theta = - 5pi/7
A15 = -1 * 5 * pi / 7;

% check: 
% x = [1, 0, 0]';
% R_in = rotation_matrix_y(pi / 2);
% R = rotation_matrix_y(-1 * pi / 2);
% y = R_in*x; % = 0, 0, -1
% rotate_back = R*y; % = 1, 0, 0


% Take in angle theta, output 3x3 matrix that when multiplied with a 3x1
% vector will rotate it about the y axis.
function R = rotation_matrix_y(theta)
    R = zeros(3, 3);
    
    % 1st row
    R(1, 1:end) = [cos(theta), 0, sin(theta)];
    
    % 2nd row
    R(2, 1:end) = [0, 1, 0];
    
    % 3rd row
    R(3, 1:end) = [sin(theta) * -1, 0, cos(theta)];
end

function [x, index] = isBroken(f)
    index = 0;
    for i = 1:length(f)
        if abs(f(i)) >= 30
            index = i;
            x = 0;
            return
        end
    end
    x = 1;
end