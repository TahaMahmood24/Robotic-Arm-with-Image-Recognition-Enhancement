function [] = motor_rotate(motor_number,final_position, initial_position)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if motor_number == 1
    a = arduino('COM4','Uno','Libraries','RotaryEncoder')
    channelA = 'D2';
    channelB = 'D3';
    encoder = rotaryEncoder(a,channelA,channelB);
    resetCount(encoder);
    if final_position > initial_position
    	writeDigitalPin(a, 'D6', 1);
    else
        writeDigitalPin(a, 'D6', 0);
    end
    degrees = 0
    while (degrees<(final_position-initial_position))
        count = readCount(encoder);
        %fprintf('Current knob position: %d\n',count);
        degrees = count*360/12000;
        disp(degrees);
        %fprintf('Current knob degrees: %d\n',degrees); pause(1);
        writeDigitalPin(a, 'D7', 1);
        %pause(0.001);
        writeDigitalPin(a, 'D7', 0);
        %pause(0.001);
    end
    clear a
end

if motor_number == 2
    a = arduino('COM4','Uno','Libraries','RotaryEncoder')
    channelA = 'D2';
    channelB = 'D3';
    encoder = rotaryEncoder(a,channelA,channelB);
    resetCount(encoder);
    if final_position > initial_position
    	writeDigitalPin(a, 'D6', 1);
    else
        writeDigitalPin(a, 'D6', 0);
    end
    degrees = 0
    while (degrees<(final_position-initial_position))
        %fprintf('Current knob position: %d\n',count);
        degrees = count*360/12000;
        disp(degrees);
        %fprintf('Current knob degrees: %d\n',degrees); pause(1);
        writeDigitalPin(a, 'D7', 1);
        %pause(0.001);
        writeDigitalPin(a, 'D7', 0);
        %pause(0.001);
    end
    clear a
end

if motor_number == 3
    a = arduino('COM4','Uno','Libraries','RotaryEncoder')
    channelA = 'D2';
    channelB = 'D3';
    encoder = rotaryEncoder(a,channelA,channelB);
    resetCount(encoder);
    if final_position > initial_position
    	writeDigitalPin(a, 'D6', 1);
    else
        writeDigitalPin(a, 'D6', 0);
    end
    degrees = 0
    while (degrees<(final_position-initial_position))
        count = readCount(encoder);
        %fprintf('Current knob position: %d\n',count);
        degrees = count*360/12000;
        disp(degrees);
        %fprintf('Current knob degrees: %d\n',degrees); pause(1);
        writeDigitalPin(a, 'D7', 1);
        %pause(0.001);
        writeDigitalPin(a, 'D7', 0);
        %pause(0.001);
    end
    clear a
end
end

