%{
Ova skripta æe postepeno biti nadograðivana.
Od uèitavanja samo jednog fajla do uèitavanja cjelog foldera
ddsa
%}
clc
clear all
close all

%%
M = containers.Map(keySet,valueSet)
%%

[samples, sampling_frequency] = audioread('sm04_wav/sm04010103201.wav');
%%
% Faktor kojim se množe vremena zvukova kako bi se dobil broj uzorka.
time_factor = sampling_frequency * 0.1e-6
window_width = sampling_frequency * 20e-3
window_half_width = window_width  / 2
%%

%%

file_name = 'sm04_lab/sm04010103201.lab';
% Load .lab file as table. 
label = readtable(file_name, 'FileType', 'text',....
    'Format', '%u%u%s',....
    'ReadVariableNames', false);

% Rename proprerty/columns names in table.
label.Properties.VariableNames = {'Start', 'Stop', 'Label'};

for index_zvuk = 1:size(label, 1)
    % Comparing two strings. strcmp(s1, s2)
    % Find all [samoglasnik] fonems in label file.
    fonem = strrep(label.Label(index_zvuk), ':', '');
    if strcmp(fonem, 'a') || ...
            strcmp(fonem, 'e') || ...
            strcmp(fonem, 'i') || ...
            strcmp(fonem, 'o') || ...
            strcmp(fonem, 'u')
        
        sample_start = label.Start(index_zvuk) * time_factor;
        sample_stop = label.Stop(index_zvuk)* time_factor;
        sample_delta = sample_stop - sample_start;
        
%         disp(label.Label(index_zvuk));
%         disp(fonem);
        
        if sample_delta >= window_width
            djelj = idivide(sample_delta - window_width, window_half_width)
            ostatak = rem(sample_delta - window_width, window_half_width)
            for index_sample = 1:1+djelj
                [lpc_koef, greska] = lpc(samples(sample_start:sample_stop), 96);
                slovo_a = [slovo_a; lpc_koef];
            end
            if ostatak > 0
                [lpc_koef, greska] = lpc(samples(sample_start + ostatak:sample_stop + ostatak), 96);
            end
        else
            disp('skip')
        end
          % 
        
        if strcmp(fonem, 'a')
            
        end
    end
end
