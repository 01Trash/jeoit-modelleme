clc,clear

#________________________________________________________________
function HRT432()
data = "44-Erdem-Güneş.txt";
elip = "Elipsoit.txt";
geod = "Jeoit.txt";
plot_( data, elip, geod );
end
#________________________________________________________________
function plot_(data, elip, geod )

#... Data Points
[x, y, z, N, PN] = textread(data,"%f %f %f %f %s");
plot3(x, y, z, "*g");
hold ("on");
text(x,y,z,PN);

#... Reference Ellipse
[x, y, z] = textread(elip,"%f %f %f");
hold ("on");
plot3(x, y, z, "-r");

#... Local Geoid
[x, y, z] = textread(geod,"%f %f %f");
hold ("on");
plot3(x, y, z, "-b");

#... Plot Properties
hold ("on");
xlabel("X [m]"); ylabel("Y [m]"); zlabel("Z [m]");
legend( data, elip, geod ) ;
hold ("off");
view(60 , 30);
end

HRT432()


