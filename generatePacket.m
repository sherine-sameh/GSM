function packet = generatePacket(chunk1,chunk2)
    tail = [ 0 0 0 ];
    flag = 0;
    trainingSet = randi([0 1],[26,1])';
    guardBand = [0 0 0];
    packet = [tail chunk1 flag trainingSet flag chunk2 tail guardBand];
end