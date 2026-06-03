a = 4*ones(5,1);
b=[0;-1*ones(4,1)];
c=[-1*ones(4,1);0];
f=[3;2;2;2;3];
[alpha,beta]=HW4P3A(a,b,c);
x=trilu_solve(alpha,beta,c,f);
disp('alpha=');
disp(alpha);
disp('beta=');
disp(beta);
disp('x=');
disp(x);
function x=trilu_solve(alpha,beta,c,f)
n=length(alpha);
y=zeros(n,1);
y(1)=f(1);
for i=2:n
    y(i)=f(i)-beta(i)*y(i-1);
end
x=zeros(n,1);
x(n)=y(n)/alpha(n);
for i=n-1:-1:1
    x(i)=(y(i)-c(i)*x(i+1))/alpha(i);
end
end