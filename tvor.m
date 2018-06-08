%{
Ova skripta æe postepeno biti nadograðivana.
Od uèitavanja samo jednog fajla do uèitavanja cjelog foldera
ddsa
%}
clc
clear all
close all

%%
slovo_a = [];
slovo_e = [];
slovo_i = [];
slovo_o = [];
slovo_u = [];

skip = 0;
%%
%%
file_list = dir('sm04_lab/*.lab');
%%

for index_file = 360:360%size(file_list, 1)
    file_name_lab = strcat('sm04_lab/', file_list(index_file).name)
    file_name_wav = strrep(file_name_lab, 'lab', 'wav');
    
    % Load .lab file as table. 
    label = readtable(file_name_lab, 'FileType', 'text',....
        'Format', '%u%u%s',....
        'ReadVariableNames', false);

    % Rename proprerty/columns names in table.
    label.Properties.VariableNames = {'Start', 'Stop', 'Label'};
    
    [samples, sampling_frequency] = audioread(file_name_wav);

    % Faktor kojim se množe vremena zvukova kako bi se dobil broj uzorka.
    time_factor = sampling_frequency * 0.1e-6;
    window_width = sampling_frequency * 20e-3;
    window_half_width = window_width  / 2;

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

            if sample_delta >= window_width
                djelj = idivide(sample_delta, window_half_width);
                ostatak = rem(sample_delta, window_half_width);
                broj_koraka = djelj - 2;
                for index_sample = 0:broj_koraka
                    start = sample_start + index_sample*window_half_width
                    stop = sample_stop + index_sample*window_half_width
                    [lpc_koef, greska] = lpc(samples(start:stop), 96);
                    if strcmp(fonem, 'a')
                        slovo_a = [slovo_a; lpc_koef];
                    elseif strcmp(fonem, 'e')
                        slovo_e = [slovo_e; lpc_koef];
                    elseif strcmp(fonem, 'i')
                        slovo_i = [slovo_i; lpc_koef];
                    elseif strcmp(fonem, 'o')
                        slovo_o = [slovo_o; lpc_koef];
                    elseif strcmp(fonem, 'u')
                        slovo_u = [slovo_u; lpc_koef];
                    end
                end

                if ostatak > 0
                    [lpc_koef, greska] = lpc(samples(start + ostatak:stop + ostatak), 96);
                    if strcmp(fonem, 'a')
                        slovo_a = [slovo_a; lpc_koef];
                    elseif strcmp(fonem, 'e')
                        slovo_e = [slovo_e; lpc_koef];
                    elseif strcmp(fonem, 'i')
                        slovo_i = [slovo_i; lpc_koef];
                    elseif strcmp(fonem, 'o')
                        slovo_o = [slovo_o; lpc_koef];
                    elseif strcmp(fonem, 'u')
                        slovo_u = [slovo_u; lpc_koef];
                    end
                end
            else
                skip = skip + 1;
            end
        end
    end
end
disp('Broj preskoèenih samoglasnika jer su prekratki')
disp(skip)
