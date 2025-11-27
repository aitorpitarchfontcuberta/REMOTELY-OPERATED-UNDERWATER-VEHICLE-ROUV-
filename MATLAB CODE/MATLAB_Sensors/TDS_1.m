%fclose(instrfind);
s=serial ('COM23', 'BaudRate', 9600, 'Terminator', 'CR/LF'); %inicializar port
fopen(s);
fid=fopen('resultats_final.txt','w');
t=datetime('now'); pause(2);
i=0;
flushinput(s);

figure
h = animatedline;
ax = gca; %current axes

%Modify axes
ax.YGrid = 'on';
ax.YLim = [0 1000];
xlabel ('Time');
ylabel ('TDS[ppm]');
title('REAL TIME TDS');

maxval=0.0;
minval=1000.0;

variable=input('Ingrese el valor de la variable: ','s');
fwrite(s,variable);
if(variable=='S')
startTime = datetime('now');
end
while(variable=='S')
	
	lectura_bits=fscanf(s, '%c')
	bits=lectura_bits;
	TDS=bits;

	if(TDS>maxval)
		maxval=TDS;
	if(TDS<minval)
		minval=TDS;
	end
	end

	t=datetime('now') - startTime;
	datenum(t);
	TDS;
	addpoints (h,datenum(t),TDS);

	% Update axes
	ax.XLim = datenum([t-seconds(10) t]); datetick('x','keeplimits')
	drawnow

	pause (0.02);
	% Check stop condition
	i=i+1;

end

fprintf(fid,'\nVALOR MAXIM: $f m', maxval);
fprintf(fid,'\nVALOR MINIM: $f m', minval);
fprintf(s,'%s\n','e');
fclose(fid);

