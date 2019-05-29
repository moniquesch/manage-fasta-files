function getWebImg(sppList)
    cellList1 = textscan(fopen('sppList.txt','r'),'%s');
    sppList= string(strrep(cellList1{1},'_',' '));
    mkdir('images');
    arrayfun(@(x) saveImg(x), sppList)

end

function saveImg(scientific_name)
  try
    display(scientific_name);
    genus = extractBefore(scientific_name, ' ');
    sp = extractAfter(scientific_name, ' ');
    web_page = webread(strcat('https://www.antweb.org/description.do?genus=', genus, '&', 'species=', sp'));
    start = regexp(web_page, 'meta property="og:image" content="');
    txt1 = web_page(start:end);
    final = regexp(txt1, '/>');
    txt2 = txt1(1:final(1));
    url_img=string(extractBetween(txt2,'content="', '"'));
    websave(strcat('images/', scientific_name, '.jpg'), url_img);
  catch
      display(scientific_name);
      fprintf('No image for this species.');
  end   
end