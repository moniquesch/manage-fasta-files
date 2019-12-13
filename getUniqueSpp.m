function [spp] = getUniqueSpp(fastaStruct)
% getSpp  Returns a list of the unique species found on the FASTA struct.
%   spp = getSpp(fastaStruct) is a string array containing the name of the species on the FASTA struct.
%  
%   It is important that the FASTA struct is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

spp = unique(arrayfun(@(x) extractSp(x),fastaStruct));

end