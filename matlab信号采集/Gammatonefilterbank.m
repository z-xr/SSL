[audioIn,fs] = audioread( 'music.wav' );

%构建gammatone滤波器组，采样率为22400，FrequencyRange: [50 8000]， NumFilters: 32
gammaFiltBank = gammatoneFilterBank( 'SampleRate' ,fs);
%输入滤波器组，输出32通道的数据
audioOut = gammaFiltBank(audioIn);
[N,numChannels] = size(audioOut);

func(29,audioOut,fs);

function[]=func(aisle,audioOut,fs)
array=audioOut(:,aisle);
sound(array,fs);

fft_signal = fft(array);
mag = abs(fft_signal);
f = (0:1:length(fft_signal)-1)'*fs/length(fft_signal);
n=(0:1:length(array)-1)'/fs;

subplot(411);
plot(f,mag);
xlabel("频率/HZ");
ylabel("幅值");
title("幅频谱图");
grid on;

subplot(412);
plot(n,array);
xlabel("时间/S");
ylabel("幅值");
title("时域波形");
grid on;
end