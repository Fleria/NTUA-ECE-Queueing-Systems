pkg load queueing
pkg load statistics
% system M/M/1/4
% when there are 3 clients in the system, the capability of the server doubles.

clc;
clear all;
close all;

lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

%(i) get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
display(transition_matrix);

% (ii)get the ergodic probabilities of the system
P = ctmc(transition_matrix);
display(P);
% plot the ergodic probabilities (bar for bar chart)
figure(1);
bar(states, P, "r", 0.5);

%(iii)average customers in the system
En=0;
for i=0:columns(states)-1
  En=En+i*P(i+1);
endfor
display(En);

%(iv)Pblocking
Pblocking=P(5);
display(Pblocking);

%(v)transient probability of state 0 until convergence to ergodic probability
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);
  Prob1(index) = P0(2);
  Prob2(index) = P0(3);
  Prob3(index) = P0(4);
  Prob4(index) = P0(5);
  if P0 - P < 0.01
    break;
  endif
endfor

T = 0 : 0.01 : T;
figure(2);
hold on;
title("�=5, �=10");
plot(T, Prob0, "r", "linewidth", 1.3);
plot(T, Prob1, "b", "linewidth", 1.3);
plot(T, Prob2, "g", "linewidth", 1.3);
plot(T, Prob3, "m", "linewidth", 1.3);
plot(T, Prob4, "k", "linewidth", 1.3);
legend("State 0","State 1","State 2","State 3","State 4");
hold off;