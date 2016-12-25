function [ uncoded_blocks] = ChannelReceive( coded_blocks )
    disp('channel decoding process');
    dimensions = size(coded_blocks);
    uncoded_blocks = [];
    for i = 1 : dimensions(1);
        current_block = coded_blocks(i,:);
        % return after the convolution
        % create the original code and recover classes
        % problem is size changed after convolution
        currentConvolved = current_block(1: 472);
        class2  = current_block(1,473:end); % class 2 the rest
        reverted_block = RevertConvolution(currentConvolved);% must be done to a portion
        class1A = reverted_block(1,1:50);
        class1B = reverted_block(1,54:185); % class 1b 132 bits
        %length(class1B)
        %length(class2)
        original = [class1A class1B class2];% get the original packet
        uncoded_blocks = [uncoded_blocks;original]; %append to blocks
    end
    disp('length before deconvolution');
    disp(length(currentConvolved));
    disp('length after deconvolution');
    disp(length(reverted_block));
    disp('total channel coded blocks');
    disp(length(original));
end

