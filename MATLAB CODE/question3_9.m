v=[3.1,3.5,3.7, 3.8, 4, 4.2];
p=[0, 5, 10, 15, 20, 25];
plot(p,v);
range=1:6;
a=polyfit(p(range), v(range),1);
x=0:5:30;
y=polyval(a,x);
hold on
plot(x,y,'ro-','LineWidth', 0.5);
grid on
plot(x,y,'ro-','LineWidth',0.5);
xlabel('Pressure (kPa)');
ylabel('Voltage (V)');
title('Question 3.9');
plot(x,y,'ro-', 'LineWidth', 0.5);

