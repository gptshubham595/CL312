

global y

for i=1:11
    y=0.1*(i-1);
    ye(i)=0.1*(i-1);
    xe(i)=fzero('q1equilibgrp11',0.5);
end

xd=0.9;
xb=0.1;
zf=0.5;
R=1.5;
q=0.8;

yi=(zf+xd*q/R)/(1+q/R);
xi=(-(q-1)*(1-R/(R+1))*xd-zf)/((q-1)*R/(R+1)-q);

figure(1);
hold on;

plot(xe,ye,'r');
set(line([0  1],[0  1]),'Color',[0 1 0]);
set(line([xd xi],[xd yi]),'Color',[1 0 1]);
set(line([zf xi],[zf yi]),'Color',[1 0 1]);
set(line([xb xi],[xb yi]),'Color',[1 0 1]);

% Rectifying section

i=1;
xp(1)=xd;
yp(1)=xd;
y=xd;
while (xp(i)>xi)
    xp(i+1)=fzero('q1equilibgrp11',0.5);
    yp(i+1)=R/(R+1)*xp(i+1)+xd/(R+1);
    y=yp(i+1);
    set(line([xp(i) xp(i+1)],[yp(i) yp(i)]),'Color',[0 0 1]);
    if (xp(i+1)>xi) 
        set(line([xp(i+1) xp(i+1)],[yp(i) yp(i+1)]),'Color',[0 0 1]);
    end
        i=i+1;
end    
feedn = i-1;
% Stripping section

SS=(yi-xb)/(xi-xb);
yp(i)=SS*(xp(i)-xb)+xb;
y=yp(i);
set(line([xp(i) xp(i)],[yp(i-1) yp(i)]),'Color',[0 0 1]);

while (xp(i)>xb)
    xp(i+1)=fzero('q1equilibgrp11',0.5);
    yp(i+1)=SS*(xp(i+1)-xb)+xb;
    y=yp(i+1);
    set(line([xp(i) xp(i+1)],[yp(i) yp(i)]),'Color',[0 0 1]);
    if (xp(i+1)>xb) 
        set(line([xp(i+1) xp(i+1)],[yp(i) yp(i+1)]),'Color',[0 0 1]);
    end
    i=i+1;
end
totaln = i-1;
hold off;
