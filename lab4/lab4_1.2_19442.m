function Pblocking = erlangb_iterative(r,c)
  Pblocking = 1;
  for n=1:c
    Pblocking = (r*Pblocking)/(r*Pblocking+n);
  endfor
endfunction
