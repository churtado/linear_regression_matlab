function [cost] = cost(X, y, theta)

    m = length(y);
    cost = 1/(m) * sum((X*theta' - y).^2);
    
end