function [x] = prior(N,d)
load boundary.mat
x=unifrnd(ones(N,1)*lob,ones(N,1)*upb,N,d);
end

