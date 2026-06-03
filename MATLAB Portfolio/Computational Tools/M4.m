% Lekhith Ponnaluru
% 9-23-25
% ECE 202 MATLAB exercise M4

clf
clear

disp(datetime)

% ----- Part A -----

t = linspace(-3,3,1000); %creates array to use for plot in s

f = (1 + t/2 - t.^2 / 3); %truncated power series function

figure(1)
plot(t,f,'LineWidth',3)
title("ECE202, Exercise M4, Part A")
subtitle("Truncated Power Series")
xlabel("t (s)")
ylabel("f(t)")
grid on

% ----- Part B -----

x = linspace(0,10,1000); %creates array to use for plot in m

g = 3*sin(4*(x-5)); %shifted sinusoid function

figure(2)
plot(x,g,'red')
title("ECE202, Exercise M4, Part B")
subtitle("Shifted Sinusoid")
axis([0 10 -5 5])
xlabel("X (m)")
ylabel("g(x)")
grid on

% ----- Part C -----

x = linspace (-8,10,1000); %creates array to use for plot in m

p = 1/(4*sqrt(pi))*exp(-(x-2).^2 / 16); %normalized gaussian function(m^-1)

figure(3)
plot(x,p,"LineStyle","--")
title("ECE202, Exercise M4, Part C",'FontSize',24)
subtitle("Normalized Gaussian")
xlabel("X (m)",'FontSize',21)
ylabel("P(x) (m^-1)",'Fontsize',21)
ax = gca; %allows modification of the axis
ax.FontSize = 18; %modifies axis font size
grid on

%Integral Check

tmin = -8; %lower bound for integral (m)
T = 10; %upper bound (m)
N = 1000; %#of integration values
dt = ((T-tmin)/N); %integral (m)
a = dt*sum(p(1 : N)) %should be 1

% ----- Part D -----

tms = linspace (0,50,1000); %time array in ms
ts  = tms/1000; %conversion to s for computing
v1 = 8*exp(-400*ts) - 2*exp(-200*ts); %overdamped (v)
v2 = 8*exp(-300*ts) - 3000*ts.*exp(-300*ts); %critically damped (v)
v3 = 8*exp(-100*ts).*cos(400*ts) + 4*exp(-100*ts).*sin(400*ts);%underdamped 
% (v)
figure(4)
plot(tms,v1,"red",tms,v2,"green",tms,v3,"blue")
title("ECE 202, Exercise M4, Part D")
subtitle("Three Dampings For Parallel RLC")
xlabel("t (ms)")
ylabel("v (volts)")
legend({'v1(t)—overdamped','v2(t)—critically damped','v3(t)—underdamped'})
grid on