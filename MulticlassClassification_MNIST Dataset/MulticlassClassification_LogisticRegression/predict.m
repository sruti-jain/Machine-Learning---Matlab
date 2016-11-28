function p = predict(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier.

% CODE HERE ===============================================================
m = size(X, 1);
num_labels = size(all_theta, 1);
p = zeros(size(X, 1), 1);
X = [ones(m, 1) X];

temp = X * all_theta';
[output, p] = max(temp, [], 2);
% =========================================================================

end
