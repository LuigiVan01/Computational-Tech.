function [c,ceq] = non_lin_constr(x,A,b,M,N)

eps=1e-4*ones(M,1);
B=A*x(1:N,1)+b;
B0=x(N+1,1); % the mean of Ax+b has been added as an optimisation variable
c = abs(B/B0-ones(M,1))-eps;
ceq = [];
end