%Problem 3B
f=@(x)x-cos(x);
x0=1/2;
x1=pi/4;
tol=1e-12;
itermax=50;
[root,vals,iter,ierr]=my_newton(f,x0,x1,tol,itermax);
disp('   d  x_d               f(x_d)')
for d=1:length(vals),fprintf('%4d %18.15f %18.15e\n',d-1,vals(d),f(vals(d)) ...
        );
end