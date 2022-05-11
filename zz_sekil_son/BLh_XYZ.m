%BLh_XYZ.m *********************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey%
%O.KURT, orhan.kurt@kocaeli.edu.tr
% An octave subroutine for (B,L,h)--->(X,Y,Z)
function [X,Y,Z] = BLh_XYZ( a, b, B, L, h)
e = (a*a-b*b)/a/a ;
N = a/sqrt(1.0-e*sin(B)*sin(B));
X = ( N + h ) * cos(B) * cos(L);
Y = ( N + h ) * cos(B) * sin(L);
Z = (b*b/a/a*N + h ) * sin(B);
endfunction
%BLh_XYZ.m *********************************************************
