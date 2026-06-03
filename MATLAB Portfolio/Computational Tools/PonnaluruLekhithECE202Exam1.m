% Lekhith Ponnaluru
% 10-2-25
% ECE202 Exam 1 Part 3

clf
clear

%----------------Part A---------------------
w = pi;%rad/s
N = 1000;%# of time samples
t = linspace (-0.25,0.25,N);%time vector (s)
y1 = tan(w.*t);%tan function
y2 = sin(w.*t) ./ cos(w.*t);%sin/cos function
equalcheck = max(abs(y1 - y2))%check to show that tan(wt)=sin(wt)/cos(wt),
%should be 0

%----------------Part B---------------------
t0 = input ('Start time t0(s): ');%asks user to input start time (s)
t1 = input ('End time t1(s): ');%asks user to input end time (s)
if ~(t0<t1)
end
t = linspace (t0,t1,N);%time vector (s)

%----------------Part C---------------------
wtmin = w*min(t);%rad
wtmax = w*max(t);%rad
if wtmin <= -pi/2 || wtmax >= pi/2
    fprintf('ERROR: Discontinuity')
    return
end
y3 = tan(w.*t);%tan function
y4 = sin(w.*t) ./ cos(w.*t);%sin/cos function
equalcheck1 = max(abs(y3 - y4))%check to show that tan(wt)=sin(wt)/cos(wt),
%should be 0

%----------------Part D---------------------
figure(1)
plot(t, y3, "red", t, y4, '--')
grid on
title("Tan w(t) = sin w(t)/cos w(t)")