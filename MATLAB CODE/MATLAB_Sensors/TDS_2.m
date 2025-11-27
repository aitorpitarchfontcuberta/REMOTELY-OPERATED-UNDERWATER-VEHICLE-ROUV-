s = serial('COM6', 'BaudRate', 9600, 'Terminator', 'CR/LF'); % Inicializar puerto
fopen(s);
fprintf(s, 'T'); % Enviar comando para leer valores de TDS

figure;
h = animatedline;
ax = gca;
ax.YLim = [0 1000];
xlabel('Tiempo');
ylabel('TDS[ppm]');
title('TDS en tiempo real');

startTime = datetime('now');
fid = fopen('resultados.txt', 'w');
while true
    tds = fscanf(s, '%f');
    t = datetime('now') - startTime;
    addpoints(h, datenum(t), tds);
    ax.XLim = datenum([t-seconds(10) t]);
    datetick('x', 'keeplimits');
    drawnow;
    fprintf(fid, '%s %f\n', datestr(t), tds);
end

fclose(fid);
fclose(s);
