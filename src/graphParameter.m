%% A fanction to create graph parameters required in Spectral methods
%  Shahrokh Shahi 
%  Imperial College London 
%  2016

%% Input(s):
%  Graph Obj of an graph (undirected-unweighted)
%

%%
function gObj=graphParameter(G)
    gObj.order     = G.numnodes;
    gObj.size      = G.numedges;
    gObj.complete  = nchoosek(gObj.order,2);
    gObj.density   = gObj.size/gObj.complete;
    
    gObj.adj       = full(G.adjacency);
    







end