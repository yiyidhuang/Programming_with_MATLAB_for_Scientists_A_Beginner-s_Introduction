function integral2d = integrate_in_2d(f, xrange, yrange)
% Integrates function f in 2D space
% f is handle to function of x, y i.e. f(x, y) should be valid
% xrange is a vector containing lower and upper limits of integration
%   along the first dimension.
%   xrange = [x_lower, x_upper]
% yrange is similar but for the second dimension
% We will define (Integral f(x, y)dy) as Fx(x)
Fx = @(x) integrate_in_1d(@(y) f(x, y), yrange(1), yrange(2));

%   ^^^^^ we fix 'x',      ^^^^^^^^^^^here we reuse this already fixed x
%                                     so it reads as Fy(y)
% This is quite cumbersome.
% It is probably impossible to do a general D-dimensional case.
% Notice that matlab folks implemented integral, integral2, integral3
% but they did not do any for higher than 3 dimensions.
integral2d = integrate_in_1d(Fx, xrange(1), xrange(2));
end
