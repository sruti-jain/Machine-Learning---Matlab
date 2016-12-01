%% Machine Learning- Back propagation algorithm

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% Part 1: Loading and Visualizing Data ===================================
load('MNIST_Sample.mat');
m = size(X, 1);

sel = randperm(size(X, 1));
sel = sel(1:100); 

displayData(X(sel, :));

%% Part 2: Loading Parameters =============================================

load('weights.mat'); % Load the weights into Theta1 and Theta2
nn_params = [Theta1(:) ; Theta2(:)]; % Unroll matrices into vectors

%% Part 3: Compute Cost - Feedforward =====================================

lambda = 0; % No regularization parameter 
J = costFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

fprintf('Cost without regularization: %f \n', J);

%% Part 4: Implement Regularization =======================================

lambda = 1; % Initializing regularization parameter
J = costFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

fprintf('Cost with regularization: %f \n', J);

%% Part 5: Calling Sigmoid Gradient  ======================================
g = sigmoidGradient([1 -0.5 0 0.5 1]);

%% Part 6: Initializing Parameters ========================================

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% Part 7: Implement Regularization =======================================

%  Check gradients by running checkNNGradients
lambda = 3;
checkGradients(lambda);

% Also output the costFunction debugging values
debug_J  = costFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

fprintf('\nCost at (fixed) debugging parameters (w/ lambda = 10): %f \n', debug_J);

%% Part 8: Training NN ====================================================

options = optimset('MaxIter', 50);
lambda = 1;

costFunction1 = @(p) costFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction1, initial_nn_params, options);
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

%% Part 9: Implement Predict ==============================================

pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
