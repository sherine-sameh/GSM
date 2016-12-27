function [adjustedBlock,codeLength] = adjustSize(codedBlock,codeLength)
    if(mod(codeLength,8) ~= 0)
        adjustedBlock = [codedBlock zeros(1,8 - mod(codeLength,8))] ;
    codeLength = codeLength + 8 - mod(codeLength,8);
    end
end