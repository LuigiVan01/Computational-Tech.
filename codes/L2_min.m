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


 %% L2 minimisationm using nonlincon definition

%options of fmincon routine
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');% Use SQP and display iteraions


% cost function definition
fun2=@(x)fL2(x,N);

% upper and lower bounds
ub =[0.01 * ones(N,1);inf];
lb = -ub;

% Define constraints
nonlincon = @(x)non_lin_constr(x, A, b, M,N); % non linear constraint
A_eq=[uno'*A, -M];
b_eq=-uno'*b;

% initial guess
x0 = [0.01/2*ones(N,1);3];

% optimisation routine
tic
[x, fval, exitflag, output] = fmincon(fun2, x0, [], [], A_eq, b_eq, lb, ub,nonlincon, options);
toc
mean=x(end);


% Display output structure for additional debugging information
disp(output);

% Plot results
plot(x(1:end-1))
title('L2 Minimiser')

% %% L2 minimisationm using linear constraints definition
% 
% % options of fmincon routine
% options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
% 
% % cost function
% fun2=@(x)fL2(x,N);
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
% x0 = 0.01/2*ones(N+1,1);
% 
% % optimisation routine
% tic
% [x, fval, exitflag, output] = fmincon(fun2, x0, A_ineq, b_ineq, A_eq, b_eq, lb, ub,[], options);
% toc
% % Display output structure for additional debugging information
% disp(output);
% 
