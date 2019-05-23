function splitFasta(fasta)
% splitFasta  Divides one single FASTA file with multiple sequences in
% various FASTA files with only one sequence.
%   
%   It is necessary necessary to have two files in the current folder to run this
%   funciTon: sppList.txt and geneList.txt
%   
%   sppList.txt   - a list of scientific names with underlines instead of
%                   spaces and one name per line. There is a file example on this folder.
%                   Example: Aenictus_togoensis
%
%   geneList.txt   - a list of gene names with underlines instead of
%                   spaces and one name per line. There is a file example on this folder.
%                   Example: cytochrome_c_oxidase_subunit_1
%
%   Using NO lists (both lists empty): the function will create a FASTA file for each sequence 
%   of the FASTA file with multiple sequences.
%
%   Using only geneList (sppList empty): the function will create a folder for
%   which protein cited on the geneList. Then the function will search only for
%   the sequences that correspond to the genes of the geneList and it will
%   save each sequence as a FASTA file in the corresponding folder.
%
%   Using only sppList (geneList empty): the function will search only for
%   the sequences that correspond to the species of the sppList and it will
%   save each sequence as a FASTA file.
%
%   Using both lists: the function will create a folder for
%   which protein cited on the geneList. Then the function will search only for
%   the sequences that correspond to the species of the sppList. After that, it  will create
%   a FASTA file for each sequence and it will save the sequences in the folder corresponding 
%   to its protein.
%
%   If you use sppList, it is important that the fasta file is in the NCBI format. In other
%   words, the name of the species needs to be between square brackets to
%   be recognized. For example: [Canis lupus]

cellList1 = textscan(fopen('sppList.txt','r'),'%s');
sppList= string(strrep(cellList1{1},'_',' '));
cellList2 = textscan(fopen('geneList.txt','r'),'%s');
geneList= string(strrep(cellList2{1},'_',' '));
fclose('all');

if isempty(geneList) && isempty(sppList)
    mkdir('output');
    arrayfun(@(x) fastawrite(char(strcat('output/', getSpp(x),' - ', getGI(x), '.fasta')), x),fasta)
elseif isempty(geneList)
    mkdir('output');
    gene=[];
    writeFastaSpp(fasta, gene, sppList);
elseif isempty(sppList)
    mkdir('output');
    for i = 1:length(geneList)
        mkdir(strcat('output/',geneList(i)))
        geneCheck = arrayfun(@(x) checkStr(x.Header, geneList(i)),fasta);
        fastaCropped = fasta(geneCheck);
        if ~isempty(fastaCropped)
            arrayfun(@(x) fastawrite(char(strcat('output/',geneList(i),'/',getSpp(x),' - ',getGI(x), '.fasta')), x),fasta)
        end
    end
else
    for i = 1:length(geneList)
        mkdir(strcat('output/', geneList(i)))
        geneCheck = arrayfun(@(x) checkStr(x.Header, geneList(i)),fasta);
        fastaCropped = fasta(geneCheck);
        if ~isempty(fastaCropped)
            writeFastaSpp(fastaCropped, geneList(i), sppList);
        end
    end
end


end

