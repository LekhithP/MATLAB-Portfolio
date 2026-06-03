x=linspace(1,2,11)';
y=1+x+x.^2+x.^3+x.^4;
A=zeros(11,5);
for i=1:11
    for j=1:5
        A(i,j)=x(i)^(j-1);
    end
end
anorm=(A'*A)\(A'*y);
[Q,R]=qr(A);
aqr=R\(Q'*y);
xplot=linspace(1,2,200)';
Aplot=zeros(200,5);
for i=1:200
    for j=1:5
        Aplot(i,j)=xplot(i)^(j-1);
    end
end
ynorm=Aplot*anorm;
yqr=Aplot*aqr;
figure;
plot(x,y,'go','MarkerSize',8,'DisplayName','Data points');
hold on;
plot(xplot,ynorm,'b-','DisplayName','Normal equations');
plot(xplot,yqr,'r--','DisplayName','QR factorization');
xlabel('x');
ylabel('y');
title('Polynomial Fitting:Degree 4');
legend('show');
grid on;
fprintf('Coefficients from normal equations:');
disp(anorm');
fprintf('Coefficients from QR factorization:');
disp(aqr')