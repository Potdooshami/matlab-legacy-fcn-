function nest_histoImg_draw(results)
ax = gca;
nn = length(results.N_loose);
clrs = ax.ColorOrder(1:nn,:);
% results = stm.nest_histcounts(dt,egs,nn);
realLoose = label2rgb(results.bin_loose,clrs);
imshow(permute(realLoose,[2 1 3]));
set(gca,'YDir','normal');
axis image;
xlabel(pubfig.labeler('x','pxl'))
ylabel(pubfig.labeler('y','pxl'))
end