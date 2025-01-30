function Pblocking = erlangb_factorial(r,c)
  sum=0;
  for k=0:c
    sum=sum+(r^k/factorial(k));
  endfor
  Pblocking = (r^c/factorial(c))/sum;
  display(Pblocking);
endfunction
