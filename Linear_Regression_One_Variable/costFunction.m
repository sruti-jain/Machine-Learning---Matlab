function J = costFunction(X, y, theta)

%COMPUTECOST Compute cost for linear regression
% CODE HERE ==============================================

% Initializing variables
m = length(y); % number of training examples
J = 0;

prediction = X * theta;
sqerr = (prediction-y).^2;
J = 1/(2 * m) * sum(sqerr);
% ========================================================

end
