serial_Port=serial('COM3', 'BaudRate', 9600, 'Terminator','CR/LF');
fopen(serial_Port);
v=zeros(1,3001);
t=0:0.2:600;
fst=fscanf(s, '%s');
sec=fscanf(s, '%s');
while strcmp(fst,sec)
    fprintf(s,'%s','S');
    pause(0.2);
    sec=fscanf(s,'%s');
end
figure('Name', 'Real time depth data');
file=fopen('resultats.txt','w');
formatSpec='%f';
for i=1:3001
    value=((((((fscanf(s,'%f')*5)/1023)/163.46)/0.0002)-100)/10);
    v(1,i)=value;
    fprintf(file,'%f',v(1,i));
    pause(0.2);
end
plot(t,v);
xlabel('Time [s]');
ylabel('Depth [m]');
fclose(serial_Port);
