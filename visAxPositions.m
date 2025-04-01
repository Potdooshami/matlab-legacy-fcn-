% function poss = visAxPositions(ax)
% % visAxPositions - Visualizes and returns a table of various position properties of given axis/axes.
% %
% % Usage:
% %   poss = visAxPositions(); % Finds all axes in the current figure and processes them.
% %   poss = visAxPositions(ax); % Processes the specified axis.
% %
% % Input:
% %   ax (optional) - Axis object. If omitted, all axes in the current figure (gcf) are processed.
% %
% % Output:
% %   poss - Table containing position properties of the axis/axes.
% %
% % Description:
% %   This function extracts 'OuterPosition', 'TightInset', 'Position', and 'TightPosition' properties of axes,
% %   stores them in a table, and visually displays each property as a rectangle on the figure.
% 
% if nargin < 1
%     ax = findall(gcf, 'Type', 'axes'); % Find all axes in current figure if no input is given
% end
% 
% if isempty(ax)
%     warning('No axes found in the current figure.');
%     poss = table();
%     return;
% end
% 
% nmax = ["OuterPosition", "TightInset", "Position", "TightPosition"]; % Property names
% clrs = ["b", "m", "r", "y"]; % Colors for visualization
% 
% poss = cell(numel(ax), 5); % Preallocate cell array for multiple axes
% 
% for a = 1:numel(ax)
%     currAx = ax(a);
%     poss{a, 1} = currAx; % Store axis handle
%     poss{a, 2} = currAx.OuterPosition;
%     poss{a, 3} = tightPosition(currAx, "IncludeLabels", true);
%     poss{a, 4} = currAx.Position;
%     poss{a, 5} = tightPosition(currAx);
% 
%     % Draw rectangles on figure
%     for ind = 2:5 % Skip first column (axis handle)
%         annotation("rectangle", poss{a, ind}, Color=clrs(ind-1), LineWidth=2);
%     end
% end
% 
% % Convert cell array to table and set variable names
% poss = cell2table(poss, 'VariableNames', ["Axis", nmax]);
% end
% 
% 
function poss = visAxPositions(ax, doDraw)
% visAxPositions - Visualizes and returns a table of various position properties of given axis/axes.
%
% Usage:
%   poss = visAxPositions(); % Finds all axes in the current figure and processes them with visualization.
%   poss = visAxPositions(ax); % Processes the specified axis with visualization.
%   poss = visAxPositions(ax, false); % Processes the specified axis without visualization.
%   poss = visAxPositions([], false); % Processes all axes without visualization.
%
% Input:
%   ax (optional) - Axis object. If omitted or empty, all axes in the current figure (gcf) are processed.
%   doDraw (optional) - Boolean flag to control drawing. Default is true (draw enabled).
%
% Output:
%   poss - Table containing position properties of the axis/axes.
%
% Description:
%   This function extracts 'OuterPosition', 'TightInset', 'Position', and 'TightPosition' properties of axes,
%   stores them in a table, and optionally displays each property as a rectangle on the figure.

if nargin == 1 && islogical(ax)
    doDraw = ax;
    ax = findall(gcf, 'Type', 'axes'); % Find all axes in current figure
elseif nargin < 1 || isempty(ax)
    ax = findall(gcf, 'Type', 'axes'); % Default to finding all axes
end
if nargin < 2 || isempty(doDraw)
    doDraw = true; % Default to drawing
end

if isempty(ax)
    warning('No axes found in the current figure.');
    poss = table();
    return;
end

nmax = ["OuterPosition", "TightInset", "Position", "TightPosition"]; % Property names
clrs = ["b", "m", "r", "y"]; % Colors for visualization

poss = cell(numel(ax), 5); % Preallocate cell array for multiple axes

for a = 1:numel(ax)
    currAx = ax(a);
    poss{a, 1} = currAx; % Store axis handle
    poss{a, 2} = currAx.OuterPosition;
    poss{a, 3} = tightPosition(currAx, "IncludeLabels", true);
    poss{a, 4} = currAx.Position;
    poss{a, 5} = tightPosition(currAx);
    
    % Draw rectangles on figure only if doDraw is true
    if doDraw
        for ind = 2:5 % Skip first column (axis handle)
            annotation("rectangle", poss{a, ind}, 'Color', clrs(ind-1), 'LineWidth', 2);
        end
    end
end

% Convert cell array to table and set variable names
poss = cell2table(poss, 'VariableNames', ["Axis", nmax]);
end
