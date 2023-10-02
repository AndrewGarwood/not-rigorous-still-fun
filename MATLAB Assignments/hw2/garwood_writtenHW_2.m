clc; clear all; close all;

% ----- Problem 1 --------------------------------------------------------

% 1a
x1 = 0;
for i = 1:25000000
    x1 = x1 + .1;
end
x1;

x2 = 0;
for i = 1:12500000
    x2 = x2 + .2;
end
x2;

x3 = 0;
for i = 1:10000000
    x3 = x3 + .25;
end
x3;

x4 = 0;
for i = 1:5000000
    x4 = x4 + .5;
end
x4;

% 1b
the_val = 2500000;

y1 = abs(the_val - x1);
y2 = abs(the_val - x2);
y3 = abs(the_val - x3);
y4 = abs(the_val - x4);

% 1c
% y1 is larger. y1 - y2 = 0.001148897223175. This is because the summation
% of .1 25000000 times resulted in a larger error than the sum of .2
% 12500000 times. x1 iterated through the summation loop twice as much as
% x2 so it would have created a larger discrepancy because of the rounding
% error involved when python stores the specified numbers.

% 1d
% y3 and y4 are exactly zero, while y1 and y2 are not.

% 1e
% Perhaps part of the reason why these values are exactly zero is because
% they had less iterations of their for loops. A computer stores numbers as
% binary in bytes, I believe. From a google search to convert decimals to
% binary, .1 and .2 respective binary counterparts are much larger than .5
% and .25. This confirms the idea that it is more strenuous to store/add a
% lot of these values, while it would be easier to store/add .25 and .5;
% this also explains why .1 and .2 have more rounding errors.



% ----- Problem 2 --------------------------------------------------------

% Problem 2a
% As an example, consider the case whereK= 30 andr= 2.  We know that the
% logistic map has two equilibria:P∗1= 0 andP∗2=K−(K/r) = 15.  
% LetP(0) =P∗1= 0 and write MATLAB/python code to findP(1), P(2), ..., 
% P(1000).  Re-peat the same process withP(0) =P∗2= 15.  
% Make a single graph with both ofthese solutions plotted.  
% Given the definition of an equilibrium, do your graphsmake sense?

P_eq_1 = 0;
P_eq_2 = 15;

% case 1: Let p0 = 0.
% expect all 0s . . .
eq1_vector = population_model_vector(2, P_eq_1, 30, 1000);

% case 1: Let p0 = 0
% we get 1x1001 of 15
eq2_vector = population_model_vector(2, P_eq_2, 30, 1000);

x = 0:1:1000;
% figure()
% hold on
% plot(x, eq1_vector, 'DisplayName', 'Equilibrium Value = 0', 'LineWidth', 1.25) 
% plot(x, eq2_vector, 'DisplayName', 'Equilibrium Value = 15', 'LineWidth', 1.25) 
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Equilibirum Plots for r = 2, K = 30')
% legend('FontSize', 10)

% These graphs makes sense, it follows the logic of a steady state value.


% Problem 2b
% Now repeat part (a), but use several different values ofP(0).  
% (Remember,Pis a population density,  so it cannot be negative,  and the 
% maximum popula-tion density is - by definition -K.  This means that you 
% only need to choosevalues in the range 0< P(0)< K.)  For each different 
% value ofP(0), calcu-lateP(1), P(2), ..., P(1000).   Make  a  single  
% graph  with  all  of  these  solutionsplotted.  You should find that all 
% of your solutions rapidly approach one of theequilibria, but not the 
% other.  We call an equilibriumstableif solutions withdifferent starting 
% values eventually get very close to the equilibrium.  We callan 
% equilibriumunstableif solutions with different starting values 
% move awayfrom the equilibrium.  Which equilibrium is stable, and 
% which is unstable?

x = 0:1000;


% 0 is unstable, 15 is stable. Solutions rapidly approach 15. I believe we
% did something like this in Math 307.

