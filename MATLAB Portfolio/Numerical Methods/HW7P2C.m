%Problem 2C
A=[4 -1;-1 4];
b=[3;3];
xs=[1;1];
D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);
w=1.02;
M=(D+w*L)\((1-w)*D-w*U);
c=w*((D+w*L)\b);
x=[0;0];
X=zeros(2,11);
err=zeros(11,1);
ratio=nan(11,1);
X(:,1)=x;
err(1)=norm(x-xs,inf);
for k=1:10
    x=M*x+c;
    X(:,k+1)=x;
    err(k+1)=norm(x-xs,inf);
    ratio(k+1)=err(k+1)/err(k);
end
t=table((0:10)',X(1,:)',X(2,:)',err,ratio,'VariableNames',{'k','x1','x2', ...
    'err','ratio'});
disp(t)
%Col5 seems to be converging to a value of ~0.02