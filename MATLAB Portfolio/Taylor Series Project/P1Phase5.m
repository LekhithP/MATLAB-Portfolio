% Lekhith Ponnaluru
% 12-30-25
% ECE202 Project 1 Phase 5

% Phase 5 of Project 1 takes Phase 4's script and evolves it so that it now
% asks for user inputs for some values at the very start of the script
% which depends on how the rest of the script formats/calculates, along
% with implementing an average mediation check. This phase is "technically"
% the last phase in which there will be alterations made to the script from
% a prior phase.

clear;
clf;
format shortG;
disp(datetime)

% Givens
A = 10; % amplitude, AU
w = 15; % angular frequency, rad/s

% User inputs
N = input('# of points: '); % # points
Nmax = input('# of non 0 terms: ');% # non 0 terms
tmin = input('Start time in ms: '); % start time, ms
tmax = input('End time in ms: '); % end time, ms

t = linspace(tmin, tmax, N); % time for plotting, ms
ts = t/1000; % time for calculations, s
num = Nmax; % # of non 0 terms
n = 0:2:(num-1)*2; % exponents
an = (-1).^(n/2) .* (A .* w.^n)./factorial(n); % AU / s^n

% Table of coefficients
coeff = table(n.', an.', 'VariableNames', {'n, exponent for non 0 term', ...
    'an, coefficient'}); % table of 
% coefficients
disp('Non 0 coefficient table:')
disp(coeff)

% Vectorized powers, partial sums
power = ts(:).^n; % matrix, s^n
y = cumsum(power.*an, 2); % partial sums, AU

% Plotting
axis = 1; % horizontal axis line width
lw5 = 3; % width for 1st 5 curves
last = lw5*2; % last curve width

plot([tmin tmax],[0 0],'k','LineWidth',axis)
hold on

ax = gca;
ax.GridAlpha = 0.4; % darker grid
ax.Box = 'on';

% Fonts, axis labels
ax.FontSize = 16;
xlabel('Time, t (ms)','FontSize',18)
ylabel('f_{n}(t), AU','FontSize',18)

% FOR loop
f = zeros(N,1); % truncated sum, AU
p = gobjects(num,1); % array of plot handles
for k = 1:num
    termk = an(k).*(ts(:).^n(k));  % AU
    f = f+termk; % truncated sum, AU
    lw = lw5;
    if k == num
        lw = last;
    end
    p(k) = plot(t, f, 'LineWidth', lw);
end

% Legend
legtext = "{n = "+n+"}";
legend(p, legtext, 'Interpreter','latex', 'FontSize', 18, 'Location', ...
    'eastoutside')

% Exact function, avg dev
trueval = A*cos(w*ts); % exact function @ ts, AU
avg = mean(abs(f-trueval(:))); % avg magnitude dev, AU
disp(['Avg dev = ' num2str(avg)])

% Title
func = ['$f(t) = ' num2str(A) '\cos(' num2str(w) ' t)$'];
title({ 'ECE 202 Project 1 Phase 5', sprintf(['Truncated Series - %d ' ...
    'Non 0 terms'], num), sprintf('Avg dev = %g, AU', avg), func }, ...
    'Interpreter','latex','FontSize',21);

xlim([tmin tmax])
ylim([-12 12])
grid on
hold off

% Check (only when n=6): Compare new, scalable 'FOR' loop to old function 
% from Phase 3. Computing the difference between the methods should output/
% return 0.
if num == 6
    diff = max(abs(f-y(:,num)));
    disp(['Check: ' num2str(diff)]);
else
end

% Visual check: The figure/graph that was output is identical to that of
% previous phases. The inputs work as they should.