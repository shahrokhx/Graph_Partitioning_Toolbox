i=[1 1 1 2 2 3 3 4 4 5 5 5  6  7 7  7  8  9  10 11];
j=[2 4 5 3 5 5 6 5 9 6 9 10 10 8 10 11 11 10 11 11];
k=ones(size(i));
k(end-1:end)=[0 0];
adj_sparse=sparse(i,j,k);
adj       =full(adj_sparse);
adj       = adj + adj';


G1=graph(adj);
figure(1);
G1.plot

%D = G1.degree;
%D = diag(   degree(GraphA)     );     % degree of Graphs
D = diag(G1.degree);

L = D - adj;   % Laplacian matrix (formal definition)           
L1=         laplacian (G1);   % Laplacian matrix (sparse view)
L2= full(   laplacian (G1) ); % Laplacian matrix 

[u,v] = eig(L)
lambda=diag(v);
spectralGap=lambda(2)