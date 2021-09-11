function S=isregular(adj)

S=false;

degs=sum(adj>0); % remove weights and sum columns

if degs == degs(1)*ones(size(degs)); S = true; end