function sec_deriv=ddf(x0_dd)
%return the value in x0_dd of the second derivate of the objective function
    sec_deriv=(50-3*x0_dd)/(4*(-25+x0_dd)^(3/2));
    