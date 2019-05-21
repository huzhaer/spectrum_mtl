function filteredSig = highpassFt(samplerate, edge, signal)

transwidth = .15;

filtershape = [0 0 1 1];
filterfrex = [0 edge edge+edge*transwidth samplerate/2] / (samplerate/2);
filterorder = 40 * edge;

filterkernal = firls(filterorder, filterfrex, filtershape);

filteredSig = filtfilt(filterkernal, 1,signal);
end