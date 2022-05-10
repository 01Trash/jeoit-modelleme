clc,clear
a=6378137;
b=6356752.31414;

B_min = 38.0990850001288;
B_max = 39.1165599997147;
L_min = 37.4678739994685;
L_max = 38.6508159996535;
n = 20;
delta_B = (B_max-B_min)/n;
delta_L = (L_max-L_min)/n;
cks= fopen('Elipsoit.txt',"w");
for i=1:n
  L(i,1)=i*delta_L+L_min;
  for j=1:n
    B(j,1)=j*delta_B+B_min;

        [X,Y,Z] = BLh_XYZ(a,b,B(j,1),L(i,1),0.);
        fprintf(cks,"%12.7f %12.7f %12.7f\n",X,Y,Z);
  end

end

for i=1:n
  B(i,1)=i*delta_B+B_min;
  for j=1:n
    L(j,1)=j*delta_L+L_min;

        [X,Y,Z] = BLh_XYZ(a,b,B(i,1),L(j,1),0.);
        fprintf(cks,"%12.4f %12.4f %12.4f\n",X,Y,Z);
  end

end
    fclose(cks);
