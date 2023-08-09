load boundary.mat
load obs+model+true_value.mat
obs=y1;

N_ensemble = 500;
N_iter = 5;
alpha_geo = 3;
N_unknown = 9;

alpha_temp = ones(1,N_iter);
for i = 2:N_iter
    alpha_temp(i) = alpha_temp(i-1)/alpha_geo;
end
sum_alpha_temp = sum(1./alpha_temp);
alpha = alpha_temp*sum_alpha_temp;
sum_alpha = sum(1./alpha);
x_ensemble = prior(N_ensemble,N_unknown);
N_obs = size(obs,2);
y_pred=predictor(x_true,dmodel)';

Rt = 0.65^2*diag(ones(N_obs,1));             
  