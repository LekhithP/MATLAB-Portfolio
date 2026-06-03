function [alpha,beta]=HW4P3A(a,b,c)
n=length(a);
alpha=zeros(n,1);
beta=zeros(n,1);
alpha(1)=a(1);
for i=2:n
    beta(i)=b(i)/alpha(i-1);
    alpha(i)=a(i)-beta(i)*c(i-1);
end
end