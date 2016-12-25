% first call 

% Transmit
close all;
Fs = 8000;
samples_in_block = 160;
bit_rate_per_sample = 13;
clc % clear line 
%get samples 
[digital_signal,dynamic_range] = ADC('firstcall.wav');
%get blocks 20 ms blocks return array of blocks in binary of course
blocks = getBlocks(digital_signal,samples_in_block,bit_rate_per_sample);
%chanel coding
[channel_coded_blocks] = ChannelCoding(blocks);
% interleaving process
     %   // sherine here
    
% GMSK guassian minimum shift keying % modulation
    % // hassan here
    
    
    
% reverting process

% GMSK demodulation phase 
    % // hassan here

% de interleaving process
    % // sherine here

% test receive
channel_uncoded_blocks = ChannelReceive(channel_coded_blocks);
% restoreBlocks
audio_received = restoreBlocks(channel_uncoded_blocks);

% apply DAC to the data
[retrieved_sound decimated_value] = DAC(audio_received,dynamic_range,Fs);

