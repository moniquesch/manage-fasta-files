function writeFastaSpp(fasta, gene, sppList)
% writeFastaSpp  write the FASTA file using the scientific name and the GI number as the file name.
%   
%   It is important that the fasta file is in the NCBI format. In other
%   words, the name of the species needs to be between squares brackets to
%   be recognized. For example: [Canis lupus]

for i = 1:length(sppList)
   sppCheck = arrayfun(@(x) checkStr(x.Header, sppList(i,1)),fasta);
   fastaCropped = fasta(sppCheck);
   if ~isempty(fastaCropped)
       filepath= strcat('output/',gene, '/',sppList(i));
       arrayfun(@(x) fastawrite(char(strcat(filepath ,' - ', getGI(x), '.fasta')), x),fastaCropped);                 
   end
end
end

