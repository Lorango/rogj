clc
clear all
close all

%%
load('test.mat', 'mat')
sampling_frequency = 48000;

%%
for i=1:33
    [h,w]=freqz(1, mat(i, :), 1000);
    
    w_x=w*sampling_frequency/(2*pi);
    
    plot(w,10*log10(abs(h)));
    grid on
%     xlim([0, 3000]) % kHz
    
    [pks,locs] = findpeaks(10*log10(abs(h)));
    text(w(locs), pks, num2str((1:numel(pks))'))
    
    pause
end
%%
