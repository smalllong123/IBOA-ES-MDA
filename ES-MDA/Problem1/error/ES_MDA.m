InputSettings
x_ensembles=[];
for i = 1 : N_iter
    x_ensembles = [x_ensembles;x_ensemble];
    y_ensemble = predictor(x_ensemble,dmodel);
    y_ensemble = exp(y_ensemble);
    Dsv = cov_column(x_ensemble,y_ensemble);                    
    Dvv = cov_column(y_ensemble,y_ensemble);                           
    Gt = Dsv/(Dvv+alpha(i)*Rt);
    mu = zeros(1,N_obs);
    R = chol(Rt);
    z = repmat( mu, N_ensemble, 1) + randn( N_ensemble, N_obs) * R;
    x_ensemble = x_ensemble + ( Gt * ( obs + sqrt ( alpha(i)) * z- y_ensemble )')';
    x_ensemble = bound(x_ensemble);
end
x_ensembles = [x_ensembles;x_ensemble];
x_estimate=mean(x_ensemble);
