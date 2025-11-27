data= load('pressureMeasurments.txt');
T=data(:,1);
T2=data(:,2);
plot(T,T2);
xlabel('Time [s]');
ylabel('Depth [m]');
title('Cos graph');


