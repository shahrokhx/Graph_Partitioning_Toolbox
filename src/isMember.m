function [is,index]=isMember(vector,member)
    is=0;
    index=0;
    for i = 1:length(vector)
        if vector(i)==member
            is=1;
            index=i;
        end
    end
end