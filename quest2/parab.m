function xx= parab(f,a0, b0, c0, n,t)

xx = zeros(n,1); 
a = a0;
b = b0;
c = c0;
fa = f(a);
fb = f(b);
fc = f(c);
i=1;

while i<n && (c-a)>t % conditions to be satisfied to continue to iterate

    x= b - ((fb-fc) *(b-a)^2 - (fb-fa)*(b-c)^2) / ...
    (2* ( (fb-fc) * (b-a) - (fb-fa) * (b-c) )) ; %minimum of the interpolated parabola

    fx=f(x);
    xx(i)=x;

    if (x>b)

        if (fx > fb)
            c = x;
            fc = fx;
        else
            a = b;
            fa = fb;
            b = x;
            fb = fx;
        end

    else

        if (fx > fb)
            a = x;
            fa = fx;
        else
            c = b;
            fc = fb;
            b = x;
            fb = fx;
        end
        
    end

i=i+1;

end

n_iterations_parab=i-1 %number of iterations carried out
final_lenght_interval_parab=c-a %lenght of the last interval

