clc
clear all
close all
%%
[uzorci, sampling_frequency] = audioread('.\zvuci\20.wav');
broj_uzoraka = size(uzorci, 1);
%%

%%
%{
Predpostavlja se da je frekvencija uzorkovanja 48000 Hz pa u 20 ms ima 960
uzoraka. Prozor se pomièe za polovicu širine u svakom koraku. Ako zadnji
dio sugnala koji nestane u prozor se ignorira.
%}
mat = []
start = 1;
stop = 960;
for c = 0:480:broj_uzoraka-960
    disp(c)
    [lpc_koef, greska] = lpc(uzorci(start:stop), 96);
    mat = [mat; lpc_koef];
    start = start + 480;
    stop = stop + 480;
end

%%
save('test.mat','mat')
