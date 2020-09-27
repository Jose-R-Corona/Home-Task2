clear all
syms q1 q2 q3 q4 d1 d2 d3 d4 d5 real
H = T_z(d1)*R_z(q1)*T_x(d2)*T_z(d3)*R_z(q2)*T_x(d4)*T_z(q3)*T_z(-d5)*R_z(q4);
H=simplify(H);
R = simplify(H(1:3,1:3));
J2p=T_z(d1)*R_z(q1)*T_x(d2)*T_z(d3)*R_zd(q2)*T_x(d4)*T_z(-q3)*T_z(-d5)*R_z(q4);
J2p=simplify(J2p)


J2r=T_z(d1)*R_z(q1)*T_x(d2)*T_z(d3)*R_zd(q2)*T_x(d4)*T_z(-q3)*T_z(-d5)*R_z(q4)*...
[R^-1 zeros(3,1);0 0 0 1];
J2r=simplify(J2r)

