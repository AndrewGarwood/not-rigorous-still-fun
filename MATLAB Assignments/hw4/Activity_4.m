% Andrew Garwood
% Activity 4

clc; clear all; close all;



% v = [-4 2 -7 3 -1];
% 
% i = 3;
% 
% % add up the absolute value of all the entries of v
% total = sum(abs(v));
% 
% % subtract the absolute value of the third entry of v from total
% total = total - abs(v(i));
% 
% % Now adjust your code so that it calculates the sum from above and checks 
% % if it is greater than or equal |v_i|
% if total >= abs(v(i))
%     disp("break");
% end

% q9 -----------------------------
A = [4 1 1; 1 -7 2; 3 0 4];

% via Jacobi
P = diag(diag(A));
T = A - P;
will_converge = will_splitting_method_converge(P, T); % = 1 => true

% via Gauss-Seidel
P = tril(A);
T = A - P;
will_converge = will_splitting_method_converge(P, T); % = 1 => true

is_sdd = is_matrix_sdd(A); % = 1 => true 

% q10
A = [4 2 2; 1 -3 -1; 3 -1 4];
[J, GS] = check_methods_conv(A); % both = 1 => both conv
is_sdd = is_matrix_sdd(A); % = 0 => not sdd

% q11 
A = [-4 5; 1 2];
[J, GS] = check_methods_conv(A); % both = 1 => both conv
is_sdd = is_matrix_sdd(A); % = 0 => not sdd

% q 12
A = [1 0 1; -1 1 0; 1 2 -3];
[J, GS] = check_methods_conv(A); %  J conv, GS div
is_sdd = is_matrix_sdd(A); % = 0 => not sdd

% q12
A = [1 .5 .5; .5 1 .5; .5 .5 1];
[J, GS] = check_methods_conv(A); %  J conv, GS conv
is_sdd = is_matrix_sdd(A); % = 0 => not sdd

% qiuz q3
A = [3 1 -1; 2 -8 4; 1 3 5];
[J, GS] = check_methods_conv(A) %  J conv, GS conv
is_sdd = is_matrix_sdd(A); % = 0 => not sdd

% A = [9 -2 1 -3 0; 2 -8 1 -1 1; -4 2 -7 3 -1; 2 -4  1 12 -2; 3 -5 2 -1 10];
% is_sdd = true;
% for i = 1:5
% 
%     v = A(i,:); % Get ith row
% 
%     % The code you wrote above, but replace disp("break") with break
%     
%     % add up the absolute value of all the entries of v
%     total = sum(abs(v));
% 
%     % subtract the absolute value of the [ith] entry of v from total
%     % e.g. in 3rd row, subtract 3rd element (diagonal element)
%     total = total - abs(v(i)); 
% 
%     % Now adjust your code so that it calculates the sum from above and checks 
%     % if it is greater than or equal |v_i|
%     if total >= abs(v(i))
% %         disp('q5');
% %         disp(i);
%         is_sdd = false;
%         break;
%     end
% end
% % disp(is_sdd); 


% 
function [Jacobi, GaussSeidel] = check_methods_conv(A)
    % Check Jacobi partition
    P = diag(diag(A));
    T = A - P;
    Jacobi = will_splitting_method_converge(P, T); 

    % Check Gauss-Seidel partition
    P = tril(A);
    T = A - P;
    GaussSeidel = will_splitting_method_converge(P, T); 
end


function is_sdd = is_matrix_sdd(A)
    is_sdd = true;
    for i = 1:length(A)

        v = A(i,:); % Get ith row

        % The code you wrote above, but replace disp("break") with break

        % add up the absolute value of all the entries of v
        total = sum(abs(v));

        % subtract the absolute value of the [ith] entry of v from total
        % e.g. in 3rd row, subtract 3rd element (diagonal element)
        total = total - abs(v(i)); 

        % Now adjust your code so that it calculates the sum from above and checks 
        % if it is greater than or equal |v_i|
        if total >= abs(v(i))
            is_sdd = false;
            break;
        end
    end
end

function will_converge = will_splitting_method_converge(P, T)

    % Calculate M
    M = -P\T;

    % Get eigenvalues from M. . . no need for eigenvectors rn
    lambda = eig(M); % column vector of eigenvalues

    if max(abs(lambda)) < 1
        will_converge = true;
        return;
    else
        will_converge = false;
        return;
    end
end

