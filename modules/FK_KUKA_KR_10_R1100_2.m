function A =FK_KUKA_KR_10_R1100_2(q1,q2,q3,q4,q5,q6,d1,d2,d3,d4,d5,d6,d7,d8)

    A=T_z(d1)*R_z(q1)*T_z(d2)*T_x(d3)*R_y(q2)*T_x(d4)*R_y(q3)*T_z(d5)*T_x(d6)*R_x(q4)*T_x(d7)*R_y(q5)*T_x(d8)*R_x(q6);
    A=simplify(A);

end