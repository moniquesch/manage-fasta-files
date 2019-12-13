function splitFasta(fasta)
% splitFasta  Divides one single MULTI FASTA file with multiple sequences in
% various FASTA files.
%   splitFasta(fastaStruct)
%
%   ALL THE RESULTS ARE SAVED IN OUTPUT FOLDER.
%   
%   It is necessary necessary to have two files in the current folder to run this
%   funciTon: sppList.txt and geneList.txt
%   
%   sppList.txt   - a list of scientific names with no spaces (underlines only) and one name per line. There is a file example on this folder.
%                   Example: Aenictus_togoensis
%
%   proteinList.txt   - a list of protein names with with no spaces (underlines only) and one name per line. There is a file example on this folder.
%                   Example: cytochrome_c_oxidase_subunit_1
%
%   Using NO lists (both lists empty): the function will create a FASTA file for each sequence 
%   of the MULTI FASTA file.
%
%   Using only proteinList (sppList empty): the function will create a MULTI FASTA file for
%   each protein cited on the proteinList. 
%
%   Using only sppList (proteinList empty): the function will create a MULTI FASTA file for
%   each species cited on the sppList. 
%
%   Using both lists: the function will create a folder for
%   each protein cited on the proteinList. Inside each protein folder, the function will create a MULTI FASTA file for
%   each species cited on the sppList. 
%
%   If you use sppList, it is important that the fasta file is in the NCBI format. In other
%   words, the name of the species needs to be between square brackets to
%   be recognized. For example: [Canis lupus]

cellList1 = textscan(fopen('sppList.txt','r'),'%s');
sppList= string(strrep(cellList1{1},'_',' '));
cellList2 = textscan(fopen('proteinList.txt','r'),'%s');
geneList= string(strrep(cellList2{1},'_',' '));
fclose('all');
clear cellList1 cellList2

if isempty(geneList) && isempty(sppList)
    mkdir('output');
    arrayfun(@(x) fastawrite(char(strcat('output/', extractBefore(x.Header, 21), '.fasta')), x),fasta)
elseif isempty(geneList)
    geneList=[];
    mkdir('output');
    writeFastaSpp(fasta, geneList, sppList);
elseif isempty(sppList)
    mkdir(strcat('output/'))
    n = length(geneList);
    for i = 1:n
        geneCheck = arrayfun(@(x) checkStr(x.Header, geneList(i)),fasta);
        fastaCropped = fasta(geneCheck);
        if ~isempty(fastaCropped)
            arrayfun(@(x) fastawrite(char(strcat('output/', geneList(i), '.fasta')), x),fastaCropped)
            display(strcat(num2str(i),'/', num2str(n), ' - ',geneList(i)));
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

