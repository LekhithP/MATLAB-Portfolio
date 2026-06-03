t=(1:10)';
y=[6.2 9.5 12.3 13.9 14.6 13.5 13.3 12.7 12.4 11.9]';
z=log(y./t);
d=[ones(size(t)) t];
ab=(d'*d)\(d'*z);
a=ab(1); 
b=ab(2);
c1=exp(a);
c2=b;
tvec=linspace(min(t),max(t),200)';
ypred=c1*tvec.*exp(c2*tvec);
fprintf('c1=%.6g,c2=%.6g\n',c1,c2);
figure;
subplot(1,2,1)
plot(t,y); 
hold on
plot(tvec,ypred);
xlabel('t(hours)'); 
ylabel('y(ng/ml)');
title('y vs t');
legend('data','fit')
subplot(1,2,2)
plot(t,log(y)); 
hold on
plot(tvec,log(c1*tvec.*exp(c2*tvec)));
xlabel('t');
ylabel('log(y)');
title('log(y) vs t');
legend('data','fit')