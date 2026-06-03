classdef helper
    methods(Static)
        function [x,residual]=j(A,b,x0,iter)
            d=diag(diag(A));
            r=A-d;
            x=x0;
            residual=zeros(iter,1);
            for k=1:iter
                x=(b-r*x)./diag(d);
                residual(k)=norm(b-A*x);
            end
        end
        function [x,residual]=gs(A,b,x0,iter)
            n=size(A,1); 
            x=x0;
            residual=zeros(iter,1);
            for k=1:iter
                for i=1:n
                    s=A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
                    x(i)=(b(i)-s)/A(i,i);
                end
                residual(k)=norm(b-A*x);
            end
        end
        function [x,residual]=sor(A,b,x0,w,iter)
            n=size(A,1);
            x=x0;
            residual=zeros(iter,1);
            for k=1:iter
                for i=1:n
                    s=A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
                    xi=(b(i)-s)/A(i,i);
                    x(i)=(1-w)*x(i)+w*xi;
                end
                residual(k)=norm(b-A*x);
            end
        end
    end
end