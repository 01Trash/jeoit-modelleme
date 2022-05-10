function [X,Y,Z] = BLh_XYZ(a,b,B,L,h);
    
   e_kare=(a^2-b^2)/a^2;
   
   N=a/sqrt(1-e_kare*sind(B)^2);

   X=(N+h)*cosd(B)*cosd(L);
   Y=(N+h)*cosd(B)*sind(L);
   Z=((1-e_kare)*N+h)*sind(B);
end