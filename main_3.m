clc,clear
pkg load io

##########################
%%% 3. soru başlangıç
##########################

%%% Verileri çek
filename = 'xy.csv';
data_source = csvread(filename);

x_top = 0;
y_top = 0;

[m n] = size(data_source);
for i=1:m;
    k=1:n;

    x_top = x_top + data_source(i,1);
    y_top = y_top + data_source(i,2);

    i = i+1;

end
%fprintf("x_top: %4.7f \n y_top: %4.7f", x_top, y_top);
x_ort = x_top / m;
y_ort = y_top / m;
%fprintf("x_ort: %4.7f \n y_ort: %4.7f", x_ort, y_ort);

for i=1:m;
    k=1:n;

    x = data_source(i,1)- x_ort;
    y = data_source(i,2)-  y_ort;

    M(i,1) = x;
    M(i,2) = y;

    i = i+1;

end
%fprintf("x: %4.7f \n y: %4.7f", x, y);


%%% M dosyasını dosyaya yazdır
%M
%csvwrite('x_Y_N.csv', M);


%%% Verileri çek
filename_1 = 'hoca.ods';
data_source_1 = xlsread(filename_1);
filename_2 = 'BLh.csv';
data_source_2 = csvread(filename_2);

for i=1:m;

    % data_source_2(i,3) => h
    % data_source_1(i,4) => H

    N = data_source_2(i,3) - data_source_1(i,4);

    M(i,3) = N;

    l(i,1) = N;

    i = i+1;

end

%%% M dosyasını dosyaya yazdır
%M
%csvwrite('soru_3.csv', M);

%%% A
%N( x, y) = a_0 + a_1 y + a_2 x + a_3 x^2 +
                %a_4 xy + a_5 y^2 + a_6 x^3 +
                    %a_4 x^2 y + a_8 xy^2 + a_9 y^3



for i=1:m;

    a_0 = 1.0;
    A(i,1) = a_0;

    a_1_x = M(i,1);
    A(i,2) = a_1_x;

    a_2_y = M(i,2);
    A(i,3) = a_2_y;

    a_3_x_y = M(i,1) * M(i,2);
    A(i,4) = a_3_x_y;

    a_4_x_x = M(i,1) * M(i,1);
    A(i,5) = a_4_x_x;

    a_5_y_y = M(i,2) * M(i,2);
    A(i,6) = a_5_y_y;

    a_6_x_y_y = M(i,1) * M(i,2) * M(i,2);
    A(i,7) = a_6_x_y_y;

    a_7_x_x_y = M(i,1) * M(i,1) * M(i,2);
    A(i,8) = a_7_x_x_y;

    a_8_x_x_x = M(i,1) * M(i,1) * M(i,1);
    A(i,9) = a_8_x_x_x;

    a_9_y_y_y = M(i,2) * M(i,2) * M(i,2);
    A(i,10) = a_9_y_y_y;

    i=i+1;

end

A_T = transpose(A);

A_T_A = A_T * A;

Qdelta = inv(A_T_A);

A_T_l = A_T * l;

delta_x = Qdelta * A_T_l;

V = A * delta_x - l;

V_T = transpose(V);

V_T_V = V_T * V;

n = 36;
u = 10;
f = n - u;

m0 = (V_T_V / f).^0.5;

Qdelta_k_k(1,1) = Qdelta(1,1);
Qdelta_k_k(2,1) = Qdelta(2,2);
Qdelta_k_k(3,1) = Qdelta(3,3);
Qdelta_k_k(4,1) = Qdelta(4,4);
Qdelta_k_k(5,1) = Qdelta(5,5);
Qdelta_k_k(6,1) = Qdelta(6,6);
Qdelta_k_k(7,1) = Qdelta(7,7);
Qdelta_k_k(8,1) = Qdelta(8,8);
Qdelta_k_k(9,1) = Qdelta(9,9);
Qdelta_k_k(10,1) = Qdelta(10,10);

ma_k = m0 * sqrt(Qdelta_k_k);

T_k(1,1) = abs(delta_x(1,1)) / abs(ma_k(1,1));
T_k(2,1) = abs(delta_x(2,1)) / abs(ma_k(2,1));
T_k(3,1) = abs(delta_x(3,1)) / abs(ma_k(3,1));
T_k(4,1) = abs(delta_x(4,1)) / abs(ma_k(4,1));
T_k(5,1) = abs(delta_x(5,1)) / abs(ma_k(5,1));
T_k(6,1) = abs(delta_x(6,1)) / abs(ma_k(6,1));
T_k(7,1) = abs(delta_x(7,1)) / abs(ma_k(7,1));
T_k(8,1) = abs(delta_x(8,1)) / abs(ma_k(8,1));
T_k(9,1) = abs(delta_x(9,1)) / abs(ma_k(9,1));
T_k(10,1) = abs(delta_x(10,1)) / abs(ma_k(10,1));



##########################
%%% 3. soru bitiş
##########################








