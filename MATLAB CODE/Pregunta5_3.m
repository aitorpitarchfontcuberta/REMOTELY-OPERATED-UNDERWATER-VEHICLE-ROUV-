clear all;
x=1:1000;
v=15*cos(4*pi*x)+115;
t=0.5:0.5:500;
M=[t',v'];
plot(M(:,1),M(:,2));
xlabel("Time[s]");
ylabel("Amplitude");
% 
% clear all;
% x=0:999;
% T=0.5;
% frequency=1/T;    %2 samples every each second
% t=0.5:0.5:500;  
% MaxPressure=130;    %Max Pressure
% MinPressure=100;    %Min Pressure
% offset=(MaxPressure+MinPressure)/2; %offset
% Amplitude=offset-MinPressure;
% Pressure=Amplitude*cos(2*pi*frequency*x)+offset;    %Pressure function
% 
% M=[t',Pressure'];
% 
% plot(M(:,1),M(:,2));  %plot from matrix
% grid on;
% title('1000 measured pressure points');
% xlabel('Time [s]');
% ylabel('Pressure p[kPa]');
% 
% 




