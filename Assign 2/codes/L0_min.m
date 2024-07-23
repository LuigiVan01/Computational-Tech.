% Luigi Vanacore 48543518

clc
clear all
close all

% Load data
load('A.mat'); 
load('b.mat'); 


M=size(A,1); % number of sampled points
N=size(A,2); % number of x components
eps=1e-4*ones(M,1);
uno=ones(M,1);


%% L0 with lincon definition and imporved sigmoid

% cost function
fun0=@(x)fL0(x,N);

% options of fmincon routine
 options = optimoptions('fmincon','Display','iter','Algorithm','sqp');% Use SQP
 
% initial guess
 x0 = [zeros(2*N,1);3];

% definition of constraints
A_ineq=[    -A,         A,        zeros(M,1);
             A,        -A,        -uno-eps;
            -A,         A,         uno-eps;
          eye(N),   -eye(N),      zeros(N,1);
         -eye(N),    eye(N),      zeros(N,1)];

b_ineq=[b; -b; b; 0.01*ones(N,1); 0.01*ones(N,1)];

A_eq=[uno'*A,uno'*-A, -M];
b_eq=-uno'*b;


% upper and lower bounds
lb = [ zeros(N,1) ; zeros(N,1) ; -inf];

% Optimisation
tic
[x_temp, fval, exitflag, output] = fmincon(fun0, x0, A_ineq, b_ineq, A_eq, b_eq, lb,[],[], options);
toc


x_L0=x_temp(1:N,1)-x_temp(N+1:end-1,1);% original vector reconstructed 
save('x_L0.mat','x_L0')

% Plot results
plot(x_L0)
title('L0 Minimiser')

% rounding components
for i=1:528
    
         if abs(x_L0(i))<1e-19
          x_L0(i)=0;
         end

       
end

nnz(x_L0)





% %% L0 minimisationm nonlincon
% 
% % options of fmincon routine
% options = optimoptions('fmincon','Display','iter','Algorithm','sqp');% Use SQP
% 
% % cost function
% fun0=@(x)fL0(x,N);%improved sigmoid function 
% 
% % upper and lower bounds
% ub =[0.01 * ones(N,1);inf];
% lb = -ub;
% 
% % Define constraints
% nonlincon = @(x)non_lin_constr(x, A, b, M,N);
% 
% 
% A_eq=[uno'*A, -M];
% b_eq=-uno'*b;
% 
% % initial guess
% x0 = [zeros(N,1);3];
% 
% % optimisation routine
% tic
% [x, fval, exitflag, output] = fmincon(fun0, x0, [], [], A_eq, b_eq, lb, ub,nonlincon, options);
% toc
% % Display output structure for additional debugging information
% disp(output);

% %% L0 with lincon
% options of fmincon routine
% options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
% 
% % cost function
% fun0=@(x)fL0(x,N);
% 
% % upper and lower bounds
% ub =[0.01 * ones(N,1);inf];
% lb = -ub;
% 
% % Define constraints
% %nonlincon = @(x)non_lin_constr(x, A, b, M);
% 
% A_ineq=[    -A,        zeros(M,1);
%              A,       -uno-eps;
%             -A,        uno-eps];
% 
% b_ineq=[b;-b;b];
% 
% A_eq=[uno'*A, -M];
% b_eq=-uno'*b;
% 
% % initial guess
% x0 = [zeros(N,1);3];
% 
% % optimisation routine
% tic
% [x, fval, exitflag, output] = fmincon(fun0, x0, A_ineq, b_ineq, A_eq, b_eq, lb, ub,[], options);
% toc
% % Display output structure for additional debugging information
% disp(output);