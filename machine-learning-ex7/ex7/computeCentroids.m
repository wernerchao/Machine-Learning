function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% Matrix matching issue using this method to submit.
% temp_1 = [0 0];
% temp_2 = [0 0];
% temp_3 = [0 0];
% 
% counter_1 = 0;
% counter_2 = 0;
% counter_3 = 0;
% 
% for i = 1:length(idx)
%     
%    if idx(i) == 1
%        temp_1 = temp_1 + X(i, :);
%        counter_1 = counter_1 + 1;
%    end
%    
%    if idx(i) == 2
%        temp_2 = temp_2 + X(i, :);
%        counter_2 = counter_2 + 1;
%    end
%    
%    if idx(i) == 3
%        temp_3 = temp_3 + X(i, :);
%        counter_3 = counter_3 + 1;
%    end
%    
% end
% 
% centroids_1 = temp_1 ./ counter_1;
% centroids_2 = temp_2 ./ counter_2;
% centroids_3 = temp_3 ./ counter_3;
% 
% centroids = [centroids_1; centroids_2; centroids_3];


for i = 1:m
    index = idx(i);
    centroids(index,:) = centroids(index,:) + X(i,:);
end

for j = 1:K
    counter = sum(idx == j);
    centroids(j,:) = centroids(j,:) / counter;
end

% =============================================================


end

