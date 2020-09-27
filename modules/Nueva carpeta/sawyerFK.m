function T = sawyerFK(q)
    DH = [ q(1),      317,      81,       -pi/2; 
           q(2)+3*pi/2,   192.5,    0,        -pi/2; 
           q(3),      400,      0,        -pi/2; 
           -q(4)+pi,   168.5,    0,        -pi/2; 
           q(5),      400,      0,        -pi/2; 
           q(6)+pi,   136.3,    0,        -pi/2;
           q(7),      277.75,   0,        pi];
    %133.75 sin gripper
    T = getFK(DH); 
end
%posicion vertical
%q0=[3*pi()/4,pi(),0,pi(),0,pi(),0]