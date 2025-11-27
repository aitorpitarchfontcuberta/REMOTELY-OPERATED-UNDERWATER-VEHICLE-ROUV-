% Configuración del puerto serie (ajusta según tu configuración)
puerto_serie = serial('COM23'); % Cambia el puerto según tu configuración
set(puerto_serie, 'BaudRate', 9600); % Ajusta la velocidad de transmisión según tu configuración
set(puerto_serie, 'Terminator', 'LF'); % Ajusta el terminador según tu configuración

% Abre el puerto serie
fopen(puerto_serie);

% Configuración del gráfico
figure;
hPlot = plot(NaN, NaN);
title('Turbidez del agua en tiempo real');
xlabel('Tiempo (segundos)');
ylabel('Turbidez');
ylim([0 100]); % Ajusta según tus necesidades

% Inicialización de datos
tiempo_total = 60; % Duración total de la simulación en segundos
intervalo_tiempo = 1; % Intervalo de tiempo entre actualizaciones en segundos
tiempo = 0:intervalo_tiempo:tiempo_total;
turbidez = NaN(1, numel(tiempo));

% Bucle de simulación (lectura de datos en tiempo real)
for i = 1:numel(tiempo)
    % Leer datos desde el puerto serie
    datos_leidos = fscanf(puerto_serie, '%f'); % Ajusta el formato según tu configuración
    
    % Almacenar datos de turbidez (suponiendo que el dato leído es la turbidez)
    turbidez(i) = datos_leidos;
    
    % Actualizar el gráfico en tiempo real
    set(hPlot, 'XData', tiempo(1:i), 'YData', turbidez(1:i));
    drawnow;
    
    % Pausa para simular el intervalo de tiempo
    pause(intervalo_tiempo);
end

% Cierra el puerto serie
fclose(puerto_serie);
delete(puerto_serie);

% Limpia la figura
close(gcf);
