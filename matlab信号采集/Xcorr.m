% x=[1,3,6,7,2,9,2,7,1,2]';
% y=[0,0,0,1,3,6,7,2,7,1]';
% [Y,X] = xcorr(y,x);
% plot(X,Y);
% m=max(Y);
% max_x=find(Y==m);
% 
% max_x_value=X(max_x);
% max_y_value=m;
% sprintf("x坐标:%d  y坐标:%d\n",max_x_value,max_y_value);

x1=music(10000:10448,:);
z=zeros(12,1);
tmp=x1(1:439,:);
x2=[z;tmp];

[Y,X] = xcorr(x2,x1);
plot(X,Y);
grid on;
m=max(Y);
max_x=find(Y==m);

max_x_value=X(max_x);
max_y_value=m;
sprintf("x坐标:%d  y坐标:%d\n",max_x_value,max_y_value);

