clear all;
close all;
clc;

% Define the first set of values
xx = 0:1:10;
yy = sin(xx);

% Define the second set of values
x = 0:0.09:10;
y = sin(x);

% Calculate the numerical derivatives
yy_diff = diff(yy)./diff(xx);
y_diff = diff(y)./diff(x);

% Calculate the analytical derivatives
y_verify1 = cos(xx);
y_verify2 = cos(x);

% Plotting the Functions

figure;
subplot(2,1,1); 
plot(xx, yy, 'o');
title('Plot of function y = sin(x) (coarse values)');
xlabel('xx');
ylabel('yy');
subplot(2,1,2); 
plot(x, y, 'ro');
title('Plot of function y = sin(x) (fine values)');
xlabel('x');
ylabel('y');

% Plotting the Numeric and Analytical Derivatives

figure;
subplot(2,1,1);
plot(xx(2:end), yy_diff, '-b');
hold on;
plot(xx, y_verify1, 'ro');
xlabel('dx');
ylabel('dy');
title('Comparison of Numerical and Analytical Derivative (coarse)');
legend('Numerical', 'Analytical');
hold off;
subplot(2,1,2);
plot(x(2:end), y_diff, '-b');
hold on;
plot(x, y_verify2, 'ro');
xlabel('dx');
ylabel('dy');
title('Comparison of Numerical and Analytical Derivative (fine)');
legend('Numerical', 'Analytical');
hold off;

% Plotting the Funtion and Derivative on the same plot

figure;
subplot(2,1,1);
plot(xx, yy, 'o', xx(2:end), yy_diff, 'ro');
xlabel('x');
ylabel('y and dy/dx');
title('Function and Derivative (coarse values)');
legend('Function', 'Derivative');
subplot(2,1,2);
plot(x, y, 'o', x(2:end), y_diff, 'ro');
xlabel('x');
ylabel('y and dy/dx');
title('Function and Derivative (fine values)');
legend('Function', 'Derivative');

% Plotting with two different y-axes

figure;
subplot(2,1,1);
yyaxis left
plot(xx, yy, 'o-');
xlabel('x');
ylabel('y');
yyaxis right
plot(xx(2:end), yy_diff, 'ro-');
ylabel('dy');
legend('Function', 'Derivative');
title('Plotting with Two Different Y-Axes (coarse values)');
subplot(2,1,2);
yyaxis left
plot(x, y, 'o-');
xlabel('x');
ylabel('y');
yyaxis right
plot(x(2:end), y_diff, 'ro-');
ylabel('dy');
legend('Function', 'Derivative');
title('Plotting with Two Different Y-Axes (fine values)');