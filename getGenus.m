function [genus] = getGenus(fasta)
% getSpp  Returns a list of the genus found on the fasta file.
%   genus = getGenus(fasta) is a string array containing the name of the genus on the FASTA file.
%   
%   It is important that the fasta file is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

genus = unique(arrayfun(@(x) extractGenus(x),fasta));

end

function [genus] = extractGenus(fasta)
genus=extractBetween(fasta.Header, '[', ' ');
if isempty(genus)
    genus =cellstr('GENUS UNKNOWN');
end
if ~isscalar(genus)
    genus=genus(end,1);
end
genus=string(genus);
end