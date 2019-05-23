function check = checkStr(header, str)
%checkStr Checks if the header contains a string. 
%   check = checkStr(header, str) is a Boolean variable. If the header contains the string,
%   check=true. If doesn't, check=false.
check=false;
if contains(header, str)
    check=true;
end
end


