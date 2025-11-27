for i=1:1000
    v(i) = 2.5*sin(pi*i/100) + 2.5;
end
t=0.5: 0.5:500;
Matrix=[t,v];
file = fopen("pressureMeasurments.txt", "w");
formatSpec ='%f';
for j=1:1000
    fprintf(file, '%f %f\n', t(j),v(j));
end
fclose(file);
