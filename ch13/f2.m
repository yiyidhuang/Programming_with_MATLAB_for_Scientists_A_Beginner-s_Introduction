function fval = f2(v)
    x = v(1);
    y = v(2);
    z = v(3);
    fval = 2 * x^2 + y^2 + 2 * z^2 + 2 * x * y + 1 - 2 * z + 2 * x * z; 
end