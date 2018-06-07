%{
Ova skripta æe postepeno biti nadograðivana.
Od uèitavanja samo jednog fajla do uèitavanja cjelog foldera
ddsa
%}
clc
clear all
close all

%%

[samples, sampling_frequency] = audioread('sm04_wav/sm04010103201.wav');
%%
window_width = sampling_frequency * 20e-3
%%
starting_sample = snimka_start * 0.1e-6 * sampling_frequency
ending_sample = snimka_stop * 0.1e-6 * sampling_frequency
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
    % Find all "a" fonems in label file.
    if strcmp(label.Label(index_zvuk), 'a')
        disp(label.Start(index_zvuk))
        
    end
end
