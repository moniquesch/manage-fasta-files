function concatenateFasta
% concatenateFasta  Concatenates multiples FASTA files in one single MULTI FASTA
% file. The files need tobe in the current folder. The output file name is
% FASTACONC.fasta.

system('cat *.fasta > FASTACONC.fasta');

end

