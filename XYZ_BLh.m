
function [B,L,h] = XYZ_BLh(a,b,X,Y,Z);
    e = (a^2-b^2)/a^2 ;
    p = sqrt(X^2+Y^2);
    B = atan(Z/p/(1-e));
    Bo = 1.0 ;
    ro_D = 180/pi ;

    while( abs(B-Bo) >= 1e-15 );
        Bo = B ;
        N  = a/sqrt(1-e*(sin(Bo))^2);
        h  = p/cos(Bo) -N;
        B  = atan(Z/p/(1.-e*N/(N+h)));
       % L = mod( atan2(Y,X)+2*pi,2*pi ) ; fprintf("\n  B=%8.14f    L=%8.14f    h=%8.4f", B*ro_D,L*ro_D,h );
    end

     N = a/sqrt(1-e*(sin(B))^2);
     h = p/cos(B) -N;
     B = atan(Z/p/(1.-e*N/(N+h)));
     L = mod( atan2(Y,X)+2*pi,2*pi) ;
end

