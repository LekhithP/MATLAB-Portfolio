% Lekhith Ponnaluru
% 12-30-25
% ECE202 Project 1 Phase 6

% Phase 6 of Project 1 uses the same exact script that was developed in
% Phase 5 to answer the 7 questions being asked to ensure that we
% understand the Taylor series and how varying values (may) affect it.

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
title({ 'ECE 202 Project 1 Phase 6', sprintf(['Truncated Series - %d ' ...
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

% Phase 6 answers

% A. The smallest # of non 0 terms is 11.

% B. It can be confirmed that after doubling the # of points being plotted
% (in this case, from 1000 pts to 2000 pts), there's not a noticable/real
% change in the average magnitude deviation. For 1000 pts, 11 non 0 terms,
% the avg dev was 0.0063675, and for 2000 pts, 11 non 0 terms, the avg dev
% was 0.0063345, so a barely noticable difference.

% C. I predict that changing the starting time value to -500 ms instead of
% 0 ms but keeping the same end time, # of non 0 terms, and # of points
% being plotted would keep the avg dev about the same as the Taylor series
% is supposed to be symmetric around 0, so whatever behavior it displays
% for its positive times, it should display the same behavior for any
% "negative" times.

% D. When I ran my script to check the prediction that I made in C, I was
% returned a avg dev value of 0.0064402, which is a barely noticeable
% difference from the avg dev values that were obtained in A and B.
% Observing the figure that was output as a result of running the script,
% it shows the same behavior for "negative" time values as it does for
% positive time values, showing symmetry around t=0, which is the same
% behavior that I predicted that it would show. I essentially correctly
% predicted that the avg dev value would stay about the same as in A and B,
% and that the figure would show symmetric behavior.

% E. I predict that the avg magnitude deviation will be roughly the same as
% the previous parts with the same values that were used in D, apart from
% the start time (now 500 ms instead of 0 on a 0 - 1000 ms time interval) 
% and end time (1000 ms). Starting at 500 ms, meaning the midpoint of the
% time interval, I expect approximation to be either about the same or
% better, which is why I predict that the avg magnitude dev will be about
% the same.

% F. During the 2nd 500 ms time interval (500ms - 1000ms) the Taylor Series
% essentially "breaks" and behaves abnormally compared to the 0ms - 500ms
% time interval. The Taylor Series that's centered around t = 0 only
% converges well around 0, and the farther we move away from this value,
% the faster the Taylor Series becomes less accurate unless we can provide
% for more terms to keep the series accurate.

% G. 21 non 0 terms are needed.