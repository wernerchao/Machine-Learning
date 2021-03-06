function [J, grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
disp(size(Theta1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
disp(size(Theta2));
             
% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

X = [ones(m, 1) X];
disp(size(X));

y_trans = ones(m,1) * [1:num_labels];
y_trans = y_trans == y;

z2 = X * Theta1';
hypo1 = sigmoid(X * Theta1');
hypo1 = [ones(m, 1) hypo1];

hypo2 = sigmoid(hypo1 * Theta2');

cost = sum(sum(-y_trans .* log(hypo2) - (1-y_trans) .* log(1-hypo2)))/m;
J = cost;

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.

% delta3 = (a3 - y_trans)';
% delta2 = (Theta2' * delta3)(2:end,:) .* sigmoidGradient(z2');

delta3 = (hypo2 - y_trans)';
% disp('delta3');
% disp(delta3);
disp('size of delta3');
disp(size(delta3));


delta2 = (Theta2' * delta3);
delta2 = delta2(2:end,:) .* sigmoidGradient(z2');
% disp('delta2');
% disp(delta2);
disp('size of delta2');
disp(size(delta2));

Theta1_grad = (Theta1_grad + delta2 * X)/m;
Theta2_grad = (Theta2_grad + delta3 * hypo1)/m;

% Theta1_grad = (Theta1_grad + delta2 * a1)/m;
% Theta2_grad = (Theta2_grad + delta3 * a2)/m;

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

regularized = (lambda/(2*m))*(sum(sum(Theta1(:,2:end).^2))+sum(sum(Theta2(:,2:end).^2)));
J = J + regularized;





% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];
disp(grad);

end
