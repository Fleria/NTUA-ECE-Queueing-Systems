pkg load statistics
clc;
clear all;
close all;
%A
randomevents = exprnd(0.2, 100);
for i = 2:100
  randomevents(i) = randomevents(i) .+ randomevents(i-1);
endfor
stairs(randomevents, 1:100);

%B
N = [200, 300, 500, 1000, 10000];
for k=1:columns(N)
  random_events=exprnd(1/5, N(k));
  for j = 2:N(k)
    random_events(j) = random_events(j) .+ random_events(j-1);
  endfor
  display("Random events:");
  display(N(k));
  display("Mean value of events per second:");
  display(N(k)./random_events(N(k)));
endfor

