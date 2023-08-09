function y = forwardmodel(x)
%FORWARDMODEL 此处显示有关此函数的摘要
%   此处显示详细说明
load obs_error0.05+model+true_value.mat
    y=predictor(x,dmodel)';
    y=exp(y);
end

