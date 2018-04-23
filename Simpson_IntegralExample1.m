% The following script file shows an example of finding Integral of Vector
% functions using Simpson's rule


function [] = Simpson_Example1()

clc
clear

x = [ 1 2 3 4 5];
y = [ 5 10 15 20 25];
calcIntegral(x, y)
end


function [integrals] = calcIntegral ( X, Y)
%function calcIntegral takes two vectors as Input and calculates the
%integral of Y using Simpson's rule. The function also creates 101 evenly
%spaced points for X vector and then finds the corresponding Y values for
%those 101 values using polyval().
%
%Input X and Y vectors
%Output integrals which is the integration of Y values



%Creating the new vector for x which is evenly spaced
    newX = linspace (min(X), max(X), 101);

%Creating an anonymous function for the Vector X

    p = @(x) polyval(X, x);

    
    
% For new values of x and new function we need to find out the new Y values

    for k = 1: length(newX)
        newY(k) = p(newX(k));
    end


% Applying the Simpson's rule

    h = max(X) - min(X);

    % Simpson's Rules has three forms like f(x0) + 4f(x1) + 2f(3)
    
    for k =1: length(Y)             % For the first Y value there is no coefficient associated with it
        if k == 1
            I1 = newY(k);
        end
        if mod(k, 2) == 0           % All the even-indexed Y values have coefficient of 4. So, we are combining them here together
            I2 = 4* newY(k+1);
        end
        if mod (k,2) ~= 0           % All the odd-indexed Y values have coefficient of 4. So, we are combining them here together
            I3 = 2 * newY(k+2);
        end
		
		if k == length(Y)			%If K reaches to the last node, then there is no coefficient. It will just be added to the sum.
			I4 = newY(k);

    end

integrals = (h/3) * (sum(I1) + sum (I2) + sum (I3));
end


