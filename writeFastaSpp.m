function writeFastaSpp(fasta, gene, sppList)
%WRITEFASTASPP Summary of this function goes here
%   Detailed explanation goes here
notfoundspp=[];
for i = 1:length(sppList)
   sppCheck = arrayfun(@(x) checkStr(x.Header, char(sppList(i,1))),fasta);
   fastaCropped = fasta(sppCheck);
   if ~isempty(fastaCropped)
       %filepath= strcat('output/',gene, '/',char(sppList(i)));
       %arrayfun(@(x) fastawrite(strcat(filepath ,' - ', char(getGI(x)), '.fasta'), x),fastaCropped);                 
   else
      notfoundspp=[notfoundspp; string(sppList(i))];
   end
end
T = table(notfoundspp);
writetable(T,'notfound.txt');
end

