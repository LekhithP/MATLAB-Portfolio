nlist=10:10:50;
u0f=zeros(size(nlist));
u0c=zeros(size(nlist));
figure;
subplot(2,1,1);
hold on;
title('Forward FD');
ylabel('u');
subplot(2,1,2);
hold on;
title('Central FD');
xlabel('x');
ylabel('u');
for k=1:length(nlist)
    n=nlist(k);
    h=1/n;
    x=(0:n-1)'*h;
    A=zeros(n);
    b=zeros(n,1);
    for i=1:n-1
        A(i,i)=-1/h;
        A(i,i+1)=1/h;
        b(i)=cos(10*x(i)^2);
    end
    A(n,n)=-1/h;
    b(n)=cos(10*x(n)^2)-(1/h)*(-1);
    uf=A\b;
    B=zeros(n);
    c=zeros(n,1);
    B(1,1)=-1/h;
    B(1,2)=1/h;
    c(1)=cos(10*x(1)^2);
    for i=2:n-1
        B(i,i-1)=-1/(2*h);
        B(i,i+1)=1/(2*h);
        c(i)=cos(10*x(i)^2);
    end
    B(n,n-1)=-1/(2*h);
    c(n)=cos(10*x(n)^2)-(1/(2*h))*(-1);
    uc=B\c;
    u0f(k)=uf(1);
    u0c(k)=uc(1);
    subplot(2,1,1);
    plot(x,uf,'-o','DisplayName',['n=' num2str(n)]);
    subplot(2,1,2);
    plot(x,uc,'-s','DisplayName',['n=' num2str(n)]);
end
subplot(2,1,1);
legend('show');
hold off;
subplot(2,1,2);
 legend('show');
 hold off;
figure;
hold on;
plot(nlist,u0f,'-o','DisplayName','forward');
plot(nlist,u0c,'-s','DisplayName','central');
xlabel('n');
ylabel('u(0)');
title('Numerical u(0) vs n');
legend('show');
grid on;
hold off;