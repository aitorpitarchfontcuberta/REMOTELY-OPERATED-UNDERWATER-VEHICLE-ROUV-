delete(instrfind({'Port'},{'COM4'}));
s=serial('COM4','BaudRate',9600, 'Terminator','CR/LF');
fopen(s);
vec=zeros(1,100);
t=0:0.2:19.8;
first=fscanf(s,'%s');
second=fscanf(s,'%s');
while strcmp(first,second)
fprintf(s,'%s','S');
pause(0.1);
second= fscanf(s,'%s');
end
text=fopen('resultats.txt','w');
formatSpec= '%f';
for i=1:100
vec(i)=((fscanf(s,'%d')*3/212)-671*3/212);
vec(i)= vec(i) -vec(1);
if vec(i)<0
vec(i)=0;
end
fprintf(text,'%f %f\n', vec(i), i/5);
plot(t(1:i),vec(1:i));
xlabel('Time[s]');
ylabel('Depth[m]');
drawnow
pause(0.2);
end
fclose(text);
fclose(s);