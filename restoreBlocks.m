function [ reshaped_blocks ] = restoreBlocks( blocks )
    if(mod(size(blocks),13) ~= 0)
        blocks = [blocks zeros(1,13-mod(size(blocks),13))];
    end
    reshaped_blocks = reshape(blocks,[],13);
end

