function [gi] = getGI(fasta)
% getGI  Returns a list of the GI numbers found on the fasta file.
%   gi = getGI(fasta) is a string array containing the name of the species on the FASTA file.

%   It is important that the fasta file is in the NCBI format. In other
%   words, the gi number must to be present and between pipes. For example:
%   gi|12345|

gi = arrayfun(@(x) string(extractBetween(x.Header, 'gi|', '|')),fasta);
end

