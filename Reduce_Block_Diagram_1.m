%Block Diagram Algebra
% Clear
clear
clc
close all

%% Define G1, G2 and H
% Part of Justine Joshua L. Mendoza 20-00845
G1_num = [1];
G1_den = [1 0 0];

G2_num = [1];
G2_den = [1 1];

G3_num = [1];
G3_den = [1 0];

H1_num = [1];
H1_den = [1 0];

H2_num = [1];
H2_den = [1 -1];

H3_num = [1];
H3_den = [1 -2];

G = tf(G1_num,G1_den)
G_2 = tf(G2_num,G2_den)
G_3 = tf(G3_num,G3_den)
H_1 = tf(H1_num,H1_den)
H_2 = tf(H2_num, H2_den)
H_3 = tf(H3_num, H3_den)

%%Reduce Block Diagram

G3H3_num = conv(G3_num,H3_num)
G3H3_den = conv(G3_den,H3_den)

G3H3_den_sum = [1 -2 1];

%First reduce (G3/(1+GH3)) check
TF3_num = conv(G3H3_num,G3H3_den)
TF3_den = conv(G3H3_den_sum, G3_den)

%Second reduce (1+G2/(G2)) check
GG2_num_sum = [1 2]

GG2_num = conv(GG2_num_sum,G2_den)
GG2_den = conv(G2_num,G2_den)

%Third reduce (G2/(1+G2H2)) check
G2H2_num = conv(G2_num,H2_num)
G2H2_den = conv(G2_den,H2_den)

G2H2_den_sum = [1 0 0];

TF2_num = conv(G2_num,G2H2_den)
TF2_den = conv(G2H2_den_sum, G2_den)

%Fourth reduce (G3(G2+1)/(G2(1+GH3)) check

G23_num = conv(GG2_num, TF3_num)
G23_den = conv(GG2_den, TF3_den)

%Fifth reduce (G1G2/(1+G2H2)) check
G21_num = conv(TF2_num,G1_num)
G21_den = conv(TF2_den,G1_den)

%Sixth reduce (G1G2/(1+G2H2)+(H1G1G2)) check
GH21_num = conv(G21_num, H1_num)
GH21_den = conv(G21_den, H1_den)

GH21_den_sum = [1 1 0 0 1 0 -1]

TF4_num = conv(GH21_den,G21_num)
TF4_den = conv(GH21_den_sum,G21_den)

%Final reduce (G1G3(G2+1))/(1+G3H3)(1+G2H2+H1G1G2))
TF_num = conv(TF4_num, G23_num)
TF_den = conv(TF4_den, G23_den)
