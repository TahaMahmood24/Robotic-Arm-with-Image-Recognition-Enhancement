function [T_1] = rmove(direction,increment,position_angles)
    %position_matrix = initial_matrix
    mdl_puma560
    a = p560.fkine(position_angles);
       if direction=='y'
            Tt = a.transl();
            Tr = a.R();
            Tr = Tr*roty(increment*180/pi);
            b = SE3(Tr,Tt)
            disp('yyyy')
       elseif direction=='z'
            Tt = a.transl();
            Tr = a.R();
            Tr = Tr*rotz(increment*180/pi);
            b = SE3(Tr,Tt) 
            disp('zzzzz')
       else
            disp('Wrong direction chosen')
       end
    T_1 = p560.ikine6s(b);
end