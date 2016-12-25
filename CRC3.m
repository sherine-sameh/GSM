function [ reg ] = CRC3( block )
    poly = [1 0 1 1]; % the coefficients = x3 + x + 1
    block = [block 0 0 0]; % cat 3 bits at the final registers
    for i = 1 : length(block) - 3
        if(block(i) == 1)
            for j = 1 : length(poly)
                block(i+j-1) = xor(block(i+j-1),poly(j)); % using wikipidea definition for it
            end
        end
    end
reg = block(end - 2 : end);
end

