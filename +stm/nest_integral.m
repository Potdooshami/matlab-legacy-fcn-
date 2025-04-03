function nest_integral(dt,egs,n_loose,G,V)
% figure
close
msb = 2;nsb = 2;
sp = @(p) subplot(msb, nsb, p);
results = stm.nest_histcounts(dt,egs,n_loose);

sp(1)
views(dt)
xlabel(pubfig.labeler('x','pxl'))
ylabel(pubfig.labeler('y','pxl'))
colormap("bone")
title('Realsapce Continous Value')

sp(2)
stm.nest_gplot(results,G,V)
title('Segment-wise averaged LDOS')


sp(3)
stm.nest_histoImg_draw(results);
title('Realsapce Segmented')

sp(4)
stm.nest_histogram_draw(results);
title('Value Quantization')

end

%[appendix]{"version":"1.0"}
%---
