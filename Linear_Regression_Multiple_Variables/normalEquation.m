function [theta] = normalEqn(X, y)
%NORMALEQN Computes the value of theta to linear regression 

% CODE HERE =================================================
theta = zeros(size(X, 2), 1);
theta = pinv((X')*X)*X'*y;
% ===========================================================
end
