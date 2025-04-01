function wf = lcwf(V,g_V__X)%linecut waterfall
wf = mesh(g_V__X,MeshStyle="row");
yticks([]);
zticks([]);
wf.XData = V;
xlim([min(V) max(V)]);
pbaspect([1 1 1])
view(0,80)
end