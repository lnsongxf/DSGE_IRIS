%% Create and Solve Model Object                                           
clear
close all
clc
irisrequired 20180131

%% Read Model File and Create Model Object                                 
m = model('NKINV_linear.model');
disp(m)

%% Calibrate Model Parameters                                              
%
m.sigma = 2;
m.phi = 1.5;
m.alpha = 0.35;
m.beta = 0.985;
m.delta = 0.025;
m.rhoa = 0.95;
m.psi = 8;
m.theta = 0.75;
m.Ea = 0.01;
m.thetaW = 0.75;
m.psiW = 21;
m.phic = 0.8;
m.omegaR = 0.5;
m.chi = 1;
m.Psi1 = (1/m.beta)-(1-m.delta);
m.Psi2 = 1;

disp('Parameter Databank from Model Object:');
get(m, 'Parameters')

%% Find Steady State 
m = sstate(m);
chksstate(m);
get(m,'sstateLevel') %?sstateLevel?
get(m,'sstateGrowth') %?sstateGrowth?

%% Calculate First-Order Solution Matrices                                 
m = solve(m);
disp(m)

%% Save Model Object                                                       
save mat/nkinv.mat m
