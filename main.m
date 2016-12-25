% first call 
close all ;
samples_in_block = 160;
bit_rate_per_sample = 13;
clc % clear line 
% get samples
[digital_signal,dynamic_range] = ADC('firstcall.wav');
blocks = getBlocks(digital_signal,samples_in_block,bit_rate_per_sample);
