pkg load queueing
pkg load statistics

clear all;
close all;
clc;

%B
lambda=5;
m=5.01:0.01:10;
for i=1:columns(m)
  [A(i),B(i),C(i),D(i)]=qsmm1(lambda, m(i));
endfor 

figure(1);%utilisation
plot(m,A,"linewidth",2);
title("Utilszation");

figure(2); %server response time
plot(m,B,"linewidth",2);
title("Server Response Time");
axis([5.01 10 0 15]);

figure(3); %average requests number
plot(m,C,"linewidth",2);
title("Average number of requests");
axis([5.01 10 0 80]);

figure(4); %throughput
plot(m,D,"linewidth",2);
title("Throughput");

