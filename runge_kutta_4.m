function [t,x] = runge_kutta_4(f, intervalo, x0, N)
h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1) : h :intervalo(2);
x(:,1)=x0(:);
for i = 1:N
    F1 = f(t(i),x(:,i));
    F2 = f(t(i)+h/2,x(:,i)+h*F1/2);
    F3 = f(t(i)+h/2,x(:,i)+F2*h/2);
    F4 = f(t(i)+h,x(:,i)+h*F3);
    x(:,i+1)=x(:,i)+h*(F1+2*F2+2*F3+F4)/6;
end
t=t(:);
x=x.';
