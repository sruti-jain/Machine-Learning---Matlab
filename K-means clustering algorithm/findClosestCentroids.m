function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1); % Set K
idx = zeros(size(X,1), 1);

% CODE HERE ===================================================

for i=1:size(X,1)
    temp = X(i,:);
    [~,idx(i,1)] = min(sum(((bsxfun(@minus,temp,centroids)).^2),2));
end

% =============================================================

end

