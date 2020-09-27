function A =FK_AR601_LEG(q1,q2,q3,q4,q5,q6,d1,d2,d3,d4,d5,d6)

    A=T_y(-d1)*T_x(d2)*R_z(q1)*T_z(-d3)*R_y(q2)*R_x(q3)*T_z(-d4)*R_y(q4)*T_z(-d5)*R_y(q5)*R_x(q6)*T_z(-d6);
    A=simplify(A);

end