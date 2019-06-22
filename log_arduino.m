% DATA COPY FROM EXEL SHEET
% subplot(2,1,1)
magnitude= abs(fft(data));
N = length(magnitude);
Fs = 10;
 freqHz = (0:1:N-1)*Fs/N;
plot (freqHz,magnitude)
xlabel('freq(Hz)')
ylabel('|Hd(w)|')
title('Raw Signal Spectrum')

% subplot (2,1,2)

% magnitude1= abs(fft(datafilter));
% N = length(magnitude1);
% freqHz1 = (0:1:N-1)*Fs/N;
% plot (freqHz1,magnitude1)
% title('Filtered Signal FFT alpha 0.6')
% ylabel('|Hd(w)|')
% xlabel('freq(Hz)')





