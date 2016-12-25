function packets = interleaver()
    
    ipBits1 = randi([0 1],[456,1]); %need to be replaced by the output of the previous block
    delay(0.02); %Wait 20 msec for the next packet
    ipBits2 = randi([0 1],[456,1]); %need to be replaced by the output of the previous block
    
    interleavedBlock1  = reshape(ipBits1,[8,57])';
    interleavedBlock2  = reshape(ipBits2,[8,57])';
    packets = zeros(8,151);
    for i=1:8
       packet = generatePacket(interleavedBlock1(:,i)',interleavedBlock2(:,i)');
       packets(i,:) = packet;
    end
end