% Lekhith Ponnaluru
% 9-14-25
% ECE 202 MATLAB exercise M2

% https://www.chegg.com/homework-help/questions-and-answers/using-
% situation-m1-let-s-turn-design-problem-let-s-keep-everything-cart-
% right-2-change-car-q33850197

% This problem is designed to find the mass of cart 2 such that when
% cart 1 hits it, it would abruptly stop due to the collision,
% transferring all the energy from cart 2 to cart 1.


clear   % clears the registers, which helps catch typos

disp(datetime) % Output execution timestamp

% ----- givens -----

% Left cart is #1; right cart is #2

m1  = input('Enter mass m1 (g): '); %mass, in g
v1i = input('Enter initial velocity v1i (cm/s): '); %initial velocity, in
% cm/s
v2i = -50;   % initial velocity, in cm/s
v2f = 0; %final velocity, in cm/s

% ----- calculation -----

m2 = (v2f*m1 + m1*v2i - 2*m1*v1i)/(v2i-v2f)

m = m1+m2; %Total mass, in g

v1f = (1/m)*((m1-m2)*v1i + 2*m2*v2i) %Final velocity, in cm/s


% ----- check conservation of momentum and energy -----

checkM = (m1*v1i + m2*v2i)-(m1*v1f + m2*v2f) %Checks momentum,
% should be zero

checkE = .5*(m1 * v1i^2 + m2 * v2i^2 - m1 * v1f^2 - m2 * v2f^2) %Checks 
% energy, should be zero


% initial and final kinetic energies, in Joules

KEi = (1/2)*(m1 * v1i^2 + m2 * v2i^2);
KEf = (1/2)*(m1 * v1f^2 + m2 * v2f^2);

checkKE = KEf-KEi %Checks kinetic energy, should be zero


% ----- check that design is successful -----

check_v2f = 0 - (1/m)*(2*m1*v1i + (m2-m1)*v2i)   %Checks final velocity of
% cart 2, in cm/s

% v2f_new = (1/m)*(2*m1*v1i + (m2 - m1)*v2i) - (1/m)*(2*m1*v1i + (m2 - ...
%    m1)*v2i)

% This is a successful design because it find the mass of the cart
% causing it to come to a stop when it collides with cart 1, and the
% checks and calculations align with each other as they're expected to.