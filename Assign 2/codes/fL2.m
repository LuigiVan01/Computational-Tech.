function [f] = fL2(x,N)

f=sqrt([x(1:N,1)]'*[x(1:N,1)]);

