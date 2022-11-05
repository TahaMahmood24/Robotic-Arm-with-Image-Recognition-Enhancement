a = arduino('COM1', 'UNO');

disp('clockwise')
writeDigitalPin(a, 'D4', 0);
writeDigitalPin(a, 'D5', 1);

for i = 1:200
tic
writeDigitalPin(a, 'D3', 1);
writeDigitalPin(a, 'D3', 0);
toc
end
disp('anti-clockwise')
writeDigitalPin(a, 'D4', 0);
writeDigitalPin(a, 'D5', 1);

for i = 1:200
writeDigitalPin(a, 'D7', 1);
%pause(0.001);
writeDigitalPin(a, 'D7', 0);
%pause(0.001);
end

clear a
%clc