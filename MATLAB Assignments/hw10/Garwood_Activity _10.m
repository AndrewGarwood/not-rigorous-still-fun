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




