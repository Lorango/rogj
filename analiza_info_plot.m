clc
clear all
close all

%%
load('test.mat', 'mat')
sampling_frequency = 48000;

%%
f_1 = [];
f_2 = [];
f_3 = [];
for i=1:33
%{
Racuna formatne frekvecije
%}
    a = mat(i, :); % nazivnik - lpc koeficijenti
    [h,w]=freqz(1, a, 1000); % frekvencijski odziv filtra
    
    r=roots(a); % find roots of polynomial a
    r=r(imag(r)>0.01); % only look for roots >0Hz up to fs/2
    
    ffreq=sort(atan2(imag(r),real(r))*sampling_frequency/(2*pi)); % convert to Hz and sort
    f_1 = [f_1; ffreq(1)];
    f_2 = [f_2; ffreq(2)];
    f_3 = [f_3; ffreq(3)];
    
%{
Ispisuje izračunate formantne frekvencije.
%}
    fprintf('Prozor %d\n', i);
    fprintf('Formant 1 Frequency %.1f\n', f_1(i));
    fprintf('Formant 2 Frequency %.1f\n', f_2(i));
    fprintf('Formant 3 Frequency %.1f\n', f_3(i));

%{
Plota korak po korak frekvencijske odzive i prikazuje sve formante koje 
more nac.
%}
    w_x=w*sampling_frequency/(2*pi);
    
    plot(w_x,10*log10(abs(h)));
    grid on
    xlim([0, 8000]) % Hz
    
    [pks,locs] = findpeaks(10*log10(abs(h)));
    text(w_x(locs), pks, num2str((1:numel(pks))'))
    
    pause
end
%% plotanje formanti
figure
hold on
grid on
scatter(f_1, f_2)
scatter(f_1, f_3)
scatter(f_2, f_3)
xlim([0, 1400]) % Hz
ylim([0, 1400]) % Hz
legend('x: f_1, y: f_2', 'x: f_1, y: f_3', 'x: f_2, y: f_3')


