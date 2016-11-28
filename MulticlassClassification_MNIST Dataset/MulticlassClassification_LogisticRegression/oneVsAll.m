function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i

% CODE HERE ===============================================================
% Initializing variables
m = size(X, 1);
n = size(X, 2); %no of features

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
options = optimset('GradObj', 'on', 'MaxIter', 50);

for i=1:num_labels    
temp = (y==i);
[temp_theta(:,i)] = fmincg (@(t)(costFunction(t, X, temp, lambda)),initial_theta, options);
all_theta(i,:) = temp_theta(:,i)';
end
% =========================================================================

end
