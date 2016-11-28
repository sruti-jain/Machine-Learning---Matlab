function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% CODE HERE ===============================================================
X = [ones(m, 1) X];
a2 = sigmoid(X * Theta1');
a = [ones(m,1) a2];
temp = sigmoid(a * Theta2');
[output, p] = max(temp, [], 2);

% =========================================================================

end
