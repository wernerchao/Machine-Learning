function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
% error_matrix = zeros(8, 8);

% sigma = 0.3; % original given value

% Best value (smallest error) C = 1, sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% load('ex6data3.mat');
% dataset3Params(X, y, Xval, yval)

% for i = 1:length(C)
%     C_temp = C(i);
%     
%     for j = 1:length(sigma)
%     
%         sigma_temp = sigma(j);
%     
%         model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));
%         pred = svmPredict(model, Xval);
%         error = mean(double(pred ~= yval));
%         error_matrix(i, j) = error;
%         
%     end
% end
% 
% [value, position] = min(error_matrix);

C = 1;
sigma = 0.1;

% =========================================================================

end