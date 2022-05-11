%Compute.m ***********************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% An octave subroutine for mashing the surfaces (local geoid and elipsoid)
function Compute( File, n, Bmin, Bmax, Lmin, Lmax, a, b, Scale, d, L0,xc, yc );
dB = (Bmax-Bmin)/n ;
dL = (Lmax-Lmin)/n ;
%...
out = fopen( File, "w" );
for i =0:n-1
L = Lmin + i*dL ;
for j=0:n
B = Bmin + j*dB ;
[x,y] = BL_xy( a,b, L0, B,L );
y =y+500000.0;
[ N ] = N_( x,y, xc,yc, d ) ;
[X,Y,Z] = BLh_XYZ(a,b,B,L, Scale * N );
fprintf(out,"%12.4f %12.4f %12.4f\n",X,Y,Z);
endfor
i=i+1;
L = Lmin + i*dL ;
[x,y] = BL_xy( a,b, L0, B,L );
 y =y +500000.0 ;
[ N ] = N_( x,y, xc,yc, d ) ;
[X,Y,Z] = BLh_XYZ(a,b,B,L, Scale * N ); fprintf(out,"%12.4f %12.4f %12.4f\n",X,Y,Z);
for j=n:-1:0
B = Bmin + j*dB ;
[x,y] = BL_xy( a,b, L0, B,L );
y =y+500000.0 ;
[ N ] = N_( x,y, xc,yc, d ) ;
[X,Y,Z] = BLh_XYZ(a,b,B,L, Scale * N ); fprintf(out,"%12.4f %12.4f %12.4f\n",X,Y,Z);
endfor
endfor
%...
for i =0:n-1
B = Bmin + i*dB ;
for j=0:n
L = Lmin + j*dL ;

[x,y] = BL_xy( a,b, L0, B,L );
y =y+500000.0 ;
[ N ] = N_( x,y, xc,yc, d ) ;
[X,Y,Z] = BLh_XYZ(a,b,B,L, Scale * N ); fprintf(out,"%12.4f %12.4f %12.4f\n",X,Y,Z);
endfor
i++;
B = Bmin + i*dB ;
[x,y] = BL_xy( a,b, L0, B,L );
y =y+500000.0 ;
[ N ] = N_( x,y, xc,yc, d ) ;
[X,Y,Z] = BLh_XYZ(a,b,B,L, Scale * N ); fprintf(out,"%12.4f %12.4f %12.4f\n",X,Y,Z);
for j=n:-1:0
L = Lmin + j*dL ;
[x,y] = BL_xy( a,b, L0, B,L );
y =y+500000.0 ;
[ N ] = N_( x,y, xc,yc, d ) ;
[X,Y,Z] = BLh_XYZ(a,b,B,L, Scale * N ); fprintf(out,"%12.4f %12.4f %12.4f\n",X,Y,Z);
endfor
endfor
fclose(out);
%...
endfunction
%_______________________________________________________________________
function [ N ] = N_( xi,yi, xc,yc, a ) ;
x = (xi - xc)/1000.0 ;
y = (yi - yc)/1000.0 ;
% 0 1 2 3 4 5 6 7 8 9
A = [ 1., x, y, x*y, x^2, y^2, x*y^2, x^2*y, x^3, y^3 ] ;
N = 0.0;
for i=1:length(a);
N += A(i)*a(i) ;
endfor
%N
endfunction
%Compute.m ***********************************************************
