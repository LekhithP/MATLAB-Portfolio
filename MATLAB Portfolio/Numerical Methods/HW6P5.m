A=[ 1  2  1  2;
    2 -5 -2  2;
    2 -3  4 -4;
   -2 -5 -5 -1;
    1 -5 -1 -1;
   -4  3 -2  1 ];
b=[1;2;3;3;2;1];
function [Q,R]=mgs(A)
    [m,n]=size(A);
    Q=zeros(m,n);
    R=zeros(n,n);
    a=A;
    for i=1:n
        R(i,i)=norm(a(:,i));
        Q(:,i)=a(:,i)/R(i,i);
        for j=i+1:n
            R(i,j)=Q(:,i)'*a(:,j);
            a(:,j)=a(:,j)-R(i,j)*Q(:,i);
        end
    end
end
[Qred,Rred]=mgs(A);
disp('Reduced Q and R:');
disp(Qred);
disp(Rred);
e1=[1;0;0;0;0;0];
e2=[0;1;0;0;0;0];
A2=[A,e1,e2];
[Q2,R2]=mgs(A2);
disp('Q and R for augmented A:');
disp(Q2);
disp(R2);
least=Rred\(Qred'*b);
resid=norm(A*least-b)^2;
fprintf('Least squares x*=\n');
disp(least);
fprintf('Residual norm^2=%.6g\n',resid);
e3=rand(6,1);
e4=rand(6,1);
A3=[A,e3,e4];
[Q3,R3]=mgs(A3);
least2=Rred\(Qred'*b);
fprintf('x* unchanged:\n');
disp(least2);