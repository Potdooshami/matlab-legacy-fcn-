function nest_histogram_draw(results)
%here the results is a output of `nest_histcounts`
hold on
for ithLooseBin = 1:length(results.N_loose)
    bwlistBin = results.N_partition==ithLooseBin;
    ilistBin = find(bwlistBin);
    egNow = results.edges(min(ilistBin):max(ilistBin)+1)
    histogram(results.dt,egNow)
end
hold off
end

%[appendix]{"version":"1.0"}
%---
