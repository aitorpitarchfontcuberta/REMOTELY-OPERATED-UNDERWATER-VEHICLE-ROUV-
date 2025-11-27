clear all;
i=1:1000;
sinusoidal=2.5*sin(pi*i/100)+2.5;
t=0.5:0.5:500;
%Matrix=[t,v];
file1=fopen("pressureMeasurmentsSinusoidal.txt", "w");
formatSpec='%f';
for j=1:1000
    fprintf(file1, '%f %f\n', t(j), sinusoidal(j));
end
fclose(file1);
%%
i=1:1000;
triangularWave=sawtooth(pi*i/100);
t=0.5:0.5:500;
file2=fopen("pressureMeasurmentsTriangularWave.txt","w");
formatSpec='%f';
for j=1:1000
    fprintf(file2, '%f %f\n', t(j),triangularWave(j));
end
fclose(file2);

%%
i=1:1000;
x=square(i);
t=0.5:0.5:500;
file3=fopen("pressureMeasurmentsSquareWave.txt","w");
formatSpec='%f';
for j=1:1000
    fprintf(file3, '%f %f\n', t(j),x(j));
end
fclose(file2);
%%











% clear all;
% i=0:1:999;
% freq=5/1000;
% dlmwrite('SimP.txt', i);
% MaxPressure=130;
% MinPressure=100;
% d=(MaxPressure-MinPressure)/2;
% A=d-MinPressure;
% x=A*cos(2*pi*freq*i)+d;
% plot(i,x);
% grid on;
% title('Pressure measurements');
% xlabel('Measure points [i]');
% ylabel('Pressure p[kPa]');
% %
% i=0:1:999;
% Tm=0.5;
% f=5/1000;
% fm=1/Tm;
% t=Tm*i;
% MaxPressure=130;
% MinPressure=100;
% d=(MaxPressure+MinPressure)/2;
% A=d-MinPressure;
% p1=A*sawtooth(2*pi*f*i)+d;
% p2=A*square(2*pi*f*i)+d;
% 
% M1=[t',p1'];
% M2=[t',p2'];
% dlmwrite('Matrix1.txt',M1);
% dlmwrite('Matrix2.txt',M2);
% 
% subplot(2,1,1);
% plot(M1(:,1),M1(:,2));
% title('Pressure measurements simulation');
% grid on;
% xlabel('Time [s]');
% ylabel('Pressure [kPa]');
% 
% subplot(2,1,2);
% plot(M2(:,1),M2(:,2));
% title('Pressure measurements simulation');
% grid on;
% xlabel('Time [s]');
% ylabel('Pressure [kPa]');
% %