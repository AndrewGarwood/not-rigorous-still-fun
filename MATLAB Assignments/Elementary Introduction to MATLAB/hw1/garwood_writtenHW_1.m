% Andrew Garwood
% Written Homework 1


clear all; close all; clc;
format long;
x = 3.1416;
y = 3.141592653589793238462643383279502884197;
z = pi;
% digits
% vpa(pi) Variable-Precision Arithmetic


clear all; close all; clc;
x = -5:0.1:5;
s = sin(x);
T1 = x;
T2 = x  - (x.^3) / factorial(3);
T3 = T2 + (x.^5) / factorial(5);
T4 = T3 - (x.^7) / factorial(7);
figure()
hold on
plot(x, T1, 'DisplayName', '1st Taylor Polynomial', 'LineWidth', 1.25); %  
plot(x, T2, 'DisplayName', '2nd Taylor Polynomial', 'LineWidth', 1.25); %      
plot(x, T3, 'DisplayName', '3rd Taylor Polynomial', 'LineWidth', 1.25); %   
plot(x, T4, 'DisplayName', '4th Taylor Polynomial', 'LineWidth', 1.25); %
plot(x, s, 'DisplayName', 'sin(x)', 'LineWidth', 1.25);
% plot(x, y, 'bo') % blue circles on line b = blue o = circle
hold off
xlabel('x')
ylabel('y')
title('Plot of sin(x) and Taylor polynomials 1 through 4')

legend('FontSize', 10)

