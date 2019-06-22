alpha = 0.6;
z = tf('z')
%syms z
H = alpha / (1-(1-alpha)*z^-1);
impulse(H,50);
% margin (H);
title ('Impulse Response alpha =(0.6)')

% syms z
% H = alpha / (1-(1-alpha)*z^-1)
% h = iztrans(H);
% tf(h)



