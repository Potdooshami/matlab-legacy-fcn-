%{
brief 
subplot linear index transfromation is different from conventional matrix 
 
date 
2022.3.8

return 
p: subplot linear index

param
sz:[m n]
row:i 
col:j

%}
function p = sub2p(sz,row,col)
p = sub2ind(flip(sz),col,row);
end