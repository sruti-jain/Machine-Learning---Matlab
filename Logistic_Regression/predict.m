function p = predict(theta, X)
%PREDICT Determine label is 0 or 1 using learned logistic regression parameters theta

% CODE HERE ===============================================================
m = size(X, 1); % Number of training examples
p = zeros(m, 1);

% Add ones to the X data matrix to account for x0
p = (sigmoid(X*theta) >= 0.5);
% =========================================================================

end
