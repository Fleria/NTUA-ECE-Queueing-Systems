pkg load queueing

clear all;
close all;
clc;

a = 0.001:0.001:0.999;
lambda = 10000;
mu1 = 14650;
mu2 = 11720;
lambda1 = a.*lambda;
lambda2 = (1-a).*lambda;

[A1 B1 C1 D1 E1] = qsmm1(lambda1,mu1); %%apo ergastiriaki 2
[A2 B2 C2 D2 E2] = qsmm1(lambda2,mu2);

R = a.*B1 + (1-a).*B2;

plot(a,R);
[Emin, position] = min(R);
display("a for minimum waiting time = ");
display(position/1000);
display("Minimum waiting time = ");
display(Emin);
