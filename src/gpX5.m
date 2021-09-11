% Create d-regular graphs and Expander graphs


%%
G1 = graph(createRandRegGraph(8,4));
G2 = graph(createRandRegGraph(8,4));

figure(1);cla;G1.plot
figure(2);cla;G2.plot
adj1=full(G1.adjacency);
adj2=full(G2.adjacency);

adj=[adj1,zeros(8);zeros(8),adj2];
GG=graph(adj);


figure(3);cla;GG.plot
%% you can load from here
save ('TwoDisjointExpander8','G1','G2','GG','adj1','adj2','adj')

adj_append=adj;
adj_append(13,4)=1;
adj_append(4,13)=1;
adj_append(15,6)=1;
adj_append(6,15)=1;
adj_append(12,7)=1;
adj_append(7,12)=1;

G=graph(adj_append);
figure(4);cla;G.plot

