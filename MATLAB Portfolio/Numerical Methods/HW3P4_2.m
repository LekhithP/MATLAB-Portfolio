A=[2.4117 0.6557 0.6787 0.6555;
   0.9157 1.8804 0.7577 0.1712;
   0.7922 0.8491 3.0905 0.7060;
   0.9595 0.9340 0.3922 2.3175]; 
b=[8.3812; 7.6344; 14.5859; 13.2741];
gaussian=gauss(A,b);
partial=A\b;
[L,U]=lu(A); 
j=U\(L\b);
fprintf('BE Gaussian: %g\nBE Gaussian Partial Pivot: %g\nBE LU Decomp: %g\n',...
    norm(A*gaussian-b), norm(A*partial-b), norm(A*j-b));

function x=gauss(A,b)
    n=numel(b); 
    M=[A b];
    for k=1:n-1
        if M(k,k)==0 
        end
        m=M(k+1:n,k)/M(k,k);
        M(k+1:n,k:n+1)=M(k+1:n,k:n+1)-m*M(k,k:n+1);
    end
    x=zeros(n,1);
    for i=n:-1:1
        x(i)=(M(i,end)-M(i,i+1:n)*x(i+1:n))/M(i,i);
    end
end

function [L,U]=lu(A)
    n=size(A,1); 
    L=eye(n); 
    U=A;
    for k=1:n-1
        if U(k,k)==0
        end
        L(k+1:n,k)=U(k+1:n,k)/U(k,k);
        U(k+1:n,k:n)=U(k+1:n,k:n)-L(k+1:n,k)*U(k,k:n);
    end
end