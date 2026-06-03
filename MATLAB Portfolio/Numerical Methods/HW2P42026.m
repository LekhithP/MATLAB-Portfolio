x=linspace(1-1e-5,1+1e-5,2000);
f1=(x-1).^3;
f2=x.^3-3*x.^2+3*x-1;
f3=((x-3).*x+3).*x-1;
plot(x,f1,x,f2,x,f3);
legend('Factored','Expanded','Horner');
xlabel('x');
ylabel('f(x)');