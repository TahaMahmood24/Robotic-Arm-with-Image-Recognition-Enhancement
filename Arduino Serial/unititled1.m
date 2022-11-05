%MATLAB Code for Serial Communication between Arduino and MATLAB

x=serial('COM4','BAUD', 9600);

fopen(x);
a = [1 1]
fprintf(x,a);  
