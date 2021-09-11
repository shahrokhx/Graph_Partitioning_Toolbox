%% To check whether a graph is positive-semidefinite
%  Shahrohk Shahi

%%
function state=isPositiveSemidefinite(A)
    [~,v] = eig ((A+A')/2);
    state = sum(diag(v)>0)==length(A);
end