function filteredSig = lowpassFt(samplerate, edge, signal)

transwidth = .15;

filtershape = [1 1 0 0];
filterfrex = [ samplerate/2 edge+edge*transwidth edge 0  ] / (samplerate/2);
filterorder = 40 * edge;

filterkernal = firls(filterorder, filterfrex, filtershape);

filteredSig = filtfilt(filterkernal, 1,signal);
end