function [J grad] = costFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
%COSTFUNCTION Implements the neural network cost function for a two layer neural network which performs classification

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

% Initialising some variables
m = size(X, 1);
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% CODE HERE ===============================================================
% Instructions: You should complete the code by working through the
%               following parts.
%
%% Part 1: Feedforward the neural network and return the cost in the variable J. 
X = [ones(m, 1) X];
y1 = eye(num_labels);
y = y1(y,:);

% Computation from input layer to hidden layer
a1 = X;
z2 = a1*Theta1';
a2 = sigmoid(z2);

% Computaion from hidden layer to output layer
a2 = [ones(m, 1) a2]; 
z3 = a2*Theta2';
a3 = sigmoid(z3);

% Computing cost with regularization term
temp = (-y).*log(a3)-(1-y).*log(1-a3); 
t1 = Theta1(:,2:size(Theta1,2));
t2 = Theta2(:,2:size(Theta2,2));
J = ((1/m).*sum(sum(temp)))+(lambda/(2*m)).*(sum(sum(t1.^2))+sum(sum(t2.^2)));

%% Part 2: Implement the backpropagation algorithm to compute the gradients Theta1_grad and Theta2_grad.

acc1 = 0;
acc2 = 0;

delta3 = a3-y;
z2 = [ones(m,1) z2];
delta2 = delta3*Theta2.*sigmoidGradient(z2);
delta2 = delta2(:,2:end);
acc1 = acc1 + delta2'*a1; % Same size as Theta1_grad (25x401)
acc2 = acc2 + delta3'*a2; % Same size as Theta2_grad (10x26)
Theta1_grad = (1/m).*acc1;
Theta2_grad = (1/m).*acc2;


%% Part 3: Implement regularization with the cost function and gradients.
Theta1_grad(:, 2:input_layer_size+1) = Theta1_grad(:, 2:input_layer_size+1) + lambda / m * Theta1(:, 2:input_layer_size+1);
Theta2_grad(:, 2:hidden_layer_size+1) = Theta2_grad(:, 2:hidden_layer_size+1) + lambda / m * Theta2(:, 2:hidden_layer_size+1);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
