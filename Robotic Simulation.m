mdl_puma560;
p560.plot(qr);
t = [0:.01:0.1]';
% a = arduino('COM4','Uno','Libraries','RotaryEncoder')
% channelA = 'D2';
% channelB = 'D3';
% encoder1 = rotaryEncoder(a,channelA,channelB);
% resetCount(encoder1);
qf1 = qr(1);
qf2 = qr(2);
qf3 = qr(3);
while(1)
    qi1 = qf1;
    qi2 = qf2;
    qi3 = qf3;
%     qf1 = readCount(encoder1)*360/2000;
%     disp(qf1);
%     qf2 = readCount(encoder1)*360/2000;
%     disp(qf2);
%     qf3 = readCount(encoder1)*360/2000;
%     disp(qf3);
    qf1 = input('Angle 1: ');
    qf2 = input('Angle 2: ');
    qf3 = input('Angle 3: ');
    qf = [qf1 qf2 qf3 0 0 0]
    qi = [qi1 qi2 qi3 0 0 0]
    qtj = jtraj(qi, qf, t);
    p560.plot(qtj);
    pause(0.1);
end
