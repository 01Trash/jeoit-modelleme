%HRT432_OK.m ********************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% Main routine for ploting the surfaces (local geoid and elipsoid)
function HRT432_OK();
%... Constants
ro_D = 180.0/pi() ;
a = 6378137.00000;
b = 6356752.31414;
%... Files
DATA = "44-ERDEM GÜNEŞ.txt";
ELIP = "Elips.txt";
GEOD = "Geoid.txt";
%... Read Data File
[x, y, z, H , PN] = textread( DATA, "%f %f %f %f %s","headerlines",1);
%... Compute Extremum
m = length(x) ;
B_min = L_min = 100000.0 ;
B_max = L_max = -100000.0 ;
Bc = Lc = 0.0 ;
for i=1:m;
[ B, L, h ] = XYZ_BLh( a, b, x(i), y(i), z(i) ) ;
if ( B <= B_min ) B_min = B ; endif
if ( B >= B_max ) B_max = B ; endif
if ( L <= L_min ) L_min = L ; endif
if ( L >= L_max ) L_max = L ; endif
Bc =Bc+ B ;
Lc =Lc+ L ;
endfor
Bc =Bc/ m ;
Lc =Lc/ m ;
L0 = DOM_( 3 , Lc )/ro_D;
[ xc, yc ] = BL_xy( a, b, L0, Bc, Lc ); yc = yc + 500000.0 ;
%... Grid Number
n = 20 ;
Scale = 5000.0 ;
%... Ellipse
d = zeros(10,1) ;
Compute(ELIP,n,B_min,B_max,L_min,L_max, a,b,Scale, d, L0,xc,yc);

%... Geoid ( Nk = Ak * d )
d( 1,1) = 31.1136100240586;
d( 2,1) = 0.0183030604096564;
d( 3,1) = -0.0309427023710564;
d( 4,1) = -5.70855963711245E-05;
d( 5,1) = 0.000238901390671885;
d( 6,1) = 9.6400392279396E-05;
d( 7,1) = -2.49653682419639E-06;
d( 8,1) = 1.51444834182853E-06;
d( 9,1) = -1.26388874008245E-06;
d(10,1) = 3.41832300945527E-06;
Compute(GEOD,n,B_min,B_max,L_min,L_max, a,b,Scale, d, L0,xc,yc);
%... Ploting
Plot( DATA, ELIP, GEOD ) ;
endfunction
%HRT432_OK.m *****************************************************

