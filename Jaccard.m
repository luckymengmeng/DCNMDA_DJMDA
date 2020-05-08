function [ B ] = Jaccard( A )
%calculate local similarity based on common neighbours for bipartite graphs
[m,n]=size(A);
cn=0;
total = [];
for i=1:m
    x=find(A(i,:));%find neighbours of node i
    for j=1:n   
        y=find(A(:,j));%find neighbours of node j
        total = [total,y'];%add neighbours of j to total neighbours
        for k=1:length(x)
            for l=1:length(y)
                if any(abs(find(A(:,x(k)))-y(l))<1e-10)==1
                    cn=cn+A(i,x(k))+A(y(l),j)+A(y(l),x(k));
                end
                total=[total,find(A(:,x(k)))'];%add neighbours of neighbours of x to total neighbours
            end
        end
        if cn~=0
            B(i,j)=cn/length(unique(total));%+(length(x)+length(y));%normalise CN with the total number of neighbours
        else
            B(i,j)=0;%+(length(x)+length(y));
        end
        cn=0;%reset counter
        total = [];
    end
    fprintf('Currently at %d\n', i);
end
end
