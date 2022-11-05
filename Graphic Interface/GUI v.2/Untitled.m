%T_initial = qz;
%T_final = tmove('z',0.15,T_initial);
%T_rotate =  T_final - T_initial;
T_rotate = [10, 21, 68, 0, 55, 57];
%fclose(instrfind);
s=serial('COM4','BAUDRATE',9600);    %to create the serial port in MATLAB
fopen(s);                            %open the serial port
fwrite(s,T_rotate);          % writes the binary data A to the device connected to the serial port object, s.
fclose(instrfind);