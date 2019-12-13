function [genera] = getUniqueGenera(fastaStruct)
% getGenera  Returns a list with the genus of each sequence on the FASTA struct.
%   genera = getUniqueGenera(fastaStruct) is a string array containing the name of the genera on the FASTA.
%   
%   It is important that the FASTA struct is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

genera = unique(arrayfun(@(x) extractGenus(x),fastaStruct));

end

