function [spp] = getSpp(fastaStruct)
% getSpp  Returns a list with the species of each sequence on the FASTA struct.
%   spp = getSpp(fastaStruct) is a string array with the same size of the FASTA struct.
%   
%   It is important that the FASTA struct is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

spp = arrayfun(@(x) extractSp(x),fastaStruct);

end