function dfdx = forward_derivative(f, x, h)
% Returns derivative of the function f at position x
% f is the handle to the function
% h is step, keep it small
dfdx = (f(x + h) - f(x)) / h;
end
