% Lekhith Ponnaluru
% 9-10-25
% ECE 202 MATLAB exercise M1

% https://share.google/aimode/thtzQmsloH4bTkkeM

% This assignment requires finding the final velocities of two carts that
% are traveling along the same straight line that end up colliding
% elastically and then verifying those final velocities by checking that
% two physical principles are satisfied.

clear   % clears registers, to catch mistakes

disp(datetime) % Output execution timestamp

% ----- givens -----

% Left cart is #1; right cart is #2

m1 = 200; % mass, in g
m2 = 150;   % mass, in g
v1i = 50;   % initial velocity, in cm/s
v2i = -20;   % initial velocity, in cm/s

% ----- calculations -----

m = m1+m2; %Total mass, in g
v1f = (1/m)*((m1-m2)*v1i + 2*m2*v2i) %Final velocity, in cm/s
v2f = (1/m)*(2*m1*v1i + (m2-m1)*v2i) %Final velocity, in cm/s

% ----- check two conservation laws -----

checkM = (m1*v1i + m2*v2i)-(m1*v1f + m2*v2f) %Checks momentum,
% should be zero

checkE = .5*(m1 * v1i^2 + m2 * v2i^2 - m1 * v1f^2 - m2 * v2f^2) %Checks 
% energy, should be zero