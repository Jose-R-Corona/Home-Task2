function T = R_xd(q)

Sq = sin(q);    Cq = cos(q);

T = [   0   0     0     0; ...
        0  -Sq   -Cq    0; ...
        0   Cq   -Sq    0; ...
        0   0     0     0];