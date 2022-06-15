function spectrum_freq = fourier_frequencies(SampleRate, N)
    %% Return column vector of positive and negative frequencies for DFT
    % SampleRate - acquistion rate in Hz
    % N - Number of data points

    f1 = SampleRate / N;    % spacing or RBW frequency

    % assignment of frequency, recall that spectrum_freq(1) is zero
    % frequency. i.e. DC component
    spectrum_freq = (((1:N) - 1) * f1).';   % column vector

    NyquistFreq = (N / 2) * f1; % index of Nyquist frequency i.e. reflection point

    % Let's take reflection into account
    spectrum_freq(spectrum_freq > NyquistFreq) = -N * f1 + ...
                    spectrum_freq(spectrum_freq > NyquistFreq);
end