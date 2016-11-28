function [J, grad] = costFunction(theta, X, y)

%COSTFUNCTION Compute cost and gradient for logistic regression

% Cost Function & Gradient Descent =======================================
% Initialize values
m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));
templog(:,1) = log(sigmoid(X*theta));
templog(:,2) = log(1-(sigmoid(X*theta)));
tempy(:,1) = y;
tempy(:,2) = 1-y;
temp = templog.*tempy;

% Formula for cost function.
J = (1/m)*(-sum(temp(:,1))-sum(temp(:,2)));

% Compute gradient 
grad(1,1) = (1/m)*sum((sigmoid(X*theta)-y).*X(:,1)); 
grad(2:end,1)=((1/m)*((sigmoid(X*theta)-y)'*X(:,2:end)))';

grad = grad(:);
% =============================================================

end
