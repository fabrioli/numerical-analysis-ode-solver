function [t,x] = mab4(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
[~,x] = mrk3(f,[t(1),t(4)],x0,3);
x = x';
for i = 1:4
    y(:,i) = f(t(i),x(:,i));  
end
for i = 1 : (N-3)
    x(:,i+4)=x(:,i+3)+ h*(55*y(:,4)-59*y(:,3)+37*y(:,2)-9*y(:,1))/24;
    for j = 1:3
    y(:,j) = y(:,j+1);  
    end
    y(:,4) = f(t(i+4), x(:,i+4));
end
t=t(:);  
x=x.';