a = arduino('COM4','Uno')
while 1
    value = readVoltage(a,'A0')
    disp(value);
end