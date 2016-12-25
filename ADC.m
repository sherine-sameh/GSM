function [binary_signal,dynamic_range] = ADC(filename)
    fs=8000;
    [digital_audio_pure,Fs] = audioread(filename);
    figure;
    subplot(3,1,1);
    time = 0:(length(digital_audio_pure)-1); 
    time = time / Fs ;
    disp('length of array before sampling');
    disp(length(time));
    plot(time,digital_audio_pure);
    digital_audio_sampled = resample(digital_audio_pure,fs,Fs); % resample
    subplot(3,1,2);
    time = 0:(length(digital_audio_sampled)-1);
    time = time / fs ;
    plot(time,digital_audio_sampled);
    disp('length of array after sampling');
    disp(length(time));
    disp('rational signal is ');
    disp(fs/Fs);
    dynamic_range = 1.2; % calculated from minimum to maximum
    encoded_signal = uencode(digital_audio_sampled, 13 , dynamic_range);
    subplot(3,1,3);
    plot(time,encoded_signal,'.');
    binary_signal = de2bi(encoded_signal,13);
 end