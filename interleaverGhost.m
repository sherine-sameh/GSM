function [packets,chunkSize,realSize]= interleaverGhost(codedBlocks)
    % each row here represent a block
    disp('start interleaver process');
    [blocksNumber,codeLength] = size(codedBlocks);
    realSize = codeLength;
    for i=1:blocksNumber 
        % for each block 
        % we assumed here because no speech coding we will take the block
        % with the resulting length for it 
        [CurrentCode,codelength] = adjustSize(codedBlocks(i,:),codeLength);
        % adjust to be divisable by 8
        chunkSize = codelength/8;
        packetSize = chunkSize*2 + 42;
        interleavedBlock  = reshape(CurrentCode,[8,chunkSize])';
        % only happens once then it will work normaly
        % initialization
        if(i == 1)
            PreviousCode = interleavedBlock;
            packets = zeros(blocksNumber*8,packetSize);
        end
        
        % get packetSize
         % 3 , 1 , 26 , 1 , 3 , 8 
        
        % for each chuck generate packet
        for j=1:8
            packet = generatePacket(interleavedBlock(:,j)',PreviousCode(:,j)');
            packets(i+j-1,:) = packet;
        end
        PreviousCode = interleavedBlock;
    end
    disp('end interleaver process')
end