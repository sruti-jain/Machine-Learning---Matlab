%% Machine Learning - Multi-class classification & neural networks

%% Initialization
clear ; close all; clc
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% Part 1: Loading and Visualizing Data ===================================
% Load Training Data- Subset of the MNIST handwritten digit dataset (http://yann.lecun.com/ exdb/mnist/).

load('MNIST_handwritten_digit_dataset.mat');
m = size(X, 1);

sel = randperm(size(X, 1)); % Randomly select 100 data points to display
sel = sel(1:100);

displayData(X(sel, :)); %displaying data sample
fprintf('\nPress enter to continue\n')
pause;

%% Part 2: Loading Parameters =============================================

% Load the weights into variables Theta1 and Theta2
load('weights.mat');

%% Part 3: Predict ========================================================

pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

rp = randperm(m); %  Randomly permute examples

for i = 1:m
    fprintf('\nDisplaying Example Image\n');
    displayData(X(rp(i), :));

    pred = predict(Theta1, Theta2, X(rp(i),:));
    fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred, mod(pred, 10));
    fprintf('\nPress enter to continue or press CTRL+C to terminate\n')
    pause;
    
end