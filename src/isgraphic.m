%% Check whether a sequence of number is graphical, i.e. a graph with this degree sequence exists
% INPUTs: a sequence (vector) of numbers
% OUTPUTs: boolean, true or false
% Source: Erdős, P. and Gallai, T. "Graphs with Prescribed Degrees of Vertices" [Hungarian]. Mat. Lapok. 11, 264-274, 1960.
% reference [91]

function B = isgraphic(seqvec)
% input: seqvec = a vector consisting of a sequence of numbers
% output: laplacian matrix L=D-A
%         normalized laplacian matrix =D^(-1/2)*L*D^(-1/2)


%% Procedure
if not(isempty(find(seqvec<=0))) || mod(sum(seqvec),2)==1
    B = false; return;
end

n=length(seqvec);
seqvec=-sort(-seqvec);  % sort in decreasing order

for k=1:n-1
    sum_dk = sum(seqvec(1:k));
    sum_dk1 = sum(min([k*ones(1,n-k);seqvec(k+1:n)]));
    if sum_dk > k*(k-1) + sum_dk1
        B = false; 
        return; 
    end
end
B = true;