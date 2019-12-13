%this is an auxiliar function.
function writeFastaSpp(fasta, gene, sppList)
n = length(sppList);
for i = 1:n
    sppCheck = arrayfun(@(x) checkStr(x.Header, sppList(i,1)),fasta);
    fastaCropped = fasta(sppCheck);
    if ~isempty(fastaCropped)
        warning('off','Bioinfo:fastawrite:AppendToFile'); 
        if isempty(gene)
            arrayfun(@(x) fastawrite(char(strcat('output/', sppList(i), '.fasta')), x),fastaCropped);
            display(strcat(num2str(i),'/', num2str(n), ' - ',gene, ' - ',sppList(i)))
        else
            arrayfun(@(x) fastawrite(char(strcat('output/', gene, '/', sppList(i), '.fasta')), x),fastaCropped);
            display(strcat(num2str(i),'/', num2str(n), ' - ',gene, ' - ',sppList(i)));
            fasta = fasta(~sppCheck);
        end
        fasta = fasta(~sppCheck);
    end
end
end

