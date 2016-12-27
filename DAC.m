function [reconstructed_wave,Binary_code] = DAC (Binary_code, dynamic_range , Fs )
    disp('DAC process started');
    disp('length of binary code');
    disp(length(Binary_code));
    Binary_code = uint16(Binary_code);
    wave_int = bi2de (Binary_code); % get binary to decimal 
    disp('wave int length');
    disp(length(wave_int));
    reconstructed_wave =  udecode(wave_int, 13 ,dynamic_range);
    disp('length of reconstructed wave');
    disp(length(reconstructed_wave));
    time = 1:length(reconstructed_wave);
    time = time / Fs ;
    figure;
    title('reconstructed wave');
    plot(time,reconstructed_wave);
    sound(reconstructed_wave);
end 