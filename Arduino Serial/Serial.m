doi = "45,45";
arduino=serial('COM4','BaudRate',9600);
fopen(arduino);
fprintf(arduino, '%s', doi);
fclose(arduino);