function packets = interleaver(codedBlocks)
    [blocksNumber,codeLength] = size(codedBlocks);
    for i=1:blocksNumber 
        [CurrentCode,length] = adjustSize(codedBlocks(i,:),codeLength);
        if(i>1)
            [PreviousCode,length] = adjustSize(codedBlocks(i-1,:),codeLength);
        else
            PreviousCode = CurrentCode;
        end
        
        chunkSize = length/8;
        
        interleavedBlock1  = reshape(CurrentCode,[8,chunkSize])';
        interleavedBlock2  = reshape(PreviousCode,[8,chunkSize])';
        
        packetSize = chunkSize*2 + 42;
        packets = zeros(8,packetSize);
        totalPackets = zeros(blocksNumber*8,packetSize);
        
        for j=1:8
            packet = generatePacket(interleavedBlock1(:,j)',interleavedBlock2(:,j)');
            packets(j,:) = packet;
        end
       
    end
end