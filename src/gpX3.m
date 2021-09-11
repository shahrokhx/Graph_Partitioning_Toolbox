
clc
clear all

%% Working with FB real data
load fbpagegraph.mat
adj=adjacency(G);

a_tmp      = triu(adj);
a_tmp_diag = diag(diag(adj));
adj        = a_tmp + a_tmp' - a_tmp_diag;


nnode = length(adj);
for i= 1:nnode
    if i>length(adj) break; end
    if sum(adj(:,i))==0
        adj(i,:)=[];
        adj(:,i)=[];
    end
end


nnode = length(adj);
for i= 1:nnode
    adj(i,i)=0;
end


G_normal   = graph(adj);



plot(G_normal)


