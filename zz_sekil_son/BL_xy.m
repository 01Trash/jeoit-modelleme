%BL_xy.m ************************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% An octave subroutine for (B,L,L0)--->(x,y-50000.)
function [x,y] = BL_xy( a,b, L0, B,L );
dL=(L-L0);
t=tan(B);
bn=(a-b)/(a+b);
nu=(a*a-b*b)/b/b*cos(B)*cos(B);
N=(a*a)/b/sqrt(1+nu);
b1=(a+b)/2.*(1.+bn*bn/4.+bn^4/64.);
b2=-3./2.*bn+9./16.*bn^3-3./32.*bn^5;
b3=15./16.*bn*bn-15./32.*bn^4;
b4=-35./48.*bn^3+105./256.*bn^5;
b5=315./512.*bn^4;
x=b1*(B+b2*sin(2.*B)+b3*sin(4.*B)+b4*sin(6.*B)+b5*sin(8.*B)) ...
+ t*N*( (dL*cos(B))^2/2. ...
+ (dL*cos(B))^4 * ( 5. -t^2 + 9.*nu
+4.*nu^2)/24. ...
+ (dL*cos(B))^6 * ( 61. -58.*t^2 + t^4 +270.*nu -
330.*nu*t^2)/720. ...
+ (dL*cos(B))^8 * (1385. -3111.*t^2 + 543.*t^4 -t^6)/40320. ...
);
y= N*( dL*cos(B) ...
+ (dL*cos(B))^3 * ( 1. -t^2 + nu)/6.+...
+ (dL*cos(B))^5 * ( 5. -18.*t^2 + t^4 + 14.*nu -
58.*t^2*nu)/120. ...
+ (dL*cos(B))^7 * ( 61. -479.*t^2 + 179.*t^4 -t^6 )/5040. ...
);
end
%BL_xy.m *************************************************************
