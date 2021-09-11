%% A key function to calculate Fiedler Vector
%  Shahrokh Shahi 
%  Individual Project: Algorithms for Graph Partitioning
%  Imperial College London - August 2016

function [v2,spectrum]=fiedlervec(G)
% input: G Matlab graph object
% output: v2 = fiedler vector, the vector associated to the 2nd smallest
%              eigenvalue
%         spectrum = the graph spectrum

%% Procedure
L = lapmat(G);
[v,spectrum]=eig(L);
spectrum=diag(spectrum);
v2=v(:,2);
