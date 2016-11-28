%% Machine Learning- Logistic Regression with Regularization

%% Initialization
clear ; close all; clc

% Load Data
data = load('dataFile.txt');
X = data(:, [1, 2]); y = data(:, 3);

% Plot data
plotData(X, y);
hold on;
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')
legend('y = 1', 'y = 0')
hold off;

%% Part 1: Regularized Logistic Regression =========================
X = mapFeature(X(:,1), X(:,2));
initial_theta = zeros(size(X, 2), 1);
lambda = 1; % Set regularization parameter lambda to 1

% Compute and display initial cost and gradient for regularized logistic
% regression
[cost, grad] = costFunction(initial_theta, X, y, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);

%% Part 2: Regularization and Accuracies ============================
% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

lambda = 1; % Set regularization parameter lambda to 1

options = optimset('GradObj', 'on', 'MaxIter', 400); % Set Options

% Optimize
[theta, J, exit_flag] = fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);

% Plot Boundary
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')
legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

% Compute accuracy on training set
p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
