clear all
syms q1 q2 q3 q4 q5 q6 d1 d2 d3 d4 d5 d6 d7 d8 alpha1 real


%%
%FK for Fanuc 200ic 165

FK_Fanuc= FK_FANUC_200ic_165(q1,q2,q3,q4,q5,q6,d1,d2,d3,d4,d5,d6,d7);

d_1=0.346;
d_2=0.324;
d_3=0.312;
d_4=1.075;
d_5=0.225;
d_6=1.280;
d_7=0.215;

q0 = [0.2,0.2,0.2,0.2,0.2,0.2]'; %inicial position for the joints
J_Fanuc = J_FANUC_200ic_165(q0,d_1,d_2,d_3,d_4,d_5,d_6,d_7) %just a test for the jacobian with this initial position in the joints

only_position=1; %1=just position   0=match position and orientation

% Ik for Fanuc 200ic 165
td=[0.4,0.5,0.4]' %position we want to get coordinates
Td=[0,0,0,td(1);0,0,0,td(2);0,0,0,td(3);0,0,0,1]; %position we want to get coordinates
q = IK_FANUC_200ic_165(Td, q0, only_position,d_1,d_2,d_3,d_4,d_5,d_6,d_7); %vector of joinst position
T = FK_FANUC_200ic_165(q(1),q(2),q(3),q(4),q(5),q(6),d_1,d_2,d_3,d_4,d_5,d_6,d_7); %get the efector

%td and td_ik are the samme 
td_ik= [T(1,4),T(2,4),T(3,4)]'



%%
%FK for the KUKA_KR_10_R1100_2

FK_KUKA_KR= FK_KUKA_KR_10_R1100_2(q1,q2,q3,q4,q5,q6,d1,d2,d3,d4,d5,d6,d7,d8);


%%
%Fk for the KUKA_LBR_iiwa_14_R820

FK_KUKA_LBR = FK_KUKA_LBR_iiwa_14_R820(q1,q2,q3,q4,q5,q6,d1,d2,d3,d4,d5,d6);

%%
%FK for the AR601_ARM
FK_AR601_arm_right = FK_AR601_ARM(q1,q2,q3,q4,q5,d1,d2,d3,alpha1);

%%
%FK for the AR601_LEG
FK_AR601_leg_left = FK_AR601_LEG(q1,q2,q3,q4,q5,q6,d1,d2,d3,d4,d5,d6);

%%
%H = T_z(d1)*R_z(q1)*T_x(d2)*T_z(d3)*R_z(q2)*T_x(d4)*T_z(q3)*T_z(-d5)*R_z(q4);
%H=simplify(H);
%R = simplify(H(1:3,1:3));
%J2p=T_z(d1)*R_z(q1)*T_x(d2)*T_z(d3)*R_zd(q2)*T_x(d4)*T_z(-q3)*T_z(-d5)*R_z(q4);
%J2p=simplify(J2p);


%J2r=T_z(d1)*R_z(q1)*T_x(d2)*T_z(d3)*R_zd(q2)*T_x(d4)*T_z(-q3)*T_z(-d5)*R_z(q4)*...
%[R^-1 zeros(3,1);0 0 0 1];
%J2r=simplify(J2r);