% Lekhith Ponnaluru
% 10-4-23
% ECE 202 MATLAB Midterm Exam 1

% https://socratic.org/questions/show-that-sin-3theta-3sin-theta-4sin-theta

% The design of this problem is intended to prove an identity.

clear

% ----- Part A -----

% ----- Givens -----

w = pi;
t = linspace(-1,1,1000);
a = sin(3 * w * t);
b = 3 * sin(w * t) - 4 * sin(w * t) .^ 3;

% ----- Check -----
check = a == b;

% ----- Part B -----

% ----- Plot -----

figure(1)
plot(t,a,"red",t,b,"green")
title("Proving an Identity")
xlabel("t (s)")
ylabel("w(t)")
legend("sin(3*w*t)","3*sin(w*t)-4*sin^3(w*t)")

% ----- Part C -----

i = input("Set the value of w:")

% ----- Givens -----

t = linspace(-pi/i,pi/i,1000);
a = sin(3 * i * t);
b = 3 * sin(i * t) - 4 * sin(i * t) .^ 3;

% ----- Plot -----

figure(2)
plot(t,a,"red",t,b,"green")
title("Proving an Identity")
xlabel("t (s)")
ylabel("w(t)")
legend("sin(3*w*t)","3*sin(w*t)-4*sin^3(w*t)")

% ----- Part D -----

i = input("Set the value of w:")

% ----- Givens -----

t = linspace(-pi/i,pi/i,1000);
a = sin(3 * i * t);
b = 3 * sin(i * t) - 4 * sin(i * t) .^ 3;

% ----- Plot -----

if (-pi/i) <= -0.1 | (pi/i) >= 0.1
    xlabel("t (ms)")
else
    xlabel("t (s)")
end

figure(3)
plot(t,a,"red",t,b,"green")
title("Proving an Identity")
xlabel("t (ms)")
ylabel("w(t)")
legend("sin(3*w*t)","3*sin(w*t)-4*sin^3(w*t)")