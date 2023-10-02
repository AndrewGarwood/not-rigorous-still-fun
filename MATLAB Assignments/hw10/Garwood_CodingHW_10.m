% Andrew Garwood 
% Coding HW 10

clear all; close all; clc;

% Problem 1 --------------------------------------------------------------
A = [1  -2   0  -1; 
     4   0  -2   1];

% 1a Calculate Reduced svd

[U, S, V] = svd(A, 'econ');
A1 = V;

% 1b Calculate Full svd
[U, S, V] = svd(A);
A2 = V;

% 1c Find Rank of A
rank_A = 2; % = num l.i. columns, number of nonzero singular values
% note: there is also a method: rank(A) = k, k = rank of A
A3 = rank_A;

% 1d Reconstruct A using largest singular value and its corresponding
% singular vectors
[U, S, V] = svd(A, 'econ');
max_sigma = S(1, 1); % -> should return largest sigma
% then by formula, A approx sigma * u * v'
rank_1_approx = max_sigma * U(:, 1) * V(:, 1)';
A4 = rank_1_approx;

% 1e find re-scaled energy of A -> how much of A did we get w/ rank 1
% approx
sigma = diag(S); % put sigma values from S into vector "sigmas"
% cumsum -> cumulative sum of values 

E = cumsum(sigma.^2) / sum(sigma.^2); % -> 2x1 double for 2 sigmas
% Energy of approximation from d:
A5 = E(1); % = 0.7992 -> about 80 percent 
% explicit calculation: E1 = sigma(1)^2 / (sigma(1)^2 + sigma(2)^2))


% Problem 2 --------------------------------------------------------------
% A_n * phi = p (ro?)

n = 114;

d = 2 * ones(n, 1);
off_d = -1 * ones(n - 1, 1);
A_114 = diag(d) + diag(off_d, 1) + diag(off_d, -1); % pog

% p function
P = @(j)(2 * (1 - cos(53 * pi / 115)) * sin(53 * pi * j / 115));

p = zeros(n, 1); % make 114x1 vector p 
for k = 1:n
    p(k) = P(k);
end

% find full svd of A_114 = USV'
[U, S, V] = svd(A_114);

% 2a : get row vector of sigma vals in DECREASING order
sigma = diag(S);
A6 = sigma'; %  transpose it to get 1x114
% I'm an idiot, i thought we had to flip to get decreasing but it already
% is. I seem to have forgotten the meaning

% 2b find inverse of matrix U
% recall property of orthogonal matrices e.g. inv(A_orthog) = A_orthog'
A7 = U';

% 2c find inverse of matrix V'
% same reasoning, inv(V') = (V')' = V
A8 = V;

% 2d: calculate inverse of S
% given hint: inverse of S is also diag with entries 1/sigma

% diag(1./S) -> vector of 1 / sigma values
% then turn vector back into matrix
S_inv = diag(diag(1./S));
A9 = S_inv;

% 2e A_114 * phi = p 
% => USV'phi = p => SV'phi = U_inv * p

% Calculate U inv p
% p 114x1, U 114x114
% use orthogonal property from above
A10 = U' * p;

% 2f
% V'phi = S_inv * U_inv * p

A11 = S_inv * U' * p;

% 2g
% phi = V'_inv * S_inv * U_inv * p
phi = V * S_inv * U' * p;
A12 = phi;


% Problem 3 --------------------------------------------------------------

% data from black and white photograph
data = readmatrix('hw10_img.csv');

% 3a calculate number of megabytes needed to store matrix data
% num_entries * 8 / 1e6
% data is 533 * 800 double
[m, n] = size(data); % more general way to get num rows, cols
num_mb = m * n * 8 / 1e6; % = 3.4112
A13 = num_mb;



% 3b find num single values required to get 99percent of info
% reduced svd of data
[U, S, V] = svd(data, 'econ');

sigma = diag(S); % put sigma values from S into vector "sigmas"

% cumsum -> cumulative sum of values 
E = cumsum(sigma.^2) / sum(sigma.^2); % 533x1
k = length(E);
for i = 1:length(E)
    if (E(i) > .99)
        k = i;
        break;
    end
end
% -> k = 204
A14 = k;

% 3c calc num mb for first k singular values, left vectors, right vectors
% = k * (1 + m + n)

kth_num_mb = k * (1 + m + n) * 8 / 1e6; % = 2.1771
A15 = kth_num_mb;

% figure()
% img = data;
% imshow(img, [])


    

















