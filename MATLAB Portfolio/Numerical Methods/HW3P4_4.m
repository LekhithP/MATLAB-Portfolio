B=[-2.1797 0.6557 0.6787 0.6555;
    0.9157 -2.7110 0.7577 0.1712;
    0.7922 0.8491 -1.5009 0.7060;
    0.9595 0.9340 0.3922 -2.2739];
c=[3.7898; -1.5484; 0.8117; -5.0915];
exact=[1;2;3;4];
gaussian=gauss(B,c);
partial=B\c;
[L,U]=lu(B); 
j=U\(L\c);
fprintf(['FE: %g (Gaussian), %g (Gaussian Partial Pivot), %g (LU Decomp)' ...
    '\nBE: %g (Gaussian), %g (Gaussian Partial Pivot), %g (LU Decomp)\n'], ...
    norm(gaussian-exact), norm(partial-exact), norm(j-exact), ...
    norm(B*gaussian-c), norm(B*partial-c), norm(B*j-c));

function x=gauss(B,c)
    n=numel(c); 
    M=[B c];
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

function [L,U]=lu(B)
    n=size(B,1); 
    L=eye(n); 
    U=B;
    for k=1:n-1
        if U(k,k)==0
        end
        L(k+1:n,k)=U(k+1:n,k)/U(k,k);
        U(k+1:n,k:n)=U(k+1:n,k:n)-L(k+1:n,k)*U(k,k:n);
    end
end