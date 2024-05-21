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