% figure()
% hold on
% plot(x, population_model_vector(2, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(2, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(2, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(2, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(2, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 2, K = 30')
% legend('FontSize', 10)


% Problem 2c
% For the logistic map, we happen to have a formula for both the stable and 
% unsta-ble equilibrium, but in other applications it is not as easy to find 
% such a formula.Fortunately, we have just discovered an easy way to find 
% stable equilibria:  Pickan arbitrary starting valueP(0) and then calculate
% P(1), P(2), ..., P(1000).  Ifthese values ofP(t) approach a fixed value, 
% thenP(1000) is (at least approxi-mately) a stable equilibrium.KeepK=  30,  
% but  try  many  different  values  ofrin  the  range  1< r <3. Use this 
% approach to find the stable equilibrium for each value ofr.  Make aplot 
% ofP∗versusr.  (We already know the formula forP∗, so we know thatthis 
% should look like the graph ofK−(K/r), but you should use the method 
% outlined above.)

% % Case r = 1.75
% r = 1.75;
% figure()
% hold on
% plot(x, population_model_vector(r, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 1.75, K = 30')
% legend('FontSize', 10)
% % r = 1.75 => P* = 12.8571 maybe 103/8
% 
% 
% % Case r = 1.5
% r = 1.5;
% figure()
% hold on
% plot(x, population_model_vector(r, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 1.5, K = 30')
% legend('FontSize', 10)
% % r = 1.5 => P* = 10
% 
% % Case r = 1.25
% r = 1.25;
% figure()
% hold on
% plot(x, population_model_vector(r, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 1.25, K = 30')
% legend('FontSize', 10)
% % r = 1.25 => p* = 6

% % Case r = 2.75
% r = 2.75;
% figure()
% hold on
% plot(x, population_model_vector(r, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 2.75, K = 30')
% legend('FontSize', 10)
% % r = 2.75 => p* = 19.0909 = 210 / 11
% 
% 
% % Case r = 2.5
% r = 2.5;
% figure()
% hold on
% plot(x, population_model_vector(r, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 2.5, K = 30')
% legend('FontSize', 10)
% % r = 2.5 => p* = 18
% 
% 
% % Case r = 2.25
% r = 2.25;
% figure()
% hold on
% plot(x, population_model_vector(r, 6, 30, 1000), 'DisplayName', 'p0 = 6', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 12, 30, 1000), 'DisplayName', 'p0 = 12', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 18, 30, 1000), 'DisplayName', 'p0 = 18', 'LineWidth', 1.25) 
% plot(x, population_model_vector(r, 24, 30, 1000), 'DisplayName', 'p0 = 24', 'LineWidth', 1.25)
% plot(x, population_model_vector(r, 30, 30, 1000), 'DisplayName', 'p0 = 30', 'LineWidth', 1.25)
% hold off
% xlabel('T values')
% ylabel('Population Value')
% title('Population Plots for r = 2.25, K = 30')
% legend('FontSize', 10)
% % r = 2.25 => p* = 50 / 3
% 
% % Plote P* vs R
% 
% r = [1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75];
% p_eq = [6, 10, 12.8571, 15, 50 / 3, 18, 210 / 11];
% 
% figure()
% hold on
% plot(r, p_eq, 'k')
% plot(r, p_eq, 'bo')
% hold off
% xlabel('r values')
% ylabel('equilibrium values')
% title('r values vs equilibrium values')

% 2d
% f  you  try  the  same  approach  for  values  ofrin  the  range  
% 3< r <3.44949,you will find thatP(t) has a very different behavior.  
% You should see that nomatter whatP(0) you choose (in the range 0< P(0)< 
% K), the values ofP(t)do not converge to a single number.  Instead, 
% they should oscillate between twovalues.  We call these two numbers a 
% stable two cycle.  You can approximate thestable two cycle with the 
% valuesP(999) andP(1000).  Choose many differentrvalues in the 
% range 3< r <3.44949.  For each of these values, pick an arbitrary 
% starting  valueP(0)  and  calculateP(999)  andP(1000).   Make  a  
% plot  of  thevalues ofP(999) andP(1000) versusr.
% There's a better way to do this...
% case 1: R = 3.1, p0 = 7
r = 3.1;
p0 = 7;
P1_999 = population_model(r, p0, 30, 999); 
P1_1000 = population_model(r, p0, 30, 1000); 

% Case 2: R = 3.2, p0 = 5
r = 3.2;
p0 = 5;
P2_999 = population_model(r, p0, 30, 999); 
P2_1000 = population_model(r, p0, 30, 1000); 

% Case 2: R = 3.3, p0 = 9
r = 3.3;
p0 = 9;
P3_999 = population_model(r, p0, 30, 999); 
P3_1000 = population_model(r, p0, 30, 1000); 

r = [3.1, 3.2, 3.3];
P999 = [P1_999, P2_999, P3_999];
p1000 = [P1_1000, P2_1000, P3_1000];

figure()
hold on
plot(r, P999, 'k', 'DisplayName', 'p(999) values')
plot(r, P999, 'bo')
plot(r, p1000, 'g', 'DisplayName', 'p(1000) values')
plot(r, p1000, 'ro')
hold off
xlabel('r values')
ylabel('equilibrium values')
title('r values vs P values')
legend('FontSize', 10)

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

