clear all;
close all;
clc;

function Pblocking = erlangb_iterative(r,c)
  Pblocking = 1;
  for n=1:c
    Pblocking = (r*Pblocking)/(r*Pblocking+n);
  endfor
endfunction

r=200*23/60;
c=200;

minimum = true;
for i=1:c
  Pblocking(i)=erlangb_iterative(r,i);
  if Pblocking(i) < 0.01 && minimum
    disp("Pblocking < 1% for ")
    disp(i)
    minimum = false;
  endif
endfor

plot(1:200,Pblocking,"linewidth",1.5);