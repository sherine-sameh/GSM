function [code] = deinterleaver(packets)
    [numberOfPackets, packetLength] = size(packets);
    chunk1 = [];
    chunk2 = [];
    j=2;
    for i = 1:numberOfPackets
         chunk1 = [chunk1 ; packets([4:61],i)'];
         chunk2 = [chunk2 ; packets([89:146],j)'];
         j = j+1;
    end    
end
