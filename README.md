# manage-fasta-files
Functions to manage NCBI FASTA files on MATLAB.

## splitFasta  
Divides one single FASTA file with multiple sequences in various FASTA files with only one sequence.

## concatenateFasta  
Concatenates multiples FASTA files in one single FASTA file. The files need to be in the current folder. The output file name is FASTACONC.fasta.

## getSpp  
Returns a list of the species found on the fasta file.

## getGI  
Returns a list of the GI numbers found on the fasta file.

All the results are saved in the folder './output'. MATLAB R2017a or above.


## It is important that the FASTA file is in the NCBI format. In other words, the name of the species needs to be between squares brackets to be recognized. For example: [Canis lupus]

