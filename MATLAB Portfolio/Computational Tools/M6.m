3% Lekhith Ponnaluru
% 11-10-25
% ECE 202 M6
% Solving collisions of three carts with user inputs, a while loop, and a
% user-defined function

% *****Citation*****
% M3 and ECE 202 Lecture Notes

clear
disp(datetime)

% User Input
v1 = input('Initial Velocity of Cart 1 in cm/s: ');
v2 = input('Initial Velocity of Cart 2 in cm/s: ');
v3 = input('Initial Velocity of Cart 3 in cm/s: ');
v = [v1, v2, v3]
m1 = input('Mass of Cart 1 in g: ');
m2 = input('Mass of Cart 2 in g: ');
m3 = input('Mass of Cart 3 in g: ');
m = [m1, m2, m3];
threshold = input('Enter threshold value for checks: ');

% Initial momentum and energy (total)
P0 = sum(m.*v);
E0 = (1/2)*sum(m .* v.^2);

% # of collisions
count = 0;

% Adding to the count
while v(1) > v(2) || v(2) > v(3)
    count = count+1; 
    
    % Determining which carts collide next
    if v(1) > v(2) && v(2) <= v(3)
        collision = 12;
    elseif v(2) > v(3)
        collision = 23;
    else
        collision = input("Next collision (12 or 23): ");
    end

    % Calling the user-defined function
    v = collide(v, collision, m)
    
    % Display final velocities after each collision
    fprintf('\nCart Velocities After Collision #%d:\n', count);
    disp(v);

    % Energy and momentum checks
    CheckKE = (1/2)*sum(m .* v.^2) - E0;
    CheckMomentum = sum(m.*v)-P0;

    % Check and display conservation results
    if abs(CheckKE) > threshold
        fprintf("Kinetic Energy not conserved: %g\n", CheckKE);
    end

    if abs(CheckMomentum) > threshold
        fprintf("Momentum not conserved: %g\n", CheckMomentum);
    end
end

if count == 0
    disp("No collisions occurred")
else
    disp("No more collisions can occur")
end

% User-defined function for collisions
function vf = collide(vi, collision, m)
    global m;
    if collision == 12
        M = m(1)+m(2);
        vf = [(m(1)-m(2))/M*vi(1) + 2*m(2) / M*vi(2), (m(2)-m(1)) / ... 
            M*vi(2) + 2*m(1) / M*vi(1), vi(3)];
    elseif collision == 23
        M = m(2)+m(3);
        vf = [vi(1), (m(2)-m(3)) / M*vi(2) + 2*m(3) / M*vi(3), (m(3)-m(2))...
            / M*vi(3) + 2*m(2) / M*vi(2)];
    end
end