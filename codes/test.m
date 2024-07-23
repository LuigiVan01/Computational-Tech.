
clc
clear all
close all


load("original_x_L1.mat")
load('x_L0_imprvd_sigm.mat')
load("x_L0_inv_Gauss.mat")
load('x_L0_symm_CT.mat')
load('x-value-l0.mat')
load('x_L0.mat')

%fL0(x_L0_imprvd_sigm,528)


for i=1:528
       if abs(x_L0_imprvd_sigm(i))<1e-5
          x_L0_imprvd_sigm(i)=0;
       end
    
         if abs(x(i))<1e-20
          x(i)=0;
         end

        % if abs(x_L0(i))<1e-20
        %   x_L0(i)=0;
        % end
end

% plot(x_L0_symm_CT)
% hold on
plot(x_L0)
% hold on
% plot( x_L0_inv_Gauss)
hold on
plot(original_x)

nnz(x_L0_imprvd_sigm)
nnz(x)
nnz(x_L0)
nnz(original_x)

% fL0(original_x,528)
% fL0(x_L0_imprvd_sigm,528)
% fL0(x_L0_impr_sigm_0_5,528)