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

%% L1 minimisation

% cost function
f_sum=ones(2*N,1); 
f=[f_sum;0];

% Definition of inequalities constraints


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
[x_L1,f_L1]=linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);

mean=x_L1(end); % optimal mean
original_x=x_L1(1:N)-x_L1(N+1:2*N);% original desired vector c

% Plotting the x vector
plot(original_x)
title('L1 Minimiser')
