function [x] = LTRIS(L,b)
n = size(b);
x = b;
for i = 1 : n
    for j = 1: i-1
        x(i) =  x(i)- L(i,j) * x(j);
    end
    x(i) = x(i)/ L(i,i);
end
end

