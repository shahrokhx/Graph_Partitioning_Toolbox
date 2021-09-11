function edges = getEdges(graph,type)

if strcmp(type,'adj')
    edges=adj2edgeL(graph);
    
elseif strcmp(type,'edgelist')
    edges=graph; % the graph structure is the edge list
    
elseif strcmp(type,'adjlist')
    edges=adjL2edgeL(graph);
    
elseif strcmp(type,'inc')
    edges=inc2edgeL(graph);
else
    fprintf('"type" input can only be "adj" (adjacency, nxn matrix), "edgelist" (mx3 matrix)\n, "adjlist" (neighbor list, nx1 cell) and "inc" incidence (nxm matrix)\n')
end