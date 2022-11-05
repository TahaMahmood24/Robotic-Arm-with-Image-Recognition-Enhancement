function [] = motor_move(T2,T1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if T2(1)~= T1(1)
    motor_rotate(1, T2(1), T1(1))
end
if T2(2)~=T1(2)
    motor_rotate(2, T2(2), T1(2))
end
if T2(3)~=T1(3)
    motor_rotate(3, T2(3), T1(3))
end
    
end

