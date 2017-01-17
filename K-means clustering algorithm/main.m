%% Machine Learning || K-Means Clustering

%% Initialization
clear ; close all; clc

%% Find Closest Centroids =================================================

fprintf('Finding closest centroids.\n\n');

% Load dataset
load('dataset.mat');

% Select an initial set of centroids
K = 3; % 3 Centroids
initial_centroids = [3 3; 6 2; 8 5];

% Find the closest centroids
idx = findClosestCentroids(X, initial_centroids);

fprintf('Closest centroids for the first 3 examples: ')
fprintf(' %d ', idx(1:3));

%% Compute Means ==========================================================

%  Compute means based on the closest centroids
centroids = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% K-Means Clustering =====================================================

% Initializations for running K-Means
K = 3;
max_iters = 10;
initial_centroids = [3 3; 6 2; 8 5];

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means Implemented successfully.\n\n');
