function [spp] = getSpp(fasta)
% getSpp  Return a list of the species found on the fasta file.
%   spp = getSpp(fasta)
%   fasta = fasta file.

spp = unique(arrayfun(@(x) extractSp(x),fasta));

end

function [sp] = extractSp(fasta)
sp=extractBetween(fasta.Header, '[', ']');
if isempty(sp)
    sp =cellstr('[species unknown]');
end
if ~isscalar(sp)
    sp=sp(end,1);
end
end