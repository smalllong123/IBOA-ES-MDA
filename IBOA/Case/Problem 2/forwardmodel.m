function y = forwardmodel(x)
load obs+model+true_value.mat
    y=predictor(x,dmodel)';
    y=exp(y);
end

