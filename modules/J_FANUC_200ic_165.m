function J = J_FANUC_200ic_165(q,d1,d2,d3,d4,d5,d6,d7)
    % The argument q is the configuration vector, assume it is given by
    % a column vector q = [q1 q2 q3 q4 q5 q6]'.
    
    n = 6; % manipulator configuration dimension
    delta = 0.00001;
    
    T = FK_FANUC_200ic_165(q(1),q(2),q(3),q(4),q(5),q(6),d1,d2,d3,d4,d5,d6,d7); 
    R = T(1:3, 1:3);
    
    % Jacobian initialization
    J = zeros(6, n);
    
    for j = 1:n
        e = zeros(n, 1);
        e(j) = delta;
        qj=q+e;
        dKdqj = (FK_FANUC_200ic_165(qj(1),qj(2),qj(3),qj(4),qj(5),qj(6),d1,d2,d3,d4,d5,d6,d7) - T) / delta;
        dtdqj = dKdqj(1:3,end);
        dRdqj = dKdqj(1:3,1:3);
        S = dRdqj*R.';
        dthetadqj = [S(3,2),S(1,3),S(2,1)]'; %vex(S);  %is the vector (3x1) which has the skew-symmetric matrix s (3x3) 
        
        J(:, j) = [dtdqj; dthetadqj];
    end
end 