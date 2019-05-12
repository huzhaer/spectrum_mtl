function [sigpower, hz] = powerspec(time, samplerate, signal)

npnts = length(time);
% vector of frequencies
hz = linspace(0, samplerate/2,floor(npnts/ 2) +1);

% compute signal power
sigpower = abs(fft(signal)/npnts).^2;

end