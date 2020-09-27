function J = sawyerJ(q)
    % El argumento q es el vector de configuraci?n, asuma que est? dado por
    % un vector columna q = [q1 q2 q3 q4 q5 q6 q7]'.
    
    n = 7; % Dimensi?n de la configuraci?n del manipulador sawyer
    delta = 0.00001;
    
    T = sawyerFK(q); 
    R = T(1:3, 1:3);
    
    % Inicializaci?n del jacobiano
    J = zeros(6, n);
    
    for j = 1:n
        e = zeros(n, 1);
        e(j) = delta;
        
        dKdqj = (sawyerFK(q+e) - T) / delta;
        dtdqj = dKdqj(1:3,end);
        dRdqj = dKdqj(1:3,1:3);
        S = dRdqj*R.';
        dthetadqj = vex(S);
        
        J(:, j) = [dtdqj; dthetadqj];
    end
end 