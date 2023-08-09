function x = bound(x)
load boundary.mat
flag=(x>lob).*(x<upb);
x_o=x.*flag;
flag=~((x>lob).*(x<upb));
x_r=unifrnd(lob,upb).*flag;
x=x_o+x_r;
end

