clc; close all; clear all;
format long;
% f = @(x)(x - 2.421875)*(x - 9);
% f(9);
% f(7.25);

% q7 -----
% a = 0;
% b = 8;
% x = (a + b) / 2;
% if f(x) == 0
%     return
% elseif f(x) > 0
%     a = x
% else
%     b = x
% end
% f = @(x)((x - 2.421875)*(9 - x));
f = @(x)(sin(x));
a = 2;
b = 5;
tolerance = 1e-8; 
N = 50;
% fprintf('f(2) = %f\n', f(2));
% fprintf('f(5) = %f\n', f(5));
% final_x = 0;
% final_f = 1;
% for i = 1:N
%     fprintf('i = %f | ', i);
%     x = (a + b) / 2;
%     final_x = x;
%     if abs(f(x)) < tolerance
%         fprintf('Found a root, x = %f | ', x);
%         fprintf('f(x) = %f \n', f(x));
%         final_f = f(x);
%         break
%     elseif sign(f(x)) == sign(f(a))
%         a = x;
%     else
%         b = x;
%     end
%     fprintf('x = %f | ', x); 
%     
%     fprintf('f(x) = %f \n', f(x));
% end
% 
% fprintf('final_x = %f | ', final_x);

% a = 0;
% b = 18;
% x = vise(f, a, b);
% x = vise(f, a, b)
% 
% function x = vise(f, a, b)
%     % assume f, a, and b are already defined
%     x = (a + b) / 2;
%     if f(x) == 0
%         return
%     elseif f(x) > 0
%         a = x;
%     else
%         b = x;
%     end
% end

% f = sin(x)
x = bisection_method(f, a, b, tolerance);

f1 = @(x)((x - 2.421875)*(9 - x));
x1 = bisection_method(f1, 0, 8, tolerance);
function x = bisection_method(f, a, b, tolerance)
    % I'm not sure if I am setting the number of loop iterations correctly.
    % I'm thinking it should be a function argument or something
    N = 100;
    for i = 1:N
        fprintf('i = %f | ', i);
        x = (a + b) / 2;
        if abs(f(x)) < tolerance
%             fprintf('Found a root, x = %f | ', x);
%             fprintf('f(x) = %f \n', f(x));
            break
        elseif sign(f(x)) == sign(f(a))
            a = x;
        else
            b = x;
        end
%         fprintf('x = %f | ', x); 
%         fprintf('f(x) = %f \n', f(x));
    end

end
