x0 = 0.5*ones(41,1);
R = [2.4 2.7 3.0];
nr = 3;
x = [];
for i = 1:nr
    a=fsolve (@(x)q2dist_ssgrp11(x,R (i)),x0) ;
    x = [x, a] ;
end
n=1:41;
figure(2);
plot (n,x, '-*')
title ('alpha = 2.5');
xlabel ('number of stages');
ylabel ('light composition');
legend('R=2.4','R=2.7','R=3')