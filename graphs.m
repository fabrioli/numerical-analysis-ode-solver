function [t,x]= mmilne4bdf5(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
[~,x] = mrk4(f,[t(1),t(5)],x0,4);
x = x';
for i = 1:3
    y(:,i) = f(t(i+1),x(:,i+1));  
end  
for i = 1:N-5
    x(:,i+5)=x(:,i+1)+ 4*h*(2*y(:,3)-y(:,2)+2*y(:,1))/3;
    x(:,i+5) = (300*x(:,i+4)-300*x(:,i+3)+200*x(:,i+2)-75*x(:,i+1)+12*x(:,i)+ 60*h*f(t(i+5),x(:,i+5)))/137;
    for j = 1:3
    y(:,j) = y(:,j+1);
    end
    y(:,4) = f(t(i+5),x(:,i+5));
end
i = N-4;
x(:,i+5)=x(:,i+1)+ 4*h*(2*y(:,3)-y(:,2)+2*y(:,1))/3;
x(:,i+5) = (300*x(:,i+4)-300*x(:,i+3)+200*x(:,i+2)-75*x(:,i+1)+12*x(:,i)+ 60*h*f(t(i+5),x(:,i+5)))/137;
t=t(:);  
x=x.';