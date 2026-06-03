%Problem 2B
A=[4 -1;-1 4];
b=[3;3];
D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);
omega=0.01:0.01:1.99;
rho=zeros(size(omega));
for i=1:length(omega)
    w=omega(i);
    M=(D+w*L)\((1-w)*D-w*U);
    rho(i)=max(abs(eig(M)));
end
figure,plot(omega,rho,'LineWidth',1.5),xlabel('\omega'),ylabel(['\rho(M_\' ...
    'omega)']),title('Problem 2B'),grid on
[minrho,idx]=min(rho);
omegaopt=omega(idx)