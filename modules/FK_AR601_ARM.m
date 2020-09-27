function A =FK_AR601_ARM(q1,q2,q3,q4,q5,d1,d2,d3,alpha1)

    A=R_y(q1)*T_y(d1)*R_z(alpha1)*R_x(q2)*R_z(q3)*T_z(-d2)*R_y(q4)*T_x(d3)*R_x(q5);
    A=simplify(A);

end