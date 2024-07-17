clear all;
close all;
clc;


% Analytical Integration

syms f(x)
sym x

f(x) = x^4 + 2*x^3 -x^2 + x + 5;

a = -1;
b = 1;

I1 = int(f);   
% x^5/5 + x^4/2 - x^3/3 + x^2/2 + 5*x

I2 = int(f,a,b); 
% 1/5(b^5-a^5) + 1/2(b^4-a^4) - 1/3(b^3-a^3) + 1/2(b^2-a^2) + 5*(b-a)

% Numerical Integration

x_coarse = -1:0.1:1;
y_coarse = myfunc(x_coarse);

x_fine = -1:0.01:1;
y_fine = myfunc(x_fine);


figure;
subplot(2,1,1);
plot(x_coarse, y_coarse, 'o');
title('Plot of the Function (coarse values)');
xlabel('x');
ylabel('y');
subplot(2,1,2);
plot(x_fine, y_fine, 'ro');
title('Plot of the Function (fine values)');
xlabel('x');
ylabel('y');

% Method 1 - using coarse values

avg_yc = y_coarse(1:length(x_coarse)-1) + diff(y_coarse)/2;
A1 = sum(diff(x_coarse).*avg_yc);

% Method 1 - using fine values

avg_yf = y_fine(1:length(x_fine)-1) + diff(y_fine)/2;
A2 = sum(diff(x_fine).*avg_yf);

% Method 2

A3 = quad(@myfunc, a, b);

% Method 3

A4 = quadl(@myfunc, a, b);

function y = myfunc(x)

y = x.^4 + 2.*x.^3 - x.^2 + x + 5;

end