% H(s)=1/s+1
h = tf([1],[1 1]);
rlocus(h)
pause;
g = tf([1],[1 -1]);
rlocus(g) 