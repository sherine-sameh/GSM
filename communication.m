clc;clear all;
codedBlocks=[1 2 3 4 5 6 7 8 9 10 11;12 13 14 15 16 17 18 19 20 21 22;23 24 25 26 27 28 29 30 31 32 33 ];
    
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
    