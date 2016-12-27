function packet = generatePacket(chunk1,chunk2)
    tail = [0 0 0];
    flag = 0;
    trainingSet = [1 1 1 1 1 0 0 1 1 0 1 0 1 0 0 0 0 0 1 1 0 0 1 0 1 0];
    guardBand = zeros(1,8);
    packet = [tail chunk1 flag trainingSet flag chunk2 tail guardBand];
    %packet = [chunk1 flag chunk2];
end