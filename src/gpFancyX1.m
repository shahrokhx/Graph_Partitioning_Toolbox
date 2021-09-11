%% ready for output
clc
clear all
format short g;

%% Generating graphs
% general random graph

% n=50;
% p=0.5;
% E=100;
% distribution = 'uniform';
% 
% adj = random_graph(n,p,E,distribution);

% regular graph
% n=15;
% d=4;
% adj = createRandRegGraph(n, d);

%modular
n=80;
c=4;
p=.5;
r=.98;
[adj, modules] = random_modular_graph(n,c,p,r);

G = graph(adj);
figure(1);cla;
G.plot;
