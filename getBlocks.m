% this function will get the blocks out of the digital signal
function [ blocks_array ] = getBlocks( digital_audio , samples,bit_rate )
    disp('digital audio length');
    disp(length(digital_audio));
    offset_zeros = zeros(samples - mod(length(digital_audio),samples),13);
    blocks_array = reshape([digital_audio;offset_zeros],[],samples*bit_rate);
end

