s = serial('COM23', 'BaudRate', 9600);
fopen(s);

% Crea un archivo de texto para guardar los datos
fileID = fopen('datos_temperatura.txt', 'w');

% Crea una figura para la gráfica
figure;
hold on;

% Inicializa los datos de la gráfica
x = [];
y = [];

% Configura los ejes de la gráfica
xlabel('Tiempo (s)');
ylabel('Temperatura (°C)');
title('Datos de temperatura en tiempo real');

% Lee los datos del puerto serie y grafica los datos en tiempo real
while true
    % Lee los datos del puerto serie
    data = fscanf(s, '%d');
    
    % Convierte los datos leídos en grados Celsius
    temp = (data * 5 / 1024) * 100;
    
    % Guarda los datos en el archivo de texto
    fprintf(fileID, '%f\n', temp);
    
    % Agrega los datos a los vectores x e y
    x = [x, length(y) + 1];
    y = [y, temp];
    
    % Actualiza la gráfica
    plot(x, y);
    drawnow;
end

% Cierra la conexión con el puerto serie y el archivo de texto
fclose(s);
fclose(fileID);