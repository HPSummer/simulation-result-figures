function paths = srf_export(fig, stem, sizeMM, saveEditable)
% Export a new vector PDF and PNG; optional FIG preserves MATLAB objects.
arguments
    fig (1,1) matlab.ui.Figure
    stem (1,1) string
    sizeMM (1,2) double {mustBePositive,mustBeFinite} = [180 110]
    saveEditable (1,1) logical = false
end
if isMATLABReleaseOlderThan('R2025a')
    error('srf:Version','Explicit export sizing requires MATLAB R2025a or newer.');
end
paths = [stem+".pdf",stem+".png"];
if saveEditable, paths(end+1) = stem+".fig"; end
if any(isfile(paths))
    error('srf:ExistingOutput','Choose a new output stem; existing output is protected.');
end
parent = fileparts(stem);
if strlength(parent)>0 && ~isfolder(parent), mkdir(parent); end
drawnow;
old = struct('PaperUnits',fig.PaperUnits,'PaperSize',fig.PaperSize, ...
    'PaperPosition',fig.PaperPosition,'PaperPositionMode',fig.PaperPositionMode);
restore = onCleanup(@() set(fig,old));
set(fig,'PaperUnits','centimeters','PaperSize',sizeMM/10, ...
    'PaperPosition',[0 0 sizeMM/10],'PaperPositionMode','manual');
print(fig,paths(1),'-dpdf','-vector');
exportgraphics(fig,paths(2),'Resolution',300,'BackgroundColor','white', ...
    'Units','centimeters','Width',sizeMM(1)/10,'Height',sizeMM(2)/10);
if saveEditable, savefig(fig,paths(3)); end
end
