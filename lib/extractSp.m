%this is an auxiliar function. To call this function use:
%spp = arrayfun(@(x) extractSp(x),fastaStruct);
function [sp] = extractSp(fastaStruct)
sp=extractBetween(fastaStruct.Header, '[', ']');
if isempty(sp)
    sp =cellstr('SPECIES UNKNOWN');
end
if ~isscalar(sp)
    sp=sp(end,1);
end
sp=string(sp);
end