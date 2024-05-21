%Block Diagram Algebra
% Clear
clear
clc
close all

%% Define G1,G2 and H
% Part of Janella Mae D. Andal 20-06308
G1_num = [1];
G2_den = [1 0 0];

G2_num = [1];
G2_den = [1 1];

G3_num = [1];
G3_den = [1 0];

G4_num = [1];
G4_den = [2 0];

H1_num = [1];
H2_den = [1 0];

H2_num = [1];
H2_den = [1 -1];

H3_num = [1];
H3_den = [1 -2];


%%Reduce Block Diagram
% Part of Camille B. Atienza 20-02029

G4H3_num = conv(G4_num,H3_num)
G4H3_den = conv(G4_den,H3_den)

GG3_num = conv(G3_den,G4H3_den)
GG3_den_sum = [2 -4 0 1 0]

GG2_num = conv(G2_num,GG3_num)
GG2_den = conv(G2_den,GG3_den_sum)

G2H2_num = conv(GG2_num,H2_den)
G2H2_den_sum = [2 -4 -2 7 -4 1 0]
