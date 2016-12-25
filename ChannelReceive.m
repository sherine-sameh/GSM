function [ uncoded_blocks ] = ChannelReceive( coded_blocks )
    dimensions = size(coded_blocks);
    uncoded_blocks = [];
    for i = 1 : dimensions(1);
        current_block = coded_blocks(i,:);
        % return after the convolution
        current_block = RevertConvolution(current_block);
        % create the original code and recover classes
        class1A = current_block(1,1:50);
        class1B = current_block(1,54:185); % class 1b 132 bits
        class2  = current_block(1,191:end); % class 2 the rest
        %length(class1B)
        %length(class2)
        original = [class1A class1B class2]; % get the original packet
        uncoded_blocks = [uncoded_blocks;original]; %append to blocks
    end

end

