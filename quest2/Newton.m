function xx=Newton(x0,n,t)

xx=zeros(n,1);
i=1;
xx(1)=x0;

while abs(df(xx(i)))>t && i<n % condition to respect to continue to search

    xx(i+1)=xx(i)-df(xx(i))./ddf(xx(i));
    i=i+1;
    
end
i



