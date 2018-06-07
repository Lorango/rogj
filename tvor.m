%{
Ova skripta �e postepeno biti nadogra�ivana.
Od u�itavanja samo jednog fajla do u�itavanja cjelog foldera
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

label.Properties.VariableNames = {'Start', 'Stop', 'Label'};
