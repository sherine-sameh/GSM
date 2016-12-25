%unfinished code
function [code1 , code2] = deinterleaver(packets)
    for i = 1:8
         chunk1 = packets([4:61],i)';
         chunk2 = packets([89:146],i)';
         code1(i,:) = chunk1;
         code2(i,:) = chunk2;
    end    
end
