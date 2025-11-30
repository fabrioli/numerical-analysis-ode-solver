function [t,x] = meulermej(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
y(:,1) = f(t(1),x(:,1));
y(:,2) = f(t(2), x(:,1) + h*y(:,1));
for i=1:N-1
    x(:,i+1) = x(:,i)+h*0.5*(y(:,1)+y(:,2));
    y(:,1) = y(:,2);
    y(:,2) = f(t(i+1), x(:,i) +h*y(:,1));
end
i = N;
x(:,i+1)=x(:,i)+h*0.5*(y(:,1)+y(:,2));
t=t(:);  
x=x.'; 