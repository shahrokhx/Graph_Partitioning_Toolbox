i=[1 2 2 2 3 4 5 6 7 8];
j=[2 3 4 8 7 6 8 7 8 8];
k=ones(size(i));
k(end)=0;
adj=sparse (i,j,k);
adj=full(adj);
adj=adj+adj';
GH=graph(adj);

edges=GH.Edges.EndNodes;

G1=[1 2 3 8];
G2=[4 5 6 7];

partition{1}=G1;
partition{2}=G2;
npartition = length(partition);

for i = 1:npartition
    adj_sub{i}=zeros(length(partition{1}));
end
for i = 1:GH.numedges
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
        %to create self loop
        if (ismem1) && (~ismem2)
            adj_sub{j}(index1,index1)=1;
        end
        if (~ismem1) && (ismem2)
            adj_sub{j}(index2,index2)=1;
        end
        %-------
    end
    
end

for i = 1:npartition
    G_sub{i} = graph(adj_sub{i});
end






