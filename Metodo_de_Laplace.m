%
%       SCRIPT PARA RESOLVER UNA EDO POR EL MÉTODO
%               DE LAPLACE
%
clear, clc
syms t s x X
% Resolver: 2 x'(t)+x(t)= sin(t) siendo x(0)=2 
edo='2*D(x)(t)=sin(t)-x(t)'; 
TLedo =laplace(edo,t,s);pretty(TLedo)
ect=subs(TLedo,{'laplace(x(t),t,s)','x(0)'},{X,2});pretty(ect)
X=solve(ect,X);pretty(X)
x=ilaplace(X,s,t);pretty(x)