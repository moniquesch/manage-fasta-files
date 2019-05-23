function [spp] = getSpp(fasta)
% getSpp  Returns a list of the species found on the fasta file.
%   spp = getSpp(fasta) is a string array containing the name of the species on the FASTA file.
%   
%   It is important that the fasta file is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

spp = unique(arrayfun(@(x) extractSp(x),fasta));

end

function [sp] = extractSp(fasta)
sp=extractBetween(fasta.Header, '[', ']');
if isempty(sp)
    sp =cellstr('SPECIES UNKNOWN');
end
if ~isscalar(sp)
    sp=sp(end,1);
end
sp=string(sp);
end