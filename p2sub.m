%{
brief 
subplot linear index transfromation is different from conventional matrix 

 
date 
2022.3.8

return 
row:i 
col:j

param 
sz:[m n]
p: subplot linear index

%}

function [row col] = p2sub(sz,p)
[col row] = ind2sub(flip(sz),p);
end