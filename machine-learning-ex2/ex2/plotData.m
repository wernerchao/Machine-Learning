function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% Find Indices of Positive and Negative Examples
% x =
%     1     3     5     7     9    11    13    15    17    19
% k = find(x==13)
% k = 7
pos = find(y==1); neg = find(y == 0);
% fprintf('X(pos, 1) = %f\n',X(pos, 1)); %X(rows, column 1)
% fprintf('X(pos, 2) = %f\n',X(pos, 2)); %X(rows, column 2)

% Plot Examples
plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);


% =========================================================================



hold off;

end
