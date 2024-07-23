function first_deriv=df(x0_d)
% return the value in x0_d of the first derivate of the objective function 
    first_deriv=-sqrt(x0_d-25)+1/2*(50-x0_d)/(sqrt(x0_d-25));
    