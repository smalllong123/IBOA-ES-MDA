function [R] = cov_column(A,B)
%COV_COLUMN 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n1]=size(A);
[m,n2]=size(B);
for i=1:n1
    for j=1:n2
        R(i,j)=1/(m-1)*sum((A(:,i)-mean(A(:,i))).*(B(:,j)-mean(B(:,j))));
    end
end
end

