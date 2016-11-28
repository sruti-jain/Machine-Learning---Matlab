function g = sigmoid(z)
%% SIGMOID Compute sigmoid functoon

% CODE HERE =============================================
g = zeros(size(z));
g = 1./(1 + exp(-z));
% =============================================================

end
