clc
clear all
close all
%%
[uzorci, sampling_frequency] = audioread('.\zvuci\20.wav');
broj_uzoraka = size(uzorci, 1);

%%
%{
Predpostavlja se da je frekvencija uzorkovanja 48000 Hz pa u 20 ms ima 960
uzoraka. Prozor se pomièe za polovicu širine u svakom koraku. Ako zadnji
dio sugnala koji nestane u prozor se ignorira.
%}
slovo_a = [];
start = 1;
stop = 960;
w = hamming(960);
%%
for c = 0:480:broj_uzoraka-960
    signal = uzorci(start:stop) .* w;% signal pomnozen s prozorom
    
%     plot(uzorci(start:stop), 'b')
%     hold on
%     grid on
%     plot(signal, 'r')
%     hold off
%     
%     pause    
    
    [lpc_koef, greska] = lpc(uzorci(start:stop), 96);
    slovo_a = [slovo_a; lpc_koef];
    start = start + 480;
    stop = stop + 480;
end

%%
save('lpc\slovo_a.mat','slovo_a')
