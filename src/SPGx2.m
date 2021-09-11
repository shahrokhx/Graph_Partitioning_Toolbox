%% A function for spectral graph partitioning
%  Shahrokh Shahi 
%  Individual Project: Algorithms for Graph Partitioning
%  Imperial College London - August 2016

function partition = SPGx2(G,numc)
% input G a Matlab graph object
% output partition a vector including the number of vertices
%        numc = number of clusters (communities)
%        nargin<2 means numc =2 (bipartitioning)

%% Procedure
[v2,~]=fiedlervec(G);
[~,index] = sort(v2);

if nargin < 2 %bipartitioning 
    partition{1}=[];
    partition{2}=[];    
    for i=1:G.numnodes
        if v2(i) <= 0
            partition{1} = [partition{1}, i];
        else
            partition{2} = [partition{2}, i];
        end
    end
    
else %multi-partitioning

  node_per_cluster = floor(G.numnodes/numc);
  cluster = [0 node_per_cluster*ones(1,numc-1) G.numnodes-node_per_cluster*(numc-1)];

  for i = 1:length(cluster)
      partition{i}=[];
      for j = 1:cluster(i)
          partition{i}=[partition{i}, index(j+cluster(i-1))];
      end
  end
  partition=partition(2:end);
  
end