clear all;
close all;
clc;

function [r,flag_ergodic] = intensities(lambda,mu)
  r(1)=lambda(1)/mu(1);
  r(2)=(lambda(2)+lambda(1)*2/7)/mu(2);
  r(3)=(4/7)*lambda(1)/mu(3);
  r(4)=(3/7)*lambda(1)/mu(4);
  r(5)=(lambda(2)+lambda(1)*4/7)/mu(5);
  flag_ergodic = 1;
  for i=1:5 
  display(i);
  display("and r(i) = ");
  display(r(i));
    if (r(i) >= 1)
      flag_ergodic=0;
    endif
  endfor
  disp(flag_ergodic);
endfunction


function [R] = mean_clients(lambda,mu)
  [r,flag_ergodic]=intensities(lambda, mu);
  R = r ./ (1-r);
endfunction  


lambda=[4,1];
mu=[6,5,8,7,6];

r = intensities(lambda,mu);
R = mean_clients(lambda,mu);
ET = sum(R)/sum(lambda);
display("Average delay time is ");
display(ET);


[bottleneck, maxposition] = max(R);
max_lambda = mu(maxposition);
display("Bottleneck queue is that of");
display(maxposition);
display("max lambda is");
display(max_lambda);


for i=1:99
  new_lambda = max_lambda*i/100;
  saved(i) = new_lambda;
  lambda = [new_lambda,1];
  ET(i) = sum(mean_clients(lambda,mu))/sum(lambda);
endfor
figure();
plot(saved,ET,"r","linewidth",2);

