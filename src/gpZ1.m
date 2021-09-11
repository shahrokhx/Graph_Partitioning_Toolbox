%load 'Random2-reg20.mat';
[v,l]=eig(full(laplacian(GG)));
xx=v(:,2);yy=v(:,3);
figure(6);
clf;
subplot(1,2,1);
GG.plot
title('Sample Graph')
subplot(1,2,2);
plot(xx,yy,'*')
hold on
edges=GG.Edges.EndNodes

for i=1:length(edges)
    x=[xx(edges(i,1)),xx(edges(i,2))]
    y=[yy(edges(i,1)),yy(edges(i,2))]
    plot(x,y,'s-k')
end
title('Vertices Positioned by Eigenvectors v_2 and v_3')
xlabel('v_2')
ylabel('v_3')
hold off


