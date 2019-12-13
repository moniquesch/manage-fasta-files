%this is an auxiliar function. To call this function use:
%genera = arrayfun(@(x) extractGenus(x),fastaStruct);
function [genus] = extractGenus(fastaStruct)
genus=extractBetween(fastaStruct.Header, '[', ' ');
if isempty(genus)
    genus =cellstr('GENUS UNKNOWN');
end
if ~isscalar(genus)
    genus=genus(end,1);
end
genus=string(genus);
end