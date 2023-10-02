% Andrew Garwood 
% Activity 10

x = linspace(-2, 2, 1000);

y1 = x;
y2 = x.^2;
y3 = x.^3;
y4 = x.^4;

% subplot -> make plots in a grid:
% 3 args (num rows in grid, num cols in grid, num of plot to work on)
% ordered: left to right, top to bottom.

% plot all 4 in one row
subplot(1, 4, 1)
plot(x, y1, 'k')

subplot(1, 4, 2)
plot(x, y2, 'k')

subplot(1, 4, 3)
plot(x, y3, 'k')

subplot(1, 4, 4)
plot(x, y4, 'k')

%%
% plot all 4 in one column
subplot(4, 1, 1)
plot(x, y1, 'k')

subplot(4, 1, 2)
plot(x, y2, 'k')

subplot(4, 1, 3)
plot(x, y3, 'k')

subplot(4, 1, 4)
plot(x, y4, 'k')

%%
% Plot 2x2 grid
subplot(2, 2, 1)
plot(x, y1, 'k')

subplot(2, 2, 2)
plot(x, y2, 'k')

subplot(2, 2, 3)
plot(x, y3, 'k')

subplot(2, 2, 4)
plot(x, y4, 'k')

%% 
% given example of different sized plots
subplot(2, 2, 1)
plot(x, y2, 'k')

subplot(2, 2, 3)
plot(x, y4, 'k')

subplot(2, 2, [2 4]) % grid indices 2 and 4 given in vector
plot(x, y3, 'k')

%% 
% cubic top left, quatric top right, line bottom
subplot(2, 2, 1)
plot(x, y3, 'k')

subplot(2, 2, 2)
plot(x, y4, 'k')

subplot(2, 2, [3, 4]) % grid indices 3 and 4 given in vector
plot(x, y1, 'k')


