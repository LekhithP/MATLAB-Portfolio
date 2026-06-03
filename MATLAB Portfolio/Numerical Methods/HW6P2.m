months=1:12;
t=months'/12;
y=[6.224 6.665 6.241 5.302 5.073 5.127 4.994 5.012 5.108 5.377 5.510 6.372]';
x=[ones(12,1) cos(2*pi*t) sin(2*pi*t) cos(4*pi*t)];
c=(x'*x)\(x'*y);
fprintf('c=[%.6g %.6g %.6g %.6g]\n',c);
tvec=linspace(min(t),max(t),200)';
ypred=[ones(size(tvec)) cos(2*pi*tvec) sin(2*pi*tvec) cos(4*pi*tvec)]*c;
figure;
plot(t,y);
hold on
plot(tvec,ypred)
xlabel('t(years)');
ylabel('oil use(10^6 bbl/day)');
title('Periodic fit');
legend('data','fit')