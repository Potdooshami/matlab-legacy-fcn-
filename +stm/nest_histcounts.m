function results = nest_histcounts(dt,egs,n_loose)
[N,edges,bin] = histcounts(dt,egs);
egs_loose = linspace(.5,length(N)+.5,n_loose+1);
[N_loose,edges_loose,bin_loose] = histcounts(bin,egs_loose);
[~,~,N_partition] = histcounts(1:length(N),egs_loose);
results.N = N;
results.edges = edges;
results.bin = bin;
results.N_loose = N_loose;
results.N_partition = N_partition;
results.edges_loose = edges_loose;
results.bin_loose = bin_loose;
results.dt = dt;
end

%[appendix]{"version":"1.0"}
%---
