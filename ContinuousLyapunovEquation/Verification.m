A = rand(5); %ne generam o matrice random de dim 5x5
%ne generam o matrice C simetrica de aceeasi dim ca A 
C = rand(size(A)); 
C = C-tril(C,-1) + triu(C,1)';
X = Liapunov(A,C);
% pentru verificare folosim functia lyap() din matlab
Y = lyap(A',-C);
% observam ca A din parametrii functiei lyap() este de fapt A' pentru noi
% iar Q din parametrii functiei lyap() este de fapt -C pentru noi
% comparam matricea Y cu matricea X si sesizam ca sunt identice, deci 
% am rezolvat corect
