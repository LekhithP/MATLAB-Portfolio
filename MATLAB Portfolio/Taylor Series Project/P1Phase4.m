% Lekhith Ponnaluru
% 12-29-25
% ECE202 Project 1 Phase 4

% Phase 4 takes Phase 3's script and adapts it in such a way that the
% script is more scalable when more non 0 terms are accounted for.

clear;
clf;
format shortG;
disp(datetime)

% Parameters
A = 10; % amplitude, AU
w = 15; % angular frequency, rad/s
Nmax = 6; % max # of nonzero terms
tmin = 0; % start time for plot, ms
tmax = 500; % end time for plot, ms
N = 1000; % # of points to plot

t = linspace(tmin, tmax, N); % time vector for plotting, ms
ts = t/1000; % time vector for calculations, s
num = Nmax; % number of non 0 terms
n = 0:2:(num-1)*2; % exponents for non 0 terms
an = (-1).^(n/2) .* (A .* w.^n)./factorial(n); % AU / s^n

% Table of coefficients
coeff = table(n.', an.', 'VariableNames', {'n, exponent for non 0 term', ...
    'an, coefficient'}); % table of coefficients
disp('Non 0 coefficient table:')
disp(coeff)

% Vectorized powers, partial sums
power = ts(:).^n; % matrix, s^n
y = cumsum(power.*an, 2); % partial sums, AU

% Plotting
axis = 1; % horizontal axis line width
lw5 = 3; % 1st 5 line widths
last = lw5*2;  % last line width

plot([tmin tmax], [0 0], 'k', 'LineWidth', axis)
hold on

ax = gca;
ax.GridAlpha = 0.4; % darker grid
ax.Box = 'on';

% Fonts, axis labels
ax.FontSize = 16;
xlabel('Time, t (ms)', 'FontSize', 18)
ylabel('f_{n}(t), AU', 'FontSize', 18)

% Title
func = ['$f(t) = ' num2str(A) '\cos(' num2str(w) ' t)$'];
title({ 'ECE 202 Project 1 Phase 4', sprintf(['Truncated Series - %d ' ...
    'nonzero terms'], num), func }, 'Interpreter', 'latex', 'FontSize', ...
    21);

% FOR loop
f = zeros(N,1); % truncated sum, AU
p = gobjects(num,1); % array of plot handles
for k = 1:num
    termk = an(k).*(ts(:).^n(k)); % AU
    f = f+termk; % truncated sum, AU
    if k < num
        lw = lw5;
    else
        lw = last;
    end
    p(k) = plot(t, f, 'LineWidth', lw);
end

% Legend
legtext = "{n = "+n+"}";
legend(p, legtext, 'Interpreter', 'latex', 'FontSize', 18, 'Location', ...
    'eastoutside');

xlim([tmin tmax])
ylim([-12 12])
grid on
hold off

% Check: Compare new, scalable 'FOR' loop to old function from Phase 3.
% Computing the difference between the methods should output/return 0.
diff = max(abs(f-y(:,num)));
disp(['Check: ' num2str(diff)]);