L = 90;
G = 30;
m = 3;
iter = 10000;
iter1 = 2000;
iter2 = 6000;
Nt = 5;
dt = 0.0001;
X = zeros(Nt, iter);
Y = zeros(Nt, iter);
time = zeros(iter,1);
Xf = 0, Y0 = 0.0101;
time(1) = 0;

for i = 1:iter1
 X(1,i) = 3.0124e-03;
 X(2,i) = 2.1976e-03;
 X(3,i) = 1.5050e-03;
 X(4,i) = 9.1750e-04;
 X(5,i) = 4.2023e-04;
 time(i+1)=time(i)+dt;
 for a = 1:Nt
    Y(a,i) = (2.53*X(a,i))/(1-(1.53*X(a,i)));
 end
end

for i = iter1:iter-1
 if(i < iter2)
    Y0 = 0.02/(1-0.02);
 else
    Y0 = 0.01/(1-0.01);
 end
 
 X(1,i+1) = X(1,i) + (dt/m)*((L*X(2,i))+(G*Y0)-(L*X(1,i))-(G*Y(1,i)));
 for j = 2:Nt-1
    X(j,i+1) = X(j,i) + (dt/m)*((L*X(j+1,i))+(G*Y(j-1,i))-(L*X(j,i))-(G*Y(j,i)));
 end
 
 X(5,i+1) = X(5,i) + (dt/m)*((L*Xf)+(G*Y(4,i))-(L*X(5,i))-(G*Y(5,i)));
 for k = 1:Nt
 Y(k,i+1) = (2.53*X(k,i+1))/(1-(1.53*X(k,i+1)));
 end
 time(i+1)=time(i)+dt;
end
for i = 1:Nt 
 fprintf(string(X(i,10000))) %{steady state value}
end
for i = 1:Nt
 fprintf(string(Y(i,10000))) %{steady state value}
end
figure(1)
plot(time,X)
xlabel('time');ylabel('X');
title('Time V/S X')
legend('1st Tray','2nd Tray','3rd Tray','4th Tray','5th Tray')
figure(2)
plot(time,Y)
title('Time V/S Y')
xlabel('time');ylabel('Y');
legend('1st Tray','2nd Tray','3rd Tray','4th Tray','5th Tray')