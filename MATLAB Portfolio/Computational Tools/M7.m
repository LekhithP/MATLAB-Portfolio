% Lekhith Ponnaluru
% 11-27-25
% ECE 202 M7
% Calculating current, voltage, and power to find the total energy
% absorbed, the total energy stored and their difference.

clear
clf
disp(datetime)

% Givens
V0 = 5; % Source voltage in volts
R = 2; % Resistor value in ohms
L = 10e-3; % Inductor inductance (10 mH)

% Time constant
tau = L/R;

% Time vector
ts = linspace(0,10*tau,1000);
t = ts*1e3;

% Current
it = (V0/R)*(1-exp(-ts/tau));

% Voltage across the inductor
vt = V0*exp(-ts/tau);

% Power absorbed by the inductor
pt = vt.*it;

% Total absorbed energy
w_abs = trapz(ts,pt)

% Final energy stored
i_final = V0/R
w_final = 0.5*L * i_final^2

% % error
percent_error = 100*(w_abs-w_final)/w_final

% Plots

subplot(3, 1, 1);
plot(t, it);
grid on
ylabel('Current (A)');
text(0.01,1.7,{sprintf('i(t)=%.3g/%.3g*(1-e^{-t/\\tau})',V0,R)});

subplot(3, 1, 2);
plot(t, vt);
grid on
ylabel('Voltage (V)');
text(0.01,0.5,{sprintf('v(t)=%.3g*e^{-t/\\tau}',V0)});

subplot(3, 1, 3);
plot(t, pt);
grid on
xlabel('Time (ms)');
ylabel('Power (W)');
text(0.2,0.3,'p(t)=v(t)*i(t)');

% Subtitles
sgtitle(['Inductor Charging Circuit Analysis: Current, Voltage, and' ...
    ' Power absorbed for a charging inductor (V_0 = ' num2str(V0) 'V, '...
    'R = ' num2str(R) '\Omega , L = ' num2str(L * 1e3)  'mH)']);