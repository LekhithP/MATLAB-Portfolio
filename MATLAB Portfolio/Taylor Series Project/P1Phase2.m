% Lekhith Ponnaluru
% 12-29-25
% Phase 2 takes the code from Phase 1B of Project 1 and adds features that
% makes the output of the script format better.

clear;
clf;
format shortG;
disp(datetime)

A = 10; % amplitude, AU
w = 15; % angular frequency, rad/s
tms = linspace(0,500,1000); % time vector for plotting, ms
tsec = tms/1000; % time for calculations, s
numterms = 6; % # of non 0 terms

n = 0:2:(numterms-1)*2; % exponents for non 0 terms
an = (-1).^(n/2) .* (10 .* 15.^n)./factorial(n); % coefficients, AU/s^n

% Coefficients table
coeff = table(n.', an.', 'VariableNames', {'n, exponent for non 0 term', ...
    'an, coefficient'}); % table variable
disp('Nonzero coefficient table:')
disp(coeff)

% Vectorized powers, truncated partial sums
powersmatrix = tsec(:).^n; % matrix
y = cumsum(powersmatrix.*an, 2); % partial sums, AU

% Plotting params
axis = 1; % horizontal axis width
lw5 = 3; % width for 1st 5 curves
last = lw5*2; % width for last curve

% Horizontal axis
plot([0 500], [0 0], 'k', 'LineWidth', axis); % axis line, AU
hold on

% 1st 5 truncated functions
p1 = plot(tms, y(:,1:5), 'LineWidth', lw5); % array for 1st 5

% Last truncated function
p2 = plot(tms, y(:,6), 'LineWidth', last); % handle for last curve

ax = gca;                  
ax.GridAlpha = 0.4; % darker grid
ax.Box = 'on';

% Fonts, axis labels
ax.FontSize = 16;
xlabel('Time, t (ms)', 'FontSize', 18)
ylabel('f_{n}(t), AU', 'FontSize', 18)

% Title
func = ['$f(t) = ' num2str(A) '\cos(' num2str(w) ' t)$'];
title({ 'ECE 202 Project 1 Phase 2', ...
        ['Truncated Series - ' num2str(numterms) ' nonzero terms'], func}, ...
        'Interpreter','latex','FontSize',21);

% Legend
legendtext = "{n = "+n+"}"; % string array for labels
legendhandle = [p1(:); p2]; % handles for plots
legend(legendhandle, legendtext,'FontSize',18, 'Location','eastoutside');

ylim([-12 12])
grid on
hold off