function reconstructed_wave = DAC (Binary_code )
wave_int = bi2de (Binary_code );
dynamic_range = 1.2;
reconstructed_wave =  udecode(wave_int, 13 ,dynamic_range);
end 