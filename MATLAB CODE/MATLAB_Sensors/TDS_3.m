% Configuración del puerto serie
port = 'COM23';  % Ajusta el puerto serie según tu configuración
baudrate = 9600;  % Ajusta la velocidad de baudios según tu configuración
ser = serial(port, 'BaudRate', baudrate);
fopen(ser);

% Configuración del archivo de texto
archivo = 'datos_tds.txt';
fid = fopen(archivo, 'w');
fprintf(fid, 'Tiempo(s)\tValor TDS\n');

% Configuración de la gráfica
figure;
hLine = plot(NaN, NaN);
xlabel('Tiempo (s)');
ylabel('Valor TDS');
title('Gráfica en tiempo real de datos TDS');
grid on;

% Configuración del tiempo y los datos
tiempo = 0;
datos_tds = [];

% Bucle principal
try
    while ishandle(hLine)
        % Leer datos desde el puerto serie
        datos_nuevos = fscanf(ser, '%f');
        
        % Actualizar tiempo y datos
        tiempo = [tiempo, tiempo(end) + 1];
        datos_tds = [datos_tds, datos_nuevos];
        
        % Escribir datos en el archivo de texto
        fprintf(fid, '%f\t%f\n', tiempo(end), datos_nuevos);
        
        % Actualizar la gráfica
        set(hLine, 'XData', tiempo, 'YData', datos_tds);
        drawnow;
    end
catch
    disp('Error en la lectura de datos. Cerrando...');
end

% Cierre del puerto serie y del archivo de texto
fclose(ser);
fclose(fid);
delete(ser);
disp('Programa finalizado.');

