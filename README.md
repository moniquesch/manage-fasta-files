# manage-fasta-files
Functions to manage NCBI FASTA files on MATLAB.

## splitFasta  
Divides one single MULTI FASTA file with multiple sequences in various FASTA files. It is possible to split the FASTA struct based on list of proteins and species. 

## concatenateFasta  
Concatenates multiples FASTA files in one single MULTI FASTA file. The files need to be in the current folder. The output file name is FASTACONC.fasta.

## getSpp  
Returns a list with the species of each sequence on the FASTA struct.

## getUniqueSpp
Returns a list of the unique species found on the FASTA struct.

## getGenera
Returns a list with the genus of each sequence on the FASTA struct.

## getUniqueGenera
Returns a list with the genus of each sequence on the FASTA struct.

## getGI  
Returns a list of the GI numbers found on the fasta file.

All the results are saved in the folder './output'. MATLAB R2017a or above.


## It is important that the FASTA file is in the NCBI format. In other words, the name of the species needs to be between squares brackets to be recognized. For example: [Canis lupus]

