function benchmark_vs_ode45(met1)
datos
[t,x1]=met1(f,intervalo,x0,N);
[~,x2]=ode45(f,intervalo(1):(intervalo(2)-intervalo(1))/N:intervalo(2),x0);
colx=size(x1,2);
for i=1:colx
    subplot(colx,1,i)
    plot(t,x1(:,i),'r')
    hold on 
    plot(t,x2(:,i),'b')
    s=sprintf('Coordenada %d de las soluciones',i);
    title(s)
end
x = (x1-x2);
errorm = max(max(abs(x)));
fprintf('El error cometido es de %d/n', errorm);
    pause(3)
    figure(2)
for i=1:colx
    subplot(colx,1,i)
    plot(t,x(:,i),'g')
    s=sprintf('Diferencia en la coordenada %d de las soluciones',i);
    title(s)
end
if colx>1
    pause(3)
    figure(3)
    if colx==2
        plot(x1(:,1),x1(:,2),'r')
        hold on
        plot(x2(:,1),x2(:,2),'b')
    else
        plot3(x1(:,1),x1(:,2),x1(:,3),'r')
        plot3(x2(:,1),x2(:,2),x2(:,3),'r')
    end
    title('Trayectoria de las soluciones')

end
