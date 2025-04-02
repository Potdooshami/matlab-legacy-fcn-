function nest_histogram(dt,egs,n_loose)
results = stm.nest_histcounts(dt,egs,n_loose);
stm.nest_histogram_draw(results);
% hold on
% for ithLooseBin = 1:n_loose
%     bwlistBin = results.N_partition==ithLooseBin;
%     ilistBin = find(bwlistBin);
%     egNow = egs(min(ilistBin):max(ilistBin)+1)
%     histogram(dt,egNow)
% end
% hold off
end

%[appendix]{"version":"1.0"}
%---
