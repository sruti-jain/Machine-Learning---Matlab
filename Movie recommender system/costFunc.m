function [J, grad] = costFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)

X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% CODE HERE ===============================================================

J_temp = (X * Theta' - Y).^2;
J = sum(sum(J_temp(R == 1)))/2 + lambda/2 .* sum(sum(Theta.^2)) + lambda/2 .* sum(sum(X.^2));
X_grad = ((X * Theta' - Y) .* R) * Theta + lambda.*X;
Theta_grad = ((X * Theta' - Y) .* R)' * X + lambda.*Theta;

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
