clc
clear all
format compact
%%
load ('TwoDisjointExpander8');

adj_append=adj;
adj_append(13,4)=1;
adj_append(4,13)=1;
adj_append(15,6)=1;
adj_append(6,15)=1;
adj_append(12,7)=1;
adj_append(7,12)=1;

G=graph(adj_append);
figure(4);cla;G.plot
%%
partition = SPGx1(adj_append)
G_sub=SubgraphX1(G,partition,'selfloop')
% G_sub=SubgraphX1(G,partition)