%% A function to calculate Laplacian Matrix and The Normalized Laplacian
%  Shahrokh Shahi 
%  Individual Project: Algorithms for Graph Partitioning
%  Imperial College London - August 2016

function [laplacian, normalized_laplacian] = lapmat(G)
% input: Matlab graph object
% output: laplacian matrix L=D-A
%         normalized laplacian matrix =D^(-1/2)*L*D^(-1/2)

%% Procedure

D = diag(G.degree);      % degree matrix
adj = full(G.adjacency); % the adjacency matrix

L = D - adj;   % Laplacian matrix (formal definition)           
L1= G.laplacian;   % Laplacian matrix (sparse view)
L2= full(   L1 ); % Laplacian matrix 
L_norm = D^(-1/2)  *  L  *  D^(-1/2);
laplacian = L;
normalized_laplacian = L_norm;
