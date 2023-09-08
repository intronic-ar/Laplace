clear, clc
syms t s v V I
edo='(5000+9.9)*2200E-6*D(v)(t)+v(t)=4.9*(heaviside(t)-heaviside(t-60))';
TLedo=laplace(edo,t,s);
ect=subs(TLedo,{'laplace(v(t),t,s)','v(0)'},{V,0});
V=solve(ect,V);
v=ilaplace(simplify(V),s,t); disp('v(t)= '), pretty(v)
t = 0: 0.1: 120;
figure(3);
gra = ezplot(v, t);
set(gra,'color','blue','linewidth',2.5);
grid on;
xlabel('Tiempo [Seg]'),ylabel('Volts [V]');
axis ([0 120 0  6])
title('Carga y descarga de un capacitor');
figure(4)
I=simplify((2200E-6)*diff(v))
gra2=ezplot(I, t);
set(gra2,'color','red','linewidth',2.5);
axis ([0 120 -.003  .003]), grid on;
xlabel('Tiempo [Seg]'),ylabel('Corriente [A]');
title('Carga y descarga de un capacitor');
