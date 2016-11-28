function [J, grad] = costFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with regularization

% CODE HERE ===============================================================
% Initializing values
m = length(y);
J = 0;
grad = zeros(size(theta));

% Computing cost
sig = sigmoid(X * theta);
cost = -y .* log(sig) - (1 - y) .* log(1 - sig);
J = (1 / m) * sum(cost) + (lambda / (2 * m)) * sum(theta(2:end).^ 2);

% Computing Gradient
grad(1,1) = (1/m)*sum((sigmoid(X*theta)-y).*X(:,1)); 
grad(2:end,1)=((1/m)*((sigmoid(X*theta)-y)'*X(:,2:end)))'+(lambda/m)*theta(2:end);
grad = grad(:);
% =============================================================

end