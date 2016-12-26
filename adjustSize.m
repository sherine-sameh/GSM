function [adjustedBlock,codeLength] = adjustSize(codedBlock,codeLength)
        adjustedBlock = codedBlock;
        while(mod(codeLength,8) ~= 0)
            adjustedBlock(1,codeLength+1)= 0;
            codeLength=codeLength+1;
        end   
end