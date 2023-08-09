function [R] = cov_column(A,B)


[m,n1]=size(A);
[m,n2]=size(B);
for i=1:n1
    for j=1:n2
        R(i,j)=1/(m-1)*sum((A(:,i)-mean(A(:,i))).*(B(:,j)-mean(B(:,j))));
    end
end
end

