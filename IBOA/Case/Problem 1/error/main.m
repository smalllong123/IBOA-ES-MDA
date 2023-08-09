

clear all 
clc
tic
warning off all
load boundary.mat
load case1_error0.05.mat


par.dim = 9;% dimensions of unknown parameters
par.N_butterfly = 100;% Number of search agents
par.Max_iteration = 2000;% Maximum number of iterations
% SearchAgents_no=100; 
% Max_iteration=3000; 
par.p_max=0.8;                       % probabibility switch
par.p_min=0.3;
par.power_exponent=0.1;%a
par.sensory_modality=0.01;%c
ParRange.lob =  lob;
ParRange.upb =  upb;
obs=y1;
ModelName='forwardmodel';

[Best_score,Best_pos,cg_curve,cg_curve_mean,cg_curve_point]=IBOA(par,ParRange,ModelName,obs);


time=toc;

