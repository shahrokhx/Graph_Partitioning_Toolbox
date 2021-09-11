%% Random Graph Generator (General Case - Simple Version II) 
%  Shahrokh Shahi 
%  Individual Project: Algorithms for Graph Partitioning
%  Imperial College London - August 2016
%
%
%  Random graph Generator based on n and maximum rdges model
function adj=rangGraphGenSimpleII(n,emax)
% input: n = number of nodes
%        p = probability of attachment
% output: adj = adjacency matrix of graph
%  
%% Procedure
%  initialize the adjacency matrix
adj=zeros(n); 
while numedges(adj) < emax
    i=randi(n); j=randi(n);
    if i==j || adj(i,j)>0; 
        continue; 
    end  
    adj(i,j)=adj(i,j)+1; 
    adj(j,i)=adj(i,j);
end
end
