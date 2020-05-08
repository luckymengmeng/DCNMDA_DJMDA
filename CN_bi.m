function [ B ] = CN_bi(A)
%calculate local similarity based on common neighbours for bipartite graphs
[m,n]=size(A);
cn=0;
for i=1:m 
    for j=1:n
        x=find(A(i,:));%find neighbours of node i
        y=find(A(:,j));%find neighbours of node j
        for k=1:length(x)
            for l=1:length(y)
                if any(abs(find(A(:,x(k)))-y(l))<1e-10)==1%check for common neighbour
                    c=find(A(y(l),:));
                   % sum=sum+length(c);
                    cn=cn+1;
                end
            end
        end
        B(i,j)=cn;%+(length(x)+length(y));
        
        cn=0;%reset counter
    end
    %fprintf('Currently at %d\n', i);
end

end
