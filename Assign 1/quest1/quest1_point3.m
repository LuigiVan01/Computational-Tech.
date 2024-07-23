% Luigi Vanacore 48543518
clc 
clear all
close all


% Matrix definitions

A=[ 9  1 1;
    13 8 1;
    17 3 1;
     8 5 1;
    10 9 1;
    15 2 1];

b=[5;2;9;10;4;6];

% Resolution with normal equation

x2=(A'*A)^-1*A'*b



