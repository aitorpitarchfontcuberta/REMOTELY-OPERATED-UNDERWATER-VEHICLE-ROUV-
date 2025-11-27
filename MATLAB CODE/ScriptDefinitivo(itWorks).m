clear all;
delete(instrfind({'Port'},{'COM4'}));
s=serial('COM4', 'BaudRate',9600,'Terminator','CR/LF'); %Port initialization
fopen(s);
fid=fopen('resultats_Final.txt','w');
t=datetime('now'); pause(2);
i=0;
flushinput(s);

figure
h=animatedline;
ax= gca;

ax.YGrid = 'on';
ax.XGrid ="on";
ax.YLim = [0 4];
xlabel('TIME [s]');
ylabel('DEPTH [m]');
title('\bf{REAL TIME DEPTH}');

maxval=0;
minval=4;

variable=input('INGRESE EL VALOR DE LA VARIABLE: ', 's');

fwrite(s, variable);

factor = (((5/1023)/163.46)/2)*1000;    
if(variable=='S')
    startTime = datetime('now');
end
j=0;
while(variable=='S')
    
    lectura_bits=fscanf(s,'%c');
    if(j==0)
       first=str2double(lectura_bits)*factor-10;
    end
    bits=str2double(lectura_bits);
    depth=(bits)*factor-10;

    %SERVEIX PER VEURE QUIN VALOR ÉS EL MÀXIM I QUIN EL MÍNIM
    if(depth>maxval)
        maxval=depth;
    if(depth<minval)
        minval=depth;
    end
    end

    t=datetime('now') - startTime;
    datenum(t);
    depth;
    addpoints(h,datenum(t),depth);

    %Updated axes
    ax.XLim = datenum([t-seconds(10) t]); datetick('x','keeplimits');
    drawnow
    pause(0.02);
    i=i+1;
    j=j+1;
end
fprintf(fid,'\n MAXIMUM VALUE: %f m', maxval);
fprintf(fid, '\n MINIMUM VALUE: %f m', minval);
fprintf(s,'%s\n', 'e');
fclose(fid);

