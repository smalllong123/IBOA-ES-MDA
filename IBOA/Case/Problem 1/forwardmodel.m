function y = forwardmodel(x)

    load case1.mat
    y=predictor(x,dmodel)';
    y=exp(y);
end

