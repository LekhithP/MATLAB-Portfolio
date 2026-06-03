% Lekhith Ponnaluru
% 11-28-25
% ECE 202 M8
% Writing a script to compute the decomposition of a ratio of 2 polynomials

clear
disp(datetime)

% Numerator coefficients as variables
a2 = 6;
a1 = 5;
a0 = 4;
% Poles as variables
p1 = 2; 
p2 = 3; 
p3 = 4;

% Calculate coefficients
[c1, c2, c3] = calcCoeff();

% Decomposition check with different values
for k = 1:10
    n = input(['Enter n for case ', num2str(k), ': ']);
    checkDecomp(c1, c2, c3, n, a2, a1, a0, p1, p2, p3);
end

% Function to calculate c1, c2, c3
function [c1, c2, c3] = calcCoeff()
    A = [ 1,  1,  1;
         -7, -6, -5;
         12,  8,  6 ];
    b = [6; 5; 4];
    c = inv(A)*b
    c1 = c(1);
    c2 = c(2);
    c3 = c(3);
end

% Decomposition check
function checkDecomp(c1, c2, c3, n, a2, a1, a0, p1, p2, p3)
    xval = linspace(-5, 5, n);
    Rval = (a2 * xval.^2 + a1*xval + a0)./((xval-p1).*(xval-p2).*(xval-p3));
% Mapping: c1/(x-2), c2/(x-3), c3/(x-4)
    R1val = c1./(xval-p1);
    R2val = c2./(xval-p2);
    R3val = c3./(xval-p3);
    arraycheck = abs(Rval-(R1val+R2val+R3val))
end

% Sometimes the numeric check works, sometimes it doesn't because the
% linspace grid can place sample points @ poles x=2,3, or 4. At a pole the 
% expressions include division by zero, producing Inf/NaN and large errors 
% in the numeric comparison even though the algebraic partial fraction 
% identity is exact.