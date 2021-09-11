%% Generating a General Random Graph
%   Note: the distribution usage is from reference [91]

function adj = randGraphGen(n,p,emax,distribution)
%   n    = number of nodes
%   p    = probability of attachment
%   emax = maximum number of elements
%   dist = probability distribution

%% Procedure
%  initialize the adjacency matrix
adj=zeros(n); 
degree_sequence=1;  
switch distribution
    case 'uniform'
        while not(isgraphic(degree_sequence)) 
            degree_sequence = randi(n-1,1,n);
        end
    case 'normal'
        while not(isgraphic(degree_sequence))
            degree_sequence = ceil((n-1)/10*randn(1,n)+(n-1)/2);
        end
    case 'binomial'
        %p=0.5;  
        while not(isgraphic(degree_sequence)) 
            degree_sequence = ceil(binornd(n-1,p,1,n));
        end
    case 'exponential'
        while not(isgraphic(degree_sequence))
            degree_sequence = ceil(exprnd((n-1)/4,1,n));
        end
end
    % connect stubs at random
    elements=degree_sequence;
    accumulator = 0;
    counter=0;

    while sum(elements)>0   % while no more stubs are left to connect
      new_acc = sum(elements);
      if accumulator==new_acc
          counter = counter+1; 
      end
      if accumulator~=new_acc 
          counter=0; %reset
      end
      if counter>100
          elements = degree_sequence; 
          adj=zeros(length(degree_sequence)); 
          counter=0; 
      end
      accumulator = sum(elements);
      [~,seq1] = max(elements);

      index = find(elements>0);
      seq2 = index(randi(length(index)));

      if seq1==seq2 
          continue; 
      end

      if adj(seq1,seq2)>0
          continue;
      end
      
      adj(seq1,seq2)=1; 
      adj(seq2,seq1)=1;
      elements(seq1) = elements(seq1) - 1;
      elements(seq2) = elements(seq2) - 1;
    end %while
end %function