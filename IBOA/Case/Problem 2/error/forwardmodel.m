function y = forwardmodel(x)
%FORWARDMODEL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
load obs_error0.05+model+true_value.mat
    y=predictor(x,dmodel)';
    y=exp(y);
end

