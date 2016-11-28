%% Machine Learning Linear Regression

%% DataSet details
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s

%% Initialization
clear ; close all; clc

%% Part 1: Plotting ============================================== 
data = load('dataFile.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples
plotData(X, y);

%% Part 2: Gradient descent ====================================== 
% initializing parameters
X = [ones(m, 1), data(:,1)]; 
theta = zeros(2, 1); 
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
costFunction(X, y, theta);

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

fprintf('\nTheta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

%Linear Plot
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
hold off

% Predict values for population sizes of 20,000 and 45,000
predict1 = [1, 2] *theta;
fprintf('For population = 20,000, we predict a profit of %f\n',predict1*10000);
predict2 = [1, 4.5] * theta;
fprintf('For population = 45,000, we predict a profit of %f\n',predict2*10000);

%% Part 3: Visualizing J(theta_0, theta_1) ========================== 
% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = costFunction(X, y, t);
    end
end

J_vals = J_vals';
% Surface Plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour Plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
