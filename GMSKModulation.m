function [ modulatedPackets, demodulatedPackets, modulationError ] = GMSKModulation(packets,SNR)
    [row, col] =size(packets);
    BT = 0.3;
    hMod = comm.GMSKModulator('BitInput', true, 'InitialPhaseOffset', pi/4, 'BandwidthTimeProduct', BT);
    hAWGN = comm.AWGNChannel('NoiseMethod', 'Signal to noise ratio (SNR)','SNR',SNR);
    hDemod = comm.GMSKDemodulator('BitOutput', true, 'InitialPhaseOffset', pi/4, 'BandwidthTimeProduct', BT);
    hError = comm.ErrorRate('ReceiveDelay', hDemod.TracebackDepth);
    modulatedPackets = [];
    demodulatedPackets = [];
    modulationError = [];
    for i = 1 : row
        modulatedSignal = step(hMod, packets(i,:)');
        modulatedPackets = [modulatedPackets;modulatedSignal];
        noisySignal = step(hAWGN, modulatedSignal);
        demodulatedSignal = step(hDemod, noisySignal);
        demodulatedPackets = [demodulatedPackets;demodulatedSignal'];
        error = step(hError, packets(i, :)', demodulatedSignal);
        modulationError = [modulationError error];
    end
end