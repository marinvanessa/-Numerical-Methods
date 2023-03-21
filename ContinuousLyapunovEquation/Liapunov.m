function [X] = Liapunov(A,C)
%reducem la forma Schur reala
[U,S] = schur(A);
%transformam forma Schur reala la forma Schur complexa
[U,S] = rsf2csf(U,S);
%dupa ce aducem la forma Schur complexa, avem A=USU' si A'=US'U'
n =  size(A);
X = rand(n);
%dupa ce inlocuim si prelucram ecuatia Liapunov, obtinem:
Y = U'*X*U;
C = U'*C*U;
%matricea identitate folosita mai jos, trebuie sa aiba dimensiunea ca
%matricea U
I = eye(size(U));
for j = 1 : n
    s = 0;
    for k = 1 : j-1
        s = s + S(k,j) * Y(:,k);
    end
    if j > 1
        C(:,j) = C(:,j) - s;
    end
    %se obtin mai multe sisteme inferior triunghiulare cu necunoscuta Y
    %acestea se vor rezolva cu algoritmul de rezolvare a sistemeleor
    %inferior triunghiulare(S_INF_TR)
    Y(:,j) = LTRIS(S' + S(j,j)*I, C(:,j)); 
end
X = real(U*Y*U'); %deoarece C e o matrice simetrica si X va fi o matrice simetrica
end

