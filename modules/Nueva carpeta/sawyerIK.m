% =========================================================================

% =========================================================================
function q = sawyerIK(Td, q0, solop)
    
    eps_p = 1e-06; % Tolerancia del error de posici?n
    eps_o = 1e-05; % Tolerancia del error de orientaci?n
    % N?mero m?ximo de iteraciones (reducir en caso de mala performance 
    % durante la simulaci?n)
    K = 40; 
    
    % Inicializaci?n de variables
    q = q0;
    %solo para evitar errores
    if (norm(q0)==0)
        q = q0;
        q(1)=q(1)+0.01;
    end
    
    k = 0;
    
    pd = Td(1:3, 4);
    Rd = Td(1:3, 1:3);
    sd = rot2cuat(Rd);
    
    T = sawyerFK(q);
    p = T(1:3, 4);
    R = T(1:3, 1:3);
    s = rot2cuat(R);
    
    e_p = pd - p;
    s_e = multcuat(sd, invcuat(s));
    e_o = s_e(2:end);
    e = 1;
    
    % Complete la inicializaci?n y el ciclo responsable de implementar el
    % m?todo iterativo, seg?n el algoritmo descrito en la gu?a del
    % laboratorio 5 y sus notas de clase
    %while((norm(e) > eps) && (k < K))
    while((norm(e_p) > eps_p) || (norm(e_o) > eps_o) && (k < K))
        T = sawyerFK(q);
        J = sawyerJ(q);
        
        p = T(1:3, 4);
        e_p = pd - p;
        
        if(solop == 1)
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
        
        q = q + Ji*e; % Se actualiza la soluci?n
        k = k + 1;
    end
    i=1;
    while (i<8)
        q(i)=wrapToPi(q(i));
        i=i+1;
    end
end