function centroids = computeCentroids(X, idx, K)

[m n] = size(X);
centroids = zeros(K, n);

% CODE HERE ===================================================

for k=1:K
	centroids(k,:) = 1./(size(X(find(idx==k)),1)).*sum(X(find(idx==k),:));
end

% =============================================================

end

