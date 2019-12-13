%this is an auxiliar function. To call this function use:
%check = arrayfun(@(x) checkStr(x.Header, listOfTerms),fastaStruct);
function check = checkStr(header, str)
check=false;
if contains(header, str)
    check=true;
end
end


