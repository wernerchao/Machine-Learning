function [J, grad] = costFunction(theta, X, y)
% COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples
alpha = 0.01;
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% for iter = 1:1
% 
% z = X * theta;
% h_theta_X = sigmoid(z);
% error = (h_theta_X - y) .* X;
% sum_all = sum(error)/m; % 100 training sets
% temp_theta = (alpha * sum_all); %theta becomes 3 x 3 matrix after minus itself?
% something = temp_theta - theta;
% 
% % J = -1 * sum((y .* log(sigmoid(X * theta))) + ((1 - y) .* log(1-sigmoid(X * theta)))) / m;
% J = something;
% grad = temp_theta;
% 
% end
% =============================================================
hypo = sigmoid(X * theta);
J = sum(-y .* log(hypo) - (1-y) .* log(1-hypo))/m;
grad = X' * (hypo - y) / m;

end
