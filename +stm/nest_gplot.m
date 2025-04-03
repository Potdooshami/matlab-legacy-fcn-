function bings = nest_gplot(results,G,V)
szg = size(G);
G = reshape(G,[szg(1)*szg(2) szg(3)]);
for iLoose = 1:length(results.N_loose)
    ptsFcs = results.bin_loose == iLoose;
    ptsFcs = ptsFcs(:);       
    bings(iLoose,:) = mean(G(ptsFcs,:));
end
plot(V,bings,LineWidth=2);
xlabel(pubfig.labeler('E','eV'))
ylabel(pubfig.labeler('LDOS','arb'))
end


%[appendix]{"version":"1.0"}
%---
