%% Sample Code
% Shahrokh Shahi
% Imperial College London - 2016

%% Initilizing
clc
clear all
format compact

%% Input Data File
load ('GraphData.mat');
figure(1);cla;
G_reg.plot;
title('New 4-regular graph')

%% Graph Matrices
adj    = full(G_reg.adjacency);
L      = full(laplacian(G_reg));
D      = diag(G_reg.degree);
L_norm = D^(-1/2)  *  L  *  D^(-1/2);

%% Graph Spectrum
[~,lm_adj] = eig(adj./4); %eigenvalues of the normalized adjacency matrix
eigvalues_of_the_normalized_adjacency_matrix = diag(lm_adj)

[~,lm_L] = eig(L);
eigvalues_of_the_Laplacian_matrix = diag(lm_L)

[~,lm_LN] = eig(L_norm);
eigvalues_of_the_Laplacian_matrix = diag(lm_LN)

%% END