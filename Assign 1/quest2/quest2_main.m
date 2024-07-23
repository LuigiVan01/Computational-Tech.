% Luigi Vanacore 48543518
clc
clear all
close all

fun=@(x)(-10*(50-x)*sqrt(x-25)); % function to minimise ( Area changed in sign)

%% Successive parabolic interpolation

% Interval and initial guess definition
x1=25;
x2=45;
x3=50;

n=70; %maximum number of interations
tol=1;% tolerance on the lenght of the interval

tic
xmin_parab=parab(fun,x1,x2,x3,n,tol)
toc

%% Newton's Method

x0_guess=45; %initial guess
tol=1e-3;    %tolerance on the magnitude of the gradient
n=30;        %maximum number of iterations

tic
xmin_newton=Newton(x0_guess,n,tol) 
toc
