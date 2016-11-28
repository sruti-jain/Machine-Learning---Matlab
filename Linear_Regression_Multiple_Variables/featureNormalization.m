function [X_norm, mu, sigma] = featureNormalization(X)
%FEATURENORMALIZE Normalizes the features in X 

% CODE HERE ================================================= 
% Set values
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

for i=1:size(mu,2)
    mu(1,i) = mean(X(:,i)); 
    sigma(1,i) = std(X(:,i));
    X_norm(:,i) = (X(:,i)-mu(1,i))/sigma(1,i);
end
% ============================================================

end
