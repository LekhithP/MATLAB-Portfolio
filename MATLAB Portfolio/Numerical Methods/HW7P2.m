function p2()
    nval=3:3:27;
    houseerr=zeros(size(nval));
    cgserr=zeros(size(nval));
    mgserr=zeros(size(nval));
    for idx=1:length(nval)
        n=nval(idx);
        x=1+(1:30)'/100;
        A=zeros(30,n);
        for i=1:30
            for j=1:n
                A(i,j)=x(i)^(j-1);
            end
        end
        [Q,R]=qrhouse(A);
        houseerr(idx) = norm(Q'*Q-eye(n),2);
        [Q,R]=gsclass(A);
        cgserr(idx)=norm(Q'*Q-eye(n),2);
        [Q,R]=gsmod(A);
        mgserr(idx)=norm(Q'*Q-eye(n),2);
    end
    figure;
    semilogy(nval,houseerr,'o-','DisplayName','Householder');
    hold on;
    semilogy(nval,cgserr,'s-','DisplayName','Classical GS');
    semilogy(nval,mgserr,'^-','DisplayName','Modified GS');
    xlabel('n');
    ylabel('Error(log scale)');
    title('QR Decomposition Error Comparison');
    legend('show');
    grid on;
end
function [Q,R]=qrhouse(A)
    [m,n]=size(A);
    Q=eye(m);
    R=A;
    for k=1:n
        x=R(k:m,k);
        e=zeros(length(x),1);
        e(1)=1;
        v=x+sign(x(1))*norm(x)*e;
        v=v/norm(v);
        R(k:m,k:n)=R(k:m,k:n)-2*v*(v'*R(k:m,k:n));
        Q(:,k:m)=Q(:,k:m)-2*(Q(:,k:m)*v)*v';
    end
    Q=Q(:,1:n);
    R=R(1:n,:);
end
function [Q,R]=gsclass(A)
    [m,n]=size(A);
    Q=zeros(m,n);
    R=zeros(n,n);
    for j=1:n
        v=A(:,j);
        for i=1:(j-1)
            R(i,j)=Q(:,i)'*A(:,j);
            v=v-R(i,j)*Q(:,i);
        end
        R(j,j)=norm(v);
        Q(:,j)=v/R(j,j);
    end
end
function [Q,R]=gsmod(A)
    [m,n]=size(A);
    Q=A;
    R=zeros(n,n);
    for j=1:n
        R(j,j)=norm(Q(:,j));
        Q(:,j)=Q(:,j)/R(j,j);
        for i=(j+1):n
            R(j,i)=Q(:,j)'*Q(:,i);
            Q(:,i)=Q(:,i)-R(j,i)*Q(:,j);
        end
    end
end
%The graph shows that Householder and Modified Gram-Schmidt maintain 
%numerical stability with close to machine precision errors, while 
%Classical Gram-Schmidt falters with increased n, reaching an error of 
%about 10^-2 for n=27. This is because Vandermonde matrices become worse 
%conditioned for larger n, and Classical Gram-Schmidt gradually builds up 
%rounding error due to orthogonalization against the original columns of 
%the matrix rather than progressively updated vectors. These results verify 
%that Householder and Modified Gram-Schmidt are considerably more reliable 
%for QR decomposition, especially for ill-conditioned matrices.