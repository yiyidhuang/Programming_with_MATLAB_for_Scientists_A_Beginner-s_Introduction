function ret = fsample_sinc(v)
    x = v(1); y = v(2);
    r = sqrt(x^2 + y^2);
    ret = -sin(r) / r;
end
