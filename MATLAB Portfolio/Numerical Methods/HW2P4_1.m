clear;

f=@(x)x.^2-4*x+3; 
fderiv=@(x)2*x-4;
tol=10e-10; 
maxiterations=200;
x0=1.99; 
pastiterates=x0;
for k=1:maxiterations
    currentiterate=pastiterates(end); 
    newiterate=currentiterate-f(currentiterate)/fderiv(currentiterate); 
    pastiterates(end+1)=newiterate;
    if abs(newiterate-currentiterate)<tol,break; 
    end
end
fprintf('root ~ %.10g in %d iters\n',pastiterates(end),numel(pastiterates)-1);
for n=1:numel(pastiterates),fprintf('%d\t%.7f\n',n-1,pastiterates(n)); 
end

figure
errors=abs(pastiterates-pastiterates(end));
semilogy(0:numel(pastiterates)-1,max(errors, eps))
title('Problem 4—Newton,x_0=1.99')
subtitle('log 10(|x_n-x^*|) vs iteration')
xlabel('iteration'); 
ylabel('log 10(|x_n-x^*|)')
grid on