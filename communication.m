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
    [blockSize , numberOfBlocks] = size(firstInterleavedBlock)
    secondInterleavedBlock = reshape(firstInterleavedBlock,[1,numberOfElements])
    step = blockSize/2;
    for i=1:step:numberOfElements
        chunks = [chunks ; secondInterleavedBlock(1,[i:i+step-1])];
    end
    chunks
%     packets = [packets generatePacket(chunks(1,:),zeros(1,step))];
%     [numberOfChunks, chunkLength] = size(chunks);
%     
%     for i=2:2:numberOfChunks-1
%         packets = [packets ; generatePacket(chunks(i,:),chunks(i+1,:))]
%     end
%     
%     [numberOfPackets, packetLength] = size(packets);
%     chunk1 = [];
%     chunk2 = [];
%     j=2;
%     for i = 1:numberOfPackets
%          chunk1 = [chunk1 ; packets(i,[4:7])]
%          chunk2 = [chunk2 ; packets(j,[])]
%          j = j+1;
%     end    