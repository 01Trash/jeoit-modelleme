%DOM_.m ***********************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% An octave subroutine for the central meridian of UTM)
function [ L0 ] = DOM_( deg, L ); % DRC = 3 or 6 , L (radyan)
global ro_D = 180./pi();
L *= ro_D ;
switch(deg)
case 6; %... 6.degree central meridian UTM projection
L0 = ( floor(L/6.) ) * 6. + 3.;
if( abs(L - L0) > 3.0) L0 += 6.; endif
otherwise;
L0 = ( floor(L/3.) ) * 3.;
if( abs(L - L0) > 1.5) L0 += 3.; endif
endswitch
endfunction
%DOM_.m ***********************************************************
