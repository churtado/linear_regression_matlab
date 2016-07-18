clear;clc;

data = load('ex1data2.txt');
X = data(:,1:2);
y = data(:,3);

%plot(X,y,'o');

n = length(X(1,:)) + 1;
X = [ones(length(y), 1), X];

iterations = 1;
alpha = 0.02;

theta = zeros(1,n);
costHistory = zeros(iterations,1);

[theta, costHistory] = gradient(X, y, theta, alpha, iterations);

figure;
plot(1:iterations,costHistory);