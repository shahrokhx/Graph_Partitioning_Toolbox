%% Random Grapg Generator (General Case - Simple Version)
%  Shahrokh Shahi 
%  Individual Project: Algorithms for Graph Partitioning
%  Imperial College London - August 2016
%
%
%  Random graph Generator based on G(n,p) model
function adj=rangGraphGenSimple(n,p)
% input: n = number of nodes
%        p = probability of attachment
% output: adj = adjacency matrix of graph
%  
%% Procedure
%  initialize the adjacency matrix
adj=zeros(n); 
if nargin ==1
    p=0.5; %default value
end
for i=1:n
    for j=i+1:n
        if rand<=p
            adj(i,j)=1;
            adj(j,i)=1; 
        end
    end
end


end
