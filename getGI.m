function [gi] = getGI(fasta)
% getGI  Return a list of GI numbers from a fasta file.
%   gi = getGI(fasta)
%   fasta = fasta file.
gi = arrayfun(@(x) string(extractBetween(x.Header, 'gi|', '|')),fasta);
end

