
n_obs=size(y1,2);
a=0.05;
e=randn(1,n_obs);
y1=y1+a*e.*y1;
