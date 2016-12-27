function packets = interleaver(codedBlocks)
    [numberOfBlocks,codeLength] = size(codedBlocks);
    firstInterleavedBlock = [];
    chunks = [];
    packets = [];
    for i=1:numberOfBlocks
        [editedCode,editedLength] = adjustSize(codedBlocks(i,:),codeLength);
        blockSize = editedLength/8;
        firstInterleavedBlock  = [firstInterleavedBlock ; reshape(editedCode,[8,blockSize])'];
    end
    
    numberOfElements = numel(firstInterleavedBlock);
    secondInterleavedBlock = reshape(firstInterleavedBlock,[1,numberOfElements]);
    
    for i=1:4:numberOfElements
        chunks = [chunks ; secondInterleavedBlock(1,[i:i+3])];
    end
    
    packets = [packets generatePacket(chunks(1,:),zeros(1,4))];
    [numberOfChunks, chunkLength] = size(chunks);
    
    for i=2:2:numberOfChunks-1
        packets = [packets ; generatePacket(chunks(i,:),chunks(i+1,:))]
    end
end