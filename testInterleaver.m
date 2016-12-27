
codedBlocks=[1 2 3 4 5 6 7 8 9 10 11;12 13 14 15 16 17 18 19 20 21 22];
    
    [blocksNumber,codeLength] = size(codedBlocks);
    interleaved = []; 
    chunks = [];
   
    for i=1:blocksNumber
        %[CurrentCode,length] = adjustSize(code(i,:),codeLength);
        blockSize = length/8;
        interleavedBlock  = reshape(CurrentCode,[8,blockSize])';
        for j=1:8
            interleaved = [interleaved interleavedBlock(:,j)'];
        end
    end
    [interleavedRow interleavedCol] = size(interleaved);
    chunkSize = interleavedCol/8;
    %chunks = interleaved(1,[1:4]);
    chunks = reshape(interleaved,[8,chunkSize]);
    interleaved
    packetSize = 50;
    packets = [];
    chunks
    %packets = generatePacket(chunk1,chunk1);
    %for j=1:2:chunkSize
       % x=[chunks(:,j)' chunks(:,j+1)']
             %packet = generatePacket(chunks(:,j)',chunks(:,j+1)');
             %packets = [packets packet];
    %end