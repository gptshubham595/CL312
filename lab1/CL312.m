X(:,1)=[0.1,0.08,0.06,0.04,0.01];
m=3.0;
L=90.0;
G=30.0;
i=20000;
NT=5;
dt=0.0001;
T(1)=0;
for k=1:i
    XF(k)=0.0;
    Y0(k)=1/99;
    for n=1:NT
        Y(n,k)=(2.53*X(n,k))/(1-1.53*X(n,k));
    end

    for n=1:NT
        XM(n,k)=X(n,k)/(1+X(n,k));
        YM(n,k)=Y(n,k)/(1+Y(n,k));
    end

    X(1,k+1)=X(1,k)+ (dt/3)* (L*X(2,k)+G*Y0(k)-L*X(1,k)-G*Y(1,k));
    if(X(1,k+1)>1)
        X(1,k+1)=1;
    end
    if(X(1,k+1)<0)
        X(1,k+1)=0;
    end

    for n=2:4
        X(n,k+1)=X(n,k)+(dt/3)*(L*X(n+1,k)+G*Y(n-1,k)-L*X(n,k)-G*Y(n,k));
        if(X(n,k+1)>1)
            X(n,k+1)=1;
        end
        if(X(n,k+1)<0)
            X(n,k+1)=0;
        end
    end
    X(5,k+1)=X(5,k)+(dt/3)*(L*XF(k)+G*Y(4,k)-L*X(5,k)-G*Y(5,k));
    if(X(5,k+1)>1)
        X(5,k+1)=1;
    end
    if(X(5,k+1)<0)
        X(5,k+1)=0;
    end
    T(k+1)=T(k)+dt;
end
for i = 1:Nt
 fprintf(string(X(i,20000))) %{steady state value}
end
figure(3)
plot(T,X)
xlabel('time');ylabel('X');
title('Time V/S X')
legend('1st Tray','2nd Tray','3rd Tray','4th Tray','5th Tray')