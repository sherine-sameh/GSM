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
    [blockSize , numberOfBlocks] = size(firstInterleavedBlock);
    secondInterleavedBlock = reshape(firstInterleavedBlock,[1,numberOfElements])
    
    step = blockSize/2;
    for i=1:step:numberOfElements
        chunks = [chunks ; secondInterleavedBlock(1,[i:i+step-1])];
    end
    
    packets = [packets generatePacket(chunks(1,:),zeros(1,step))];
    [numberOfChunks, chunkLength] = size(chunks);
    
    for i=2:2:numberOfChunks-1
        packets = [packets ; generatePacket(chunks(i,:),chunks(i+1,:))]
    end
  
end