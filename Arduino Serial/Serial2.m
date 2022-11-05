fclose(instrfind);
clc
clear all
s=serial('COM4','BAUDRATE',9600);    %to create the serial port in MATLAB
fopen(s);                            %open the serial port
A=[101 70 69];
%fprintf(s,'%d',A(f)); % send answer variable content to arduino   % A is an 1x3 array of class 'double' containing 24 bytes (8 bytes per element)
fwrite(s,A);          % writes the binary data A to the device connected to the serial port object, s.
fclose(instrfind);