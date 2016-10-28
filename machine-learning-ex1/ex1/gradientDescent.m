function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
theta1 = theta(1, 1);
theta2 = theta(2, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    predictions = X * theta;
%     fprintf('PREDICTIONS: %f \n', predictions);
    errors = predictions - y;
%     fprintf('ERRORS: %f \n', errors);
    temp1 = X(:, 1);
    temp2 = X(:, 2);
    
    derivative1 = errors .* temp1;
    derivative2 = errors .* temp2;
    
    delta1 = sum(derivative1)/m;
    delta2 = sum(derivative2)/m;
    
    theta1 = theta1 - alpha * delta1;
    theta2 = theta2 - alpha * delta2;
    theta = [theta1; theta2];

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end
%     fprintf('J_history is: %f \n', J_history);
%     plot(1:1500, J_history, 'bx');
end
