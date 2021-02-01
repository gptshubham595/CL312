function f = q2dist_ssgrp11(x,R)
global DIST_PAR ;
DIST_PAR = [2.5 41 21 1 0.5 1 R R+0.5];

% input
alpha =DIST_PAR(1) ; % relative volatility
ns = DIST_PAR(2) ; % total stages
nf = DIST_PAR(3); % feed stage
feed = DIST_PAR(4); % feed flow rate
zfeed = DIST_PAR(5); % feed composition
qf = DIST_PAR(6) ; % feed condition
reflux = DIST_PAR(7); % reflux rate
vapor = DIST_PAR(8);
% rectifying & stripping liquid flowrates
lr = reflux;
ls = reflux + feed*qf;
% rectifying & stripping vapor flowrates
vs = vapor;
vr = vs + feed*(1-qf);
% distilate and bottom rates
dist = vr - reflux;
lbot = ls - vs;
if dist < 0
disp('error in specifications, distilate flow <0')
return
end
if lbot < 0
disp('error in specifications, stripping section')
disp (' ')
disp('liquid flowrate is negative')
return
end
% zero function vector
f = zeros(ns, 1);
y = zeros(ns, 1);
% equilibrium vapor compositions
for i=1:ns
  y(i)=(alpha*x(i) )/(1-(1-alpha) *x(i));
end
% MATERIAL BALANCES
% overhead receiver
f(1)=(vr*y(2)-(dist+reflux)*x(1));
% rectifying (top) section
for i=2:nf-1
  f(i)=lr*x(i-1)+vr*y(i+1)-lr*x(i)-vr*y(i);
end
% feed stage
f(nf) = lr*x(nf-1)+vs*y(nf+1)-ls*x(nf) -vr*y(nf)+feed*zfeed;
% stripping (bottom) section
for i=nf+1:ns-1
  f(i)=ls*x(i-1)+vs*y(i+1)-ls*x(i) -vs*y(i);
end
% reboiler
f(ns)=(ls*x(ns-1)-lbot*x(ns)-vs*y (ns));
end