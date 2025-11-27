% x=1:1000;
% y=2.5*sin(pi*x/100) + 2.5;
% plot(x,y);
% grid on;
clear all;
x=0:1:999;
frequency=5/1000;   %1/200
MaxPressure=130;    %Max Pressure
MinPressure=100;    %Min Pressure
offset=(MaxPressure+MinPressure)/2;  %Offset
Amplitude=offset-MinPressure;
Pressure=Amplitude*cos(2*pi*frequency*x)+offset;   %Pressure function

%PRESSURE FUNCTION PLOT (5.2)
plot(x,Pressure);
grid on;
title('1000 measured pressure points');
xlabel('Measure points [x]');
ylabel('Pressure p[kPa]');