% Lekhith Ponnaluru
% 9-17-25
% ECE 202 MATLAB exercise M3

%https://hyperphysics.phy-astr.gsu.edu/hbase/col1d.html

%This exercise was inteded to calculate the velocities of 3 different carts
%after their collisions until there were no more collisions, and to see how
%many collisons it would take until there were no more collisions.

clear

disp(datetime)

% ----- Getting Started -----

% givens

m = [250 50 300]; %masses of carts, in g
v0 = [35 10 -45] %velocities of carts, cm/s

% set up total masses for two types of collisions

m23 = m(2)+m(3); %total mass of collision of carts 2 & 3, in g
m12 = m(1)+m(2); %total mass of collision of carts 1 & 2, in g

% set up the checks by computing total energy and momentum

KE0 = (1/2)*sum(m .* v0.^2); %initial kinetic energy of total system,Joules
P0 = sum(m.*v0); %initial momentum of total system, gcm/s

% ----- Collision #1 -----

% Carts 2 & 3 collide first

vA = [ 0 0 0 ];   % initialize vA

vA(1) = v0(1); %velocity, in cm/s
vA(2) = (1/m23)*((m(2)-m(3))*v0(2) + 2*m(3)*v0(3)) %velocity, in cm/s
vA(3) = (1/m23)*(2*m(2)*v0(2) + (m(3)-m(2))*v0(3)) %velocity, in cm/s

% check energy and momentum (expectations) 

checkKE_A = (1/2)*sum(m .* vA.^2) - KE0 %should be equal to 0, Joules
checkP_A = sum(m.*vA)-P0 %should be equal to 0, gcm/s

if (vA(1) > vA(2)) || (vA(2) > vA(3)) %velocity, in cm/s
    disp("Another collision occurs")
else
    disp("No more collisions occur")
    return
end

% ----- Collision #2 -----

% Carts 1 & 2 collide

vB = [ 0 0 0 ]; % initialize vB

vB(1) = (1/m12)*((m(1)-m(2))*vA(1) + 2*m(2)*vA(2)) %velocity, in cm/s
vB(2) = (1/m12)*(2*m(1)*vA(1) + (m(2)-m(1))*vA(2)) %velocity, in cm/s
vB(3) = vA(3) %velocity, in cm/s

checkKE_B = (1/2)*sum(m .* vB.^2) - KE0 %should be equal to 0, Joules 
checkP_B  = sum(m.*vB)-P0 %should be equal to 0, gcm/s

if (vB(1) > vB(2)) || (vB(2) > vB(3)) %velocity, in cm/s
    disp("Another collision occurs")
else
    disp("No more collisions occur")
    return
end

% ----- Collision #3 -----

% Carts 2 & 3 collide

vC = [ 0 0 0 ]; %initialize vC

vC(1) = vB(1) %velocity, in cm/s
vC(2) = (1/m23)*((m(2)-m(3))*vB(2) + 2*m(3)*vB(3)) %velocity, in cm/s
vC(3) = (1/m23)*(2*m(2)*vB(2) + (m(3)-m(2))*vB(3)) %velocity, in cm/s

checkKE_C = (1/2)*sum(m .* vC.^2) - KE0 %should be equal to 0, Joules 
checkP_C  = sum(m.*vC)-P0 %should be equal to 0, gcm/s

if (vC(1) > vC(2)) || (vC(2) > vC(3)) %velocity, in cm/s
    disp("Another collision occurs")
else
    disp("No more collisions occur")
    return
end

% ----- Collision #4 -----

% Carts 1 & 2 collide

vD = [ 0 0 0 ]; %initialize vD 

vD(1) = (1/m12)*((m(1)-m(2))*vC(1) + 2*m(2)*vC(2)) %velocity, in cm/s
vD(2) = (1/m12)*(2*m(1)*vC(1) + (m(2)-m(1))*vC(2)) %velocity, in cm/s
vD(3) = vC(3) %velocity, in cm/s

checkKE_D = (1/2)*sum(m .* vD.^2) - KE0 %should be equal to 0, Joules
checkP_D  = sum(m.*vD)-P0 %should be equal to 0, gcm/s

if (vD(1) > vD(2)) || (vD(2) > vD(3)) %velocity, in cm/s
    disp("Another collision occurs")
else
    disp("No more collisions occur")
    return
end

% ----- Collision #5 -----

% Carts 2 & 3 collide

vE = [ 0 0 0 ]; %initialize vE

vE(1) = vD(1) %velocity, in cm/s
vE(2) = (1/m23)*((m(2)-m(3))*vD(2) + 2*m(3)*vD(3)) %velocity, in cm/s
vE(3) = (1/m23)*(2*m(2)*vD(2) + (m(3)-m(2))*vD(3)) %velocity, in cm/s

checkKE_E = (1/2)*sum(m .* vE.^2) - KE0 %should be equal to 0, Joules
checkP_E  = sum(m.*vE)-P0 %should be equal to 0, gcm/s

if (vE(1) > vE(2)) || (vE(2) > vE(3)) %velocity, in cm/s
    disp("Another collision occurs")
else
    disp("No more collisions occur")
    return
end

% There are 5 collisions