% Lekhith Ponnaluru
% 12-29-25
% ECE202 Project 1 Phase 3

% Phase 3 takes Phase 2's script and slightly changes only the code in such
% a way that it will be easier to use/adapt for the upcoming phases.

clear;
clf;
format shortG;
disp(datetime)

% Parameters
A = 10; % amplitude of sinusoid, AU
w = 15; % angular frequency, rad/s
Nmax = 6; % max # of non 0 terms
tmin = 0; % start time, ms
tmax = 500; % end time, ms
N = 1000; % # of points

tms = linspace(tmin, tmax, N); % time vector, ms
ts = tms/1000; % time for calculations, s
numterms = Nmax; % # of nonzero terms

n = 0:2:(numterms-1)*2; % exponents
an = (-1).^(n/2) .* (A .* w.^n)./factorial(n); % coefficients, AU / s^n

% Coefficients table
coeff = table(n.', an.', 'VariableNames', {'n, exponent for non 0 term', ...
    'an, coefficient'}); % table
disp('Non 0 coefficient table:')
disp(coeff)

% Vectorized powers, truncated partial sums
powersmatrix = ts(:).^n; % matrix, s^n
y = cumsum(powersmatrix.*an, 2); % partial sums, AU

% Plotting params
axis = 1; % horizontal axis width
lw5 = 3; % width for 1st 5 curves
last = lw5*2; % width for last curve

plot([tmin tmax], [0 0], 'k', 'LineWidth', axis)
hold on
p1 = plot(tms, y(:,1:min(5,numterms)), 'LineWidth', lw5);
if numterms > 5
    p2 = plot(tms, y(:,numterms), 'LineWidth', last);
else
    p2 = [];
end

ax = gca;
ax.GridAlpha = 0.4; % darker grid
ax.Box = 'on';

% Fonts, axis labels
ax.FontSize = 16;
xlabel('Time, t (ms)', 'FontSize', 18)
ylabel('f_{n}(t), AU', 'FontSize', 18)

% Title
func = ['$f(t) = ' num2str(A) '\cos(' num2str(w) ' t)$'];
title({ 'ECE 202 Project 1 Phase 3', ...
        sprintf('Truncated Series - %d nonzero terms', numterms), func }, ...
        'Interpreter', 'latex', 'FontSize', 21);

% Legend
legendtext = "{n = "+n+"}"; % string array for labels
legendhandle = [p1(:); p2]; % handles for plots
legend(legendhandle, legendtext, 'FontSize', 18, 'Location', 'eastoutside')

xlim([tmin tmax])
ylim([-12 12])
grid on
hold off

% Visual check: The assigned parameters output a figure/graph that is
% identical to that output from Phase 2.