%% A function for creating subgraphs after partitioning
%  Shahrokh Shahi 
%  Individual Project: Algorithms for Graph Partitioning
%  Imperial College London - August 2016


function G_sub=SubgraphX1(G,partition,proc)
% input G a MATLAB graph object
%       partition a cell array including subsets' node numbers
%       proce = eliminate / selfloop (create self loop after cutting edges)
% output a cell array of subgraph, the elements of array are graph objects

%% Procedure

if nargin<3; proc='eliminate';end
edges=G.Edges.EndNodes;
npartition = length(partition);

% creating the adgacency matrices of subgraphs
for i = 1:npartition
    adj_sub{i}=zeros(length(partition{1}));
end

for i = 1:G.numedges
    edge = edges(i,:);
    for j = 1:npartition
        Gj = partition{j};
        [ismem1,index1]=isMember(Gj,edge(1));
        [ismem2,index2]=isMember(Gj,edge(2));
        if (ismem1) && (ismem2) %internal edge (not cut)
            %disp(edge)
            adj_sub{j}(index1,index2)=1;
            adj_sub{j}(index2,index1)=1;
        end
        if strcmp(proc,'selfloop') %to create self loop
            if (ismem1) && (~ismem2)
                adj_sub{j}(index1,index1)=1;
            end
            if (~ismem1) && (ismem2)
                adj_sub{j}(index2,index2)=1;
            end
        end %-------
    end
    
end

%creating graph objects for output
for i = 1:npartition
    G_sub{i} = graph(adj_sub{i});
end

end