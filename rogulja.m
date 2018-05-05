clc
clear all
close all
%%
[uzorci, sampling_frequency] = audioread('.\zvuci\20.wav');
broj_uzoraka = size(uzorci, 1)
t = linspace(0, broj_uzoraka/sampling_frequency, broj_uzoraka);

%%
plot(t, uzorci)
%% poštinani spektar signala
S = fft(uzorci(4800:4800+960));
% S = fft(uzorci);
AS = abs(S)/size(S, 1);

w = linspace(0, sampling_frequency, size(S, 1));
%% plot
figure
plot(w, 20*log(AS))
xlim([0, 2400]) % "semplovi"
grid on

figure
plot(w, AS)
xlim([0, 2400])
grid on

%%
[a,g] = lpc(uzorci, 96);

b=1;
[h,w]=freqz(b,a,1000);
%% plot
w_x=w*sampling_frequency/(2*pi);  % w is assigned as formant frequency
figure
%plot(w_x,(abs(h)));
plot(w_x,10*log10(abs(h)));
grid on
xlim([0, 3000]) % kHz
%% formanti - špic rebra
[pks,locs] = findpeaks(10*log10(abs(h)));

text(w_x(locs), pks, num2str((1:numel(pks))'))
%% korjeni bay root
% find frequencies by root-solving
a = mat(33,:);

r=roots(a);                  % find roots of polynomial a

r=r(imag(r)>0.01);           % only look for roots >0Hz up to fs/2

ffreq=sort(atan2(imag(r),real(r))*sampling_frequency/(2*pi));

                             % convert to Hz and sort

for i=1:length(ffreq)

    fprintf('Formant %d Frequency %.1f\n',i,ffreq(i));

end