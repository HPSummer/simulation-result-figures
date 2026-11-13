function paths = srf_demo(outputDir, profile)
% Synthetic layout fixture only; no simulated physical system or research claim.
arguments
    outputDir (1,1) string
    profile (1,1) string {mustBeMember(profile,["classic","minimal"])} = "classic"
end
t = linspace(0,12,241)';
y = [exp(-t/3).*cos(t),0.7*exp(-t/4).*sin(t)];
fig = figure('Visible','off','Name','Synthetic layout demo','NumberTitle','off');
cleanup = onCleanup(@() close(fig));
layout = tiledlayout(fig,1,2,'Padding','compact','TileSpacing','compact');
colors = [0 0.447 0.698;0.835 0.369 0];
styles = {'-','--'};
for panel = 1:2
    ax = nexttile(layout); hold(ax,'on');
    for j = 1:2
        value = y(:,j);
        if panel == 2, value = abs(value)+0.001; end
        plot(ax,t,value,'Color',colors(j,:),'LineStyle',styles{j}, ...
            'LineWidth',1.1,'DisplayName',sprintf('Case %d',j));
    end
    xlabel(ax,'Time (s)'); ylabel(ax,'Normalized response (-)');
    if panel == 2, ax.YScale = 'log'; end
    title(ax,sprintf('(%c) Synthetic demonstration','a'+panel-1));
    legend(ax,'Location','northeast');
end
srf_style(fig,profile,[180 85]);
paths = srf_export(fig,fullfile(outputDir,"matlab_"+profile),[180 85],true);
end
