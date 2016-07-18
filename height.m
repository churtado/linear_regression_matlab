% this data is age and height for a group of kids
% we will see how this data is related and fit a model to it

clear;clc;

x = load('ex2x.dat');
y = load('ex2y.dat');

figure % plot the different points and the regression line
plot(x, y, 'o');
ylabel('Height in meters');
xlabel('Age in years');

m = length(y);
n = length(x(1,:)) + 1;
x = [ones(m, 1), x];

iterations = 1500;
alpha = 0.07;

theta = zeros(1,n);

costHistory = zeros(iterations,1);

[theta, costHistory] = gradient(x, y, theta, alpha, iterations);

hold on; %keep the previous plot visible
plot(x(:,2), x*theta','-');

figure; %plot the cost function as it's optimized
plot(1:iterations,costHistory);
ylabel('J(theta)');
xlabel('Iteration');

% Grid over which we will calculate J
theta0_vals = linspace(-3, 3, 100);
theta1_vals = linspace(-1, 1, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

for i = 1:length(theta0_vals)
	  for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = (0.5/m) .* (x * t - y)' * (x * t - y);
    end
end

% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 2, 15))
xlabel('\theta_0'); ylabel('\theta_1');


test = [1 3.5; 1 7];

predictions = test * theta'