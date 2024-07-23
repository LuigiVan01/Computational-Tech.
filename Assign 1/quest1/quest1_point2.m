% Luigi Vanacore 48543518
clc
clear
close all

%% Vectors set up

Z=[5;2;9;10;4;6];       % vector of obsrved prices of raw material

X=[9;13;17;8;10;15];    % vector of observed quantity of product A sold

Y=[1;8;3;5;9;2];        % vector of observed quantity of product B sold

%% linprog usage

f=[0;0;0;1]; % coefficients of the optimisation variables in the objective function

% Definition of inequalities constraints
uno=ones(6,1);

A=[-X,-Y,-uno,-uno;
   +X,+Y,+uno,-uno];
b=[-Z;Z];

% Optimisation
theta=linprog(f,A,b);

%% Results

% Extract optimised parameters from theta
a = theta(1);
b = theta(2);
c = theta(3);

% Calculate predicted values using the optimised parameters
predictedZ = a*X + b*Y + c;

% Calculate residuals (deviations)
residuals = Z - predictedZ;

% Calculate the maximum absolute deviation
maxDeviation = max(abs(residuals));

% Display the optimized parameters and maximum deviation
disp('Optimized Parameters:');
disp(['a: ', num2str(a)]);
disp(['b: ', num2str(b)]);
disp(['c: ', num2str(c)]);
disp(['Maximum Deviation: ', num2str(maxDeviation)]);

%% Visualisation
figure;
hold on;
title('Raw Material Price Prediction');
xlabel('Observation Index');
ylabel('Raw Material Price');

% Plot observed prices
scatter(1:length(Z), Z, 'filled');

% Plot predicted prices
plot(1:length(predictedZ), predictedZ, '-r');
grid on;
hold off;

% Highlight the observation with the maximum deviation
[~, idxMaxDev] = max(abs(residuals));
hold on;
scatter(idxMaxDev, Z(idxMaxDev), 'filled'); % Highlight in plot the mximum deviation point
legend('Observed Prices', 'Predicted Prices','Maximum deviation data point', 'Location', 'best');
hold off;