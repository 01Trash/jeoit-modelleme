%Plot.m *************************************************************
% HRT432 Geoid Modellig, Kocaeli University, Geodesy Division, Turkey
% O.KURT, orhan.kurt@kocaeli.edu.tr
% The octave subroutine for ploting the surfaces (local geoid and elipsoid)
function Plot( data, elip, geod );
[x, y, z, N, PN] = textread(data,"%f %f %f %f %s","headerlines",1);
#... Data Points
plot3(x, y, z,"*g");
xlabel("X [m]"); ylabel("Y [m]"); zlabel("Z [m]");
view( 70 , 30 );
#... Names of Data Points
hold ("on");
text(x,y,z,PN);
#... Reference Ellipse
hold ("on");
[x, y, z] = textread(elip,"%f %f %f","headerlines",0);
plot3(x, y, z,"-r");
#... Local Geoid
hold ("on");
[x, y, z] = textread(geod,"%f %f %f","headerlines",0);
plot3(x, y, z,"-b");
#... Plot Properties
hold ("on");
legend( data, elip, geod ) ;
hold ("off");
endfunction
%Plot.m *************************************************************
