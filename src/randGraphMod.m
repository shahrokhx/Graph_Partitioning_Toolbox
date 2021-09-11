%% Generating a Random Modular Graph (Intended Clusters)

function [adj, cluster] = randGraphMod(n,c,p,r)
% input: n = number of nodes
%        p = probability of attachment
%        c = number of clusters
%        r = d_in/d_out
% output: adj = adjacency matrix of graph
%         mod = nodes within each cluster

%% Procedure
adj=zeros(n); 
pn=round(p*(n-1));

% numbering vertices and assigning to clusters
cluster=cell(c,1);
for i=1:length(cluster)
    index1=round((i-1)*n/c+1);
    index2=round(i*n/c);
    cluster{i}=index1:index2; 
end

for i=1:n
    for j=i+1:n
        ii=ceil(c*i/n);   
        jj=ceil(c*j/n); 
        
        if ii==jj % within a cluster (d_in++)      
            if rand<=r*pn/(n/c-1); 
                adj(i,j)=1; 
                adj(j,i)=1; 
            end
        else % between clusters (d_out++)
            if rand<=pn*(1-r)/(n-n/c); 
                adj(i,j)=1; 
                adj(j,i)=1; 
            end
        end
    end
end