pkg load statistics
clc;
clear all;
close all;

%Á
k = 0:0.0001:8;
lambda = [1./2,1,3];
colors = "rbg";
for i=1:columns(lambda)
  exponPdf(i,:) = exppdf(k,lambda(i));
endfor
figure(1);
hold on;
for i=1:columns(lambda)
  plot(k,exponPdf(i,:),colors(i), "linewidth",2.5);
endfor
hold off;

title("Probability Mass Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("lambda=1/2","lambda=1","lambda=3");

%Â
for i=1:columns(lambda)
  exponCdf(i,:) = expcdf(k,lambda(i));
endfor

figure(2);
hold on;
for i=1:columns(lambda)
  plot(k,exponCdf(i,:), colors(i),"linewidth",2.5);
endfor
hold off;

title("Cumulative Distribution Function of Exponential processes");
xlabel("k values");
ylabel("CDF");
legend("lambda=1/2","lambda=1","lambda=3");

%C
exponc = expcdf(k, 2.5); %CDF gia 1/lambda=2.5
P_3000 = 1 - exponc(3000);
display("P[X > 3000] =");
display(P_3000);
P_2000 = 1 - exponc(2000);
P_5000 = 1 - exponc(5000);
P_5000_2000 = P_5000./P_2000;
display("P[X > 5000 | X > 2000] =");
display(P_5000_2000);
