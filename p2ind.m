%{
brief 
subplot linear index transfromation is different from conventional matrix 

 
date 
2022.3.8

return 
ind: conventional linear index

param 
sz = [m n]
p: subplot linear index

%}
function ind = p2ind(sz,p)
[row,col] = p2sub(sz,p);
ind = sub2ind(sz,row,col);
end