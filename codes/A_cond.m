% Luigi Vanacore 48543518

clc
clear all
close all

% Load data
load('A.mat'); 
load('b.mat'); 

M=size(A,1); % number of sampled points
N=size(A,2); % number of x components
% Example of scaling a matrix A
D = diag(1 ./ sqrt(sum(A.^2, 1)));
A_scaled = A * D;

% Regularizing a matrix A
epsilon = 1e-5;  % Small regularization factor
A_regularized = A + epsilon * eye(size(A));

% SVD-based approximation of A
[U, S, V] = svd(A);
tol = 1e-5;
S(S < tol) = tol;
A_new = U * S * V';

cond(A_regularized)


% A_mia=A(1,:)/(max(A(1,:)));
% 
% for i=2:M
%     v=max(A(i,:));
%     A(i,:)=A(i,:)/v;
%     A_mia=addRowToMatrix(A_mia,A(i,:))
% end


%cond(A_mia)
% % Orthogonal transformation example
% Q = orth(rand(size(A)));
% A_new_basis = Q' * A * Q;
% 
% % Example of preconditioning
% P = diag(1 ./ diag(A));  % Diagonal preconditioner
% A_preconditioned = P * A;