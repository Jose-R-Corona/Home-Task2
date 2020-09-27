% =========================================================================
function q = IK_FANUC_200ic_165(Td, q0, only_position,d1,d2,d3,d4,d5,d6,d7)
    
    eps_p = 1e-06; % error in position
    eps_o = 1e-05; % error in orientation
    % Max number of iteration  
    K = 40; 
    
    % initialization of the variables
    q = q0;
    %just to avoid errors
    if (norm(q0)==0)
        q = q0;
        q(1)=q(1)+0.01;
    end
    
    k = 0;
    
    pd = Td(1:3, 4);
    Rd = Td(1:3, 1:3);
    sd = rot2cuat(Rd); 
    
    
    T = FK_FANUC_200ic_165(q(1),q(2),q(3),q(4),q(5),q(6),d1,d2,d3,d4,d5,d6,d7);
    p = T(1:3, 4);
    R = T(1:3, 1:3);
    s = rot2cuat(R);
    
    e_p = pd - p;
    s_e = multcuat(sd, invcuat(s));
    e_o = s_e(2:end);
    e = 1;
    
    % Complete the initialization and cycle responsible for implementing the iterative method
    %while((norm(e) > eps) && (k < K))
    while((norm(e_p) > eps_p) || (norm(e_o) > eps_o) && (k < K))
        T = FK_FANUC_200ic_165(q(1),q(2),q(3),q(4),q(5),q(6),d1,d2,d3,d4,d5,d6,d7);
        J = J_FANUC_200ic_165(q,d1,d2,d3,d4,d5,d6,d7);
        
        p = T(1:3, 4);
        e_p = pd - p;
        
        if(only_position == 1)
%             e_o = zeros(3,1);
            J = J(1:3,:);
            Ji = J'/(J*J'+0.1*eye(3));
            e = e_p;
        else
            R = T(1:3, 1:3);
            s = rot2cuat(R);
            s_e = multcuat(sd, invcuat(s));
            e_o = s_e(2:end);
            Ji = J'/(J*J'+0.1*eye(6));
            e = [e_p; e_o];
        end
        
        q = q + Ji*e; % The solution is updated
        k = k + 1;
    end
    i=1;
    while (i<6)
        q(i)=wrapToPi(q(i));
        i=i+1;
    end
end