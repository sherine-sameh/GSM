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
[packets,chunckSize,realSize] = interleaver(channel_coded_blocks);
    
% modulation and demodulation procedure
%%%%% for tracing %%%%%%%%%%%%%%
snr = 0;
%[modulatedPackets, demodulatedPackets, Error] = GMSKModulation(packets,snr);  

% de interleaving process
% i need real size because padding will add big noise to every bit in the
% next audio it can be sent in real implementation
deInterleavedPackets = deinterleaver(packets,chunckSize,realSize);
% test receive the de modulates packets
channel_uncoded_blocks = ChannelReceive(deInterleavedPackets);
% restoreBlocks
audio_received = restoreBlocks(channel_uncoded_blocks);

% apply DAC to the data
[retrieved_sound,Binary_code] = DAC(audio_received,dynamic_range,Fs);

