% Lekhith Ponnaluru
% 9-26-25
% ECE 202 MATLAB exercise M5

% https://www.chegg.com/homework-help/questions-and-answers/exercise-m5-
% consider-following-function-f-t-time-t-measured-seconds-f-t-12cos-60t-18-
% cos-1-q55542633

%x = a*cos(b).*cos(c) = (a/2)*(cos(b+c)+cos(b-c))

clf
clear

disp(datetime)

t = linspace(-0.15,0.15,1000); %time array (seconds)
t_ms = 1000*t; %time array (ms)

a = 10; %amplitude scalar
b = 60.*t + 1.5; %phase argument b(t), radians
c = 90.*t - 2.5; %phase argument c(t), radians
x = a.*cos(b).*cos(c); %f(t)
y = (a/2).*cos(b+c); %first sinusoid (a/2 * cos(b+c))
z = (a/2).*cos(b-c); %second sinusoid (a/2 * cos(b-c))

% ----- Checks -----

check1 = x-(y+z); %checking array, should be (near) zeros
check2 = sum(abs(check1)) %scalar check: sum of absolute values (should be 
%close to 0)

% The ABS function is being used in this design criterion to measure the
% distance from 0 of each element in the array.

% ----- Plot -----

plot(t_ms,x,"--",t_ms,y,"red",t_ms,z,"green",t_ms,check1,"blue")
title("ECE202 Exercise M5",'FontSize',24)
subtitle("The product of two sinusoids can be written as the sum of two " + ...
    "sinusoids.")
xlabel("t (ms)",'FontSize',21)
ylabel("x(t)",'FontSize',21)
legend("f=10*cos(b).*cos(c)","f1=5*cos(b+c)","f2=5*cos(b-c)", ...
    "Check=f-(f1+f2), should be 0")
ax = gca; %allows modification of the axis
ax.FontSize = 18; %modifies axis font size
grid on