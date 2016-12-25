function [ channel_coded_blocks] = ChannelCoding( blocks_array )
    % it is in 2 steps
    disp('channel coding process');
    [rows cols] = size(blocks_array);
    channel_coded_blocks = [];
    for i = 1 : rows 
        current_block = blocks_array(i,:);
    % here you have to LPC each block
        
    % get CRC of first 50 bits
       class1A = current_block(1,1:50); % class 1a 50 bits
       class1B = current_block(1,51:182); % class 1b 132 bits
       class2  = current_block(1,183:end); % class 2 the rest
       parity = current_block(1,1:50); % select first 50 bit
       toBeConvolved = [class1A parity class1B 0 0 0 0]; % class 1A and the parity and class 1b and 4 bits tail
       result = ConvolutionCoder(toBeConvolved); % add to convolution
       output_block = [result class2]; % append class 2 
       channel_coded_blocks = [channel_coded_blocks;output_block]; %append to resulting blocks
    end
    disp('length before convolution');
    disp(length(toBeConvolved));
    disp('length after convolution');
    disp(length(result));
    disp('total channel coded blocks');
    disp(length(channel_coded_blocks));
end

