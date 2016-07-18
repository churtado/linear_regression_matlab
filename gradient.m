function [ theta, costHistory ] = gradient( X, y, theta, alpha, iterations )
    
    m = length(y);
    n = length(theta);
    
    theta_temp = zeros(1,n);

    for i = 1:iterations

        for j = 1:n

            theta_temp(j) = theta(j) - alpha*(1/m)*sum((X*theta'-y).*X(:,j));

        end

        for j = 1:n

            theta(j) = theta_temp(j);

        end

        costHistory(i) = cost(X,y,theta);
    
    end
    
end