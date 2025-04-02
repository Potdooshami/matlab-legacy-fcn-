function nest_histoImg(dt,egs,n_loose)
results = stm.nest_histcounts(dt,egs,n_loose);
stm.nest_histoImg_draw(results);
end