clc; close all; clear all;

% ----- Problem 1 --------------------------------------------------------

% 19X34 matrix
A = zeros(19, 34);
for i = 1:19
    for j = 1:34
        A(i, j) = 1 / (i * j);
    end
end

% Problem 1a -------------------------------
% Save a copy of the matrixAin the variableA1.  (Note:  In MATLAB, the word
% “copy”  doesn’t  matter  here;  you  can  just  sayA1 = A,  but  inpython
% it is very important that you useA1 = A.copy().  Otherwise,any changes 
% you make to A will also change A1.)
A1 = A; 

% Problem 1b -------------------------------
% Make a new matrix B which is a copy of A, except the 17th row and 33rd 
% column are all zeros.  Save a copy of the matrix B in the variable A2.  
% (Note: Just like in the last part, the word “copy” doesn’t matter in 
% MATLAB,but in python it is important not to writeB = A or A2 = B and then
% modify the entries of B, because that will also change A.
B = A;
B(17, 1:end) = 0; % enter 17th row, then set entries in col 1 to end to 0
B(1:end, 33) = 0; % for every row, set 33rd entry to 0 . . .
% disp(B);
A2 = B;

% Problem 1c -------------------------------
% Make a third matrix which contains the last five rows and the last three 
% columns of the matrix B.  Save a copy of the resulting matrix in the 
% variable A3.

% This gets last 5 rows of B
L5r_B = B((end - 4):end, :);

% gets last 3 cols from L5r_B
L5r_L3c_B = L5r_B(:, (end - 2):end); 
% It occurs to me that these names are not auspicious

A3 = L5r_L3c_B;

% Problem 1d -------------------------------
% Make a  *column vector* containing the fifth column of the matrix B and save 
% it in the variable A4.
colvect = B(:,5); % 19X1
A4 = colvect;



% ----- Problem 2 --------------------------------------------------------

% Harmonic series
% Sn = SUM( k = 1 -> n) 1 / k

% Problem 2a -------------------------------
% Calculate S10 using a for loop.  Save your answer in the variable A5.
s10 = 0;
for i = 1:10
    % disp(1 / i)
    s10 = s10 + (1 / i);
end
A5 = s10;

% Problem 2b -------------------------------
% Calculate S100 using a for loop.  Save your answer in the variable A6.
s100 = 0;
for i = 1:100
    % disp(1 / i)
    s100 = s100 + (1 / i);
end
A6 = s100;

% Problem 2c -------------------------------
% Calculate the smallest number n such that Sn > 5. Save the corresponding
% value  of n in  a  variable  named A7 and  the  corresponding  value  of 
% Sn in  avariable named A8.
Sn = 0;
n = 0;
while Sn <= 5
    n = n + 1;
    Sn = Sn + (1 / n);
end
% disp(n), disp(Sn)
A7 = n;
A8 = Sn;

% check:
% check5 = 0;
% stop = 82;
% for i = 1:stop % if stop = 83, we get a value > 5 
%     check5 = check5 + 1 / i;
% end
% disp(check5) = 4.990020079909081 (82 steps)

% Problem 2d -------------------------------
% Calculate the smallest number n such that Sn > 15. Save the corresponding 
% value  of n in a variable named A9 and  the  corresponding  value  of Sn 
% in  avariable namedA10.  Both A9 and A10 are worth two points each. 
% Warning:If you are not careful, this code will be extremely slow.  
% You shouldbe able to write a solution that finishes in at most a few 
% seconds,but it is also possible to write a solution that takes several 
% minutes.Gradescope has a time limit, and so you will only get credit 
% if yoursolution finishes in a reasonable amount of time.
Sn = 0;
n = 0;
while Sn <= 15
    n = n + 1;
    Sn = Sn + (1 / n);
end
% disp(n), disp(Sn)
% could check using same logic from 2c
A9 = n;
A10 = Sn;


% ----- Problem 3 --------------------------------------------------------
% Recall from the previous homework assignment that the logistic map is 
% often usedin population ecology to model population growth. 

% It is defined by P(t + 1) =r * P(t) * (1 − P(t) / K)

% In the last assignment, you foundP(3) andP(4) for several different 
% values ofP(0),randK.  You probably noticed that it is somewhat annoying 
% to solve this problemwithout using a loop.  In this problem, you need to 
% findP(t) for much bigger valuesof t, and so it will be necessary to use a 
% loop.It will also be very useful to write a function (either a local 
% function in MATLABor  a  normal  function  with  thedefkeyword  in  
% python)  to  calculateP(t)  for  anarbitraryt.  Such a function 
% will also be useful in the written homework.

% It is defined by P(t + 1) = r * P(t) * (1 − P(t) / K)

% e.g. P3 = 12.408103466033936
% P3_test = population_model_vector(2.5, 3, 20, 3)
% population_model_vector(2.5, 3, 20, 3) returns a 1x4 vector
% P1_2_3 = P3_test(end - 2:end) % gets P1, P2, P3 in 2x3 vector


% Problem 3a -------------------------------
% Suppose that r= 2.5,P(0) = 3 andK= 20.  CalculateP(998),P(999) andP(1000) 
% and save them (in that order) in a 1×3 row vector namedA11.
a_vect_p1000 = population_model_vector(2.5, 3, 20, 1000);
A11 = a_vect_p1000((end - 2):end); % get p(998), p(999), p(1000)

% Problem 3b -------------------------------
% Suppose that r= 3.2,P(0) = 3 andK= 20.  CalculateP(998),P(999) andP(1000) 
% and save them (in that order) in a 1×3 row vector namedA11.
b_vect_p1000 = population_model_vector(3.2, 3, 20, 1000);
A12 = b_vect_p1000((end - 2):end); % get p(998), p(999), p(1000)

% Problem 3c -------------------------------
% Suppose that r= 3.5,P(0) = 3 andK= 20.  CalculateP(998),P(999) andP(1000) 
% and save them (in that order) in a 1×3 row vector namedA11.
c_vect_p1000 = population_model_vector(3.5, 3, 20, 1000);
A13 = c_vect_p1000((end - 2):end) % get p(998), p(999), p(1000)

% returns individual value  P(t),  
% does not store values of previous time intervals
function P = population_model(r, p0, k, t)
    curr_pop = p0; % not storing in an array. . . for now
    P = 0;
    for i = 1:t
        P = r * curr_pop * (1 - curr_pop / k);
        curr_pop = P;
    end
end

% Returns row vector of size 1x(t + 1) -> P(0), P(1), . . . P(t)
% Last element is P(t). To get the last n elements do something a long the 
% lines of P_lastN = P((end - (n - 1)): end) 
function P = population_model_vector(r, p0, k, t)
    P = zeros(1, t + 1);
    P(1) = p0; % initial population
    for i = 2:(t + 1)
        P(i) = r * P(i - 1) * (1 - P(i - 1) / k);
    end
end






