function check = checkStr(header, str)
%CHECKSTR Summary of this function goes here
%   Detailed explanation goes here
check=false;
if contains(header, str)
    check=true;
end
end


