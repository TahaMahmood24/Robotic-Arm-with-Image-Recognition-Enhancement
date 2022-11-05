function [T_1] = tmove(direction,increment,position_angles)
    %position_matrix = initial_matrix
    mdl_puma560
    a = p560.fkine(position_angles);
       if direction=='x'
            b = a.transl();
            d = b(1) + increment;
            if d > 0.7481 || d < -0.7481
                disp('The end-effector limit has exceeded')
                T_1 = p560.ikine6s(a, 'ru');
                return
            else
                b(1) = d
            end
            disp('x')
        elseif direction=='y'
            b = a.transl();
            d = b(2) + increment;
            if d > 0.6149 || d < -0.6149
                disp('The end-effector limit has exceeded')
                T_1 = p560.ikine6s(a, 'ru');
                return
            else
                b(2) = d
            end
        elseif direction=='z'
            b = a.transl();
            d = b(3) + increment;
            if d > 0.7318 || d < -0.7318
                disp('The end-effector limit has exceeded')
                T_1 = p560.ikine6s(a, 'ru');
                return
            else
                b(1) = d
            end
            
        else
            disp('Wrong direction chosen')
        end
    a = transl(b);
    T_1 = p560.ikine6s(a, 'ru');
end

