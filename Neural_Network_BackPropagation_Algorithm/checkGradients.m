function checkGradients(lambda)
%CHECKGRADIENTS Creates a small neural network to check the backpropagation gradients

if ~exist('lambda', 'var') || isempty(lambda)
    lambda = 0;
end

input_layer_size = 3;
hidden_layer_size = 5;
num_labels = 3;
m = 5;

Theta1 = debugInitializeWeights(hidden_layer_size, input_layer_size);
Theta2 = debugInitializeWeights(num_labels, hidden_layer_size);

X  = debugInitializeWeights(m, input_layer_size - 1);
y  = 1 + mod(1:m, num_labels)';

nn_params = [Theta1(:) ; Theta2(:)]; % Unroll parameters

% Short hand for cost function
costFunc = @(p) costFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

[cost, grad] = costFunc(nn_params);
numgrad = computeNumericalGradient(costFunc, nn_params);

fprintf('(Left- Numerical Gradient, Right-Analytical Gradient)\n\n');
disp([numgrad grad]);

end
