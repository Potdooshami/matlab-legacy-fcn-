%{
brief 
subplot linear index transfromation is different from conventional matrix 

 
date 
2022.3.8

return 
p: subplot linear index

param 
sz = [m n]
ind: conventional linear index

%}
function p = ind2p(sz,ind)
p = p2ind(flip(sz),ind)
end