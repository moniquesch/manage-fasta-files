function splitFasta(fasta)

cellList1 = textscan(fopen('sppList.txt','r'),'%s');
sppList= strrep(cellList1{1},'_',' ');
cellList2 = textscan(fopen('geneList.txt','r'),'%s');
geneList= strrep(cellList2{1},'_',' ');
fclose('all');

if isempty(geneList) && isempty(sppList)
    mkdir('output');
    arrayfun(@(x) fastawrite(strcat('output/',char(getSpp(x)) ,' - ',char(getGI(x)), '.fasta'), x),fasta)
elseif isempty(geneList)
    mkdir('output');
    gene=[];
    writeFastaSpp(fasta, gene, sppList);
elseif isempty(sppList)
    mkdir('output');
    for i = 1:length(geneList)
        mkdir(strcat('output/',char(geneList(i))))
        geneCheck = arrayfun(@(x) checkStr(x.Header, char(geneList(i))),fasta);
        fastaCropped = fasta(geneCheck);
        if ~isempty(fastaCropped)
            arrayfun(@(x) fastawrite(strcat('output/',char(geneList(i)),'/',char(getSpp(x)) ,' - ',char(getGI(x)), '.fasta'), x),fasta)
        end
    end
else
    for i = 1:length(geneList)
        %mkdir(strcat('output/',char(geneList(i))))
        geneCheck = arrayfun(@(x) checkStr(x.Header, char(geneList(i))),fasta);
        fastaCropped = fasta(geneCheck);
        if ~isempty(fastaCropped)
            writeFastaSpp(fastaCropped, char(geneList(i)), sppList);
        end
    end
end


end

