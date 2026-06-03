%Problem 3C
f=@(x)x-cos(x);
x0=1/2;
x1=pi/4;
tol=1e-12;
itermax=50;
g=7.390851332151607e-01;
[~,vals,~,~]=my_newton(f,x0,x1,tol,itermax);
h=abs(vals-g);
disp('   d   p_d')
for d=3:length(h)
    p=log(h(d)./h(d-1))/log(h(d-1)./h(d-2));
    fprintf('%4d %10.6f\n',d-1,p);
end