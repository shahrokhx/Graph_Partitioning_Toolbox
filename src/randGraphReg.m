%% Generating a Random d-Regular Graph
%   Note: reference [1,50]
function adj = randGraphReg(n, d)
% input: n = number of nodes
%        d = degree of nodes
% output: adj = adjacency matrix of graph
%  

%% Initialize
maxit = 20; %maximum tries

if mod(n*d,2)==1   
    disp('err: n*d must be even!');
    adj=[];
    return;
end
degvec = repmat(1:n,1,d);

%the graphs adajency matrix
adj=sparse(n,n);
counter_overall=0; 
counter=1;

%% Procedure
while ~isempty(degvec) && counter < maxit
    counter_overall = counter_overall + 1;

    %choosing randomly
    index1 = ceil(rand*length(degvec));
    index2 = ceil(rand*length(degvec));
    v1 = degvec(index1);
    v2 = degvec(index2);

    %avoiding loops
    if (v1 == v2) || (adj(v1,v2) == 1)
        if (counter_overall == n*d) %reset the procedure           
            counter=counter+1;            
            counter_overall = 0; 
            degvec = repmat(1:n,1,d);
            adj = sparse(n,n);
        end
    else
        %update the adjacency matrix
        adj(v1, v2)=1;
        adj(v2, v1)=1;
        v = sort([index1,index2]);
        degvec = [degvec(1:v(1)-1), degvec(v(1)+1:v(2)-1), degvec(v(2)+1:end)];
    end
end
