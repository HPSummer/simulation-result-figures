function srf_style(fig, profile, sizeMM)
% Style only the supplied figure; existing data and line encodings are preserved.
arguments
    fig (1,1) matlab.ui.Figure
    profile (1,1) string {mustBeMember(profile,["classic","minimal"])} = "classic"
    sizeMM (1,2) double {mustBePositive,mustBeFinite} = [180 110]
end
fontName = 'Times New Roman';
boxMode = 'on'; gridMode = 'on';
if profile == "minimal"
    fontName = 'Arial'; boxMode = 'off'; gridMode = 'off';
end
if ~any(strcmpi(listfonts,fontName))
    warning('srf:FontFallback','Requested font unavailable; using Helvetica.');
    fontName = 'Helvetica';
end
fig.Units = 'centimeters';
pos = fig.Position; pos(3:4) = sizeMM/10; fig.Position = pos;
fig.Color = 'white';
axesList = findall(fig,'Type','axes');
for k = 1:numel(axesList)
    ax = axesList(k);
    set(ax,'FontName',fontName,'FontSize',8,'LineWidth',0.65, ...
        'Box',boxMode,'TickDir','in','XGrid',gridMode,'YGrid',gridMode, ...
        'GridAlpha',0.15,'Color','white');
    set([ax.XLabel ax.YLabel ax.ZLabel],'FontName',fontName,'FontSize',9);
    set(ax.Title,'FontName',fontName,'FontSize',9,'FontWeight','normal');
end
legends = findall(fig,'Type','legend');
set(legends,'FontName',fontName,'FontSize',8,'Box','off');
drawnow;
end
