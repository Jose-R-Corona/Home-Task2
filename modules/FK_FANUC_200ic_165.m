clear all
syms q1 q2 q3 q4 q5 q6 d1 d2 d3 d4 d5 d6 d7 real

T=T_z(d1)*R_z(q1)*T_z(d2)*T_x(d3)*R_y(q2)*T_x(d4)*R_y(q3)*T_z(d5)*T_x(d6)*R_x(q4)*R_y(q5)*R_z(q6)*T_x(d7);
T=simplify(T)