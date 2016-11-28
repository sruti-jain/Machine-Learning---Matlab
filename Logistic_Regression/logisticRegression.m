%% Machine Learning- Logistic Regression without regularization

% Initialization
clear ; close all; clc

% Load Data
data = load('dataFile.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% Part 1: Plotting ==============================================
plotData(X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

%% Part 2: Compute Cost and Gradient ==============================

%  Setup the data & initialize fitting parameters
[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost, grad] = costFunction(initial_theta, X, y);

%% Part 3: Optimizing using fminunc  ============================

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain optimal theta
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Plot the best fit
plotDecisionBoundary(theta, X, y);
hold on;
xlabel('Exam 1 score')
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')
hold off;

%% Part 4: Predict and Accuracies =============================
%  Predict probability for a student with score 35 on exam 1 and score 85 on exam 2 

prob = sigmoid([1 35 85] * theta);
fprintf(['For a student with scores 35 and 85, we predict an admission ' 'probability of %f\n\n'], prob);

% Compute accuracy of model on our training set
p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);