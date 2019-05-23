# manage-fasta-files
Functions to manage FASTA files on MATLAB.
MATLAB R2017a or above.

## splitFasta  
Divides one single FASTA file with multiple sequences in various FASTA files with only one sequence.

## concatenateFasta  
Concatenates multiples FASTA files in one single FASTA file. The files need to be in the current folder. The output file name is FASTACONC.fasta.

## getSpp  
Returns a list of the species found on the fasta file.

## getGI  
Returns a list of the GI numbers found on the fasta file.

All the results are saved in the folder './output'.
