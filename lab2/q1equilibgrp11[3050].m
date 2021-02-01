% McCabe and Thiele Graphical Method for Binary Distillation 
% Function equilib, called by main program, gives the 
% relationship between liquid and vapor mole fractions 
% for the low boiling component of binary mixture 
% with constant relative volatility alpha=2.45 

function f=q1equilibgrp11(x)

global y

alpha=2.45;

f=y-alpha*x/(1+(alpha-1)*x);

end
