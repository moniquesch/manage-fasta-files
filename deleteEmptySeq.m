function deleteEmptySeq(fileName)
% deleteEmptySeq  Deletes empty sequences from the FASTA file. The output file name is
% noEmpty.fasta.
system(strcat("awk 'BEGIN {RS = "">"" ; FS = ""\n"" ; ORS = """"} $2 {print "">""$0}' ", fileName," > noEmpty.fasta"));

end

