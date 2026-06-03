% Lekhith Ponnaluru
% 10-30-25
% Phase 1, Part B

% Phase 1b plots a power series expansion for f(t), from t = 0 to t = 0.5s,
% using truncated sums, starting with the first non-zero term, then the 
% first two non-zero terms, etc., up to the first 6 non-zero terms.
clear; 
clf
format shortg;
disp(datetime)

% Time vector (s)
t = linspace(0, 0.5, 1000);

% Number of terms in the truncated series
numterms = 6;

% Coefficients array (an)
n = 0:2:(numterms-1)*2;
an = (-1).^(n/2) .* (10 .* 15.^n)./factorial(n) %Formula derived by hand

% Compute powers for all terms
powersmatrix = zeros(length(t), numterms);
for i = 1:numterms
    powersmatrix(:, i) = t.^n(i);
end

% Calculate truncated sums using matrix multiplication
y = cumsum(bsxfun(@times, an, powersmatrix), 2); % AU, Amplitude


% Plotting
for i = 1:numterms
 plot(t, y(:, i), 'LineWidth', 2, 'DisplayName', ['n=' ...
 num2str(n(i))]);
 hold on
end
coef = '$a_n = (-1)^{\frac{n}{2}}\frac{10\cdot 15^{n}}{n!}$'; %Formula in 
% title
title({'ECE 202 Project 1 Phase 1b', ['Truncated Series - ' ...
    num2str(numterms) ' terms'], coef}, 'Interpreter', 'latex');
grid on;
xlabel('t - Time (s)');
ylabel('f(t) - Amplitude (AU)');
ylim([-10, 10]);
legend('show');