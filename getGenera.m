function [genera] = getGenera(fastaStruct)
% getGenera  Returns a list with the genus of each sequence on the FASTA struct.
%   genera = getGenera(fastaStruct) is a string array with the same size of the FASTA struct.
%   
%   It is important that the FASTA struct is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

genera = arrayfun(@(x) extractGenus(x),fastaStruct);

end

