%% Machine Learning: Multiclass classification - Logistic Regression

%% Initialization
clear ; close all; clc
input_layer_size  = 400;  
num_labels = 10; % Digit 0-9   

%% Part 1: Loading and Visualizing Data ===================================

% Load Training Data
load('MNIST_handwritten_digit_dataset.mat');
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

displayData(sel);

%% Part 2: Vectorize Logistic Regression ==================================
lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

%% Part 3: Predict for One-Vs-All =========================================
pred = predict(all_theta, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
