%XYZ _BLh.m *********************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% An octave subroutine for (X,Y,Z)--->(B,L,h)
function [ B, L, h ] = XYZ_BLh( a,b, X,Y,Z )
e = ( a^2 - b^2) / a^2 ;
p = sqrt( X*X + Y*Y ) ;
B = atan ( Z /(p-e*p) ) ;
while(true);
Bo = B ;
N = a/sqrt(1.0-e*sin(B)*sin(B)) ;
h = p/cos(Bo)-N ;
B = atan(Z/p/(1-e*N/(N+h))) ;
if (abs(B-Bo) <= 5e-16)
break;
endif ;
endwhile
#N = Nradi(a,b,B);
h = p/cos(B) - N ;
B = atan(Z/p/(1-e*N/(N+h))) ;
L = mod( atan2( Y, X )+2.*pi(), 2.*pi() ) ;
endfunction
%XYZ _BLh.m *********************************************************
