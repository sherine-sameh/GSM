% first call 
close all ;
samples_in_block = 160;
bit_rate_per_sample = 13;
clc % clear line 
%get samples
[digital_signal,dynamic_range] = ADC('firstcall.wav');
%get blocks
blocks = getBlocks(digital_signal,samples_in_block,bit_rate_per_sample);
%chanel coding
channel_coded_blocks = ChannelCoding(blocks);
% test receive
channel_uncoded_blocks = ChannelReceive(channel_coded_blocks);
