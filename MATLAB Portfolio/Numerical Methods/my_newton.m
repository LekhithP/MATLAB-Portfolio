%Problem 3A
function [root,vals,iter,ierr]=my_newton(f,x0,x1,tol,itermax)
vals=zeros(itermax+2,1);
vals(1)=x0;
vals(2)=x1;
for iter=1:itermax,b=f(vals(iter));
    c=f(vals(iter+1));
    vals(iter+2)=vals(iter+1)-c*(vals(iter+1)-vals(iter))/(c-b);
    if abs(f(vals(iter+2)))<=tol
        root=vals(iter+2);
        ierr=0;
        vals=vals(1:iter+2);
        return
    end
end
root=vals(end);
ierr=1;
end