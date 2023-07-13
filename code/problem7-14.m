% This simulation offers a solution to problem 7-14 presented in the ...
% book "Fundamentals of Statistical Signal Processing: Estimation ...
% Theory" by Steven M. Kay.
% It is possible to run multiple times and see multiple results
% Author: Reza Ghasemi Alavicheh [r.ghasemi.reza@gmail.com]

%% 
clc;
clear;
%% constant value
N = 100; % or N =10
mu = 0;
sigma2 = 1;

%% Loop
x_data = [];
var_data = [];

for m = 1:100

    x_n = normrnd(mu, sigma2, 1, N);
    x_est = sum(x_n) / N;
    var_est = (sum((x_n - x_est).^2)) / N;
    x_data = [x_data x_est];
    var_data = [var_data var_est];

end

J = x_data ./ (sqrt((var_data)) / sqrt(N)); % given

%% Find center of histogram // plot normal(0,1) 
[values, edges] = histcounts(J, 'Normalization', 'probability');
centers = (edges(1:end - 1) + edges(2:end)) / 2;
G = plot(centers, values, 'b-');
hold on;
x = -4.5:.1:4.5;
y = normpdf(x, 0, 1);
F = plot(x, y);
histogram(J, 'Normalization', 'probability');

%% shape
grid on;
legend('Histogram', 'Theoretical');
ylabel('Estimate PDF for N = 100');
G.LineWidth = 2;
F.LineWidth = 2;
