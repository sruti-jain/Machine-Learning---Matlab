%% Machine Learning- Linear regression with multiple variables

%% Part 1: Feature Normalization ================================ 

% Clear and Close Figures
clear ; close all; clc

% Load Data
data = load('dataFile.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Normalizing features
[X mu sigma] = featureNormalization(X);

% Adding the intercept term to X
X = [ones(m, 1) X];


%% Part 2: Gradient Descent ===============================================

% Making initial guess
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
eg1 = [1, 1650, 3];
eg1 = eg1(:,2:end);
eg1 = ((eg1-mu)./sigma);
eg1 = [ones(size(eg1,1),1) eg1];
price = eg1*theta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
'(using gradient descent):\n $%f\n'], price);

%% Part 3: Normal Equations ===============================================

% Load Data
data = csvread('dataFile.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Adding the intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEquation(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
price = [1, 1650, 3] * theta;  

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);
% ============================================================
