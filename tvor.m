%{
Ova skripta �e postepeno biti nadogra�ivana.
Od u�itavanja samo jednog fajla do u�itavanja cjelog foldera
ddsa
%}
clc
clear all
close all

%% broj koeficijenata
disp('Pocetak analize. Estimacija potrebne memorije koju treba zauzeti.')
koef_n = 24;
skip = 0;

index_lpc_aeiou = ones(1, 10);
%% pred prolaz kroz fajlove da se odredi broj samoglsnika
counter_aeiou = zeros(1, 10);
file_list = dir('sm04_lab/*.lab');
for index_file = 1:size(file_list, 1)
    file_name_lab = strcat('sm04_lab/', file_list(index_file).name);
    
    % Load .lab file as table. 
    label = readtable(file_name_lab, 'FileType', 'text',....
        'Format', '%u%u%s',....
        'ReadVariableNames', false);

    % Rename proprerty/columns names in table.
    label.Properties.VariableNames = {'Start', 'Stop', 'Label'};

    for index_zvuk = 1:size(label, 1)
        % Comparing two strings. strcmp(s1, s2)
        % Find all [samoglasnik] fonems in label file.
        fonem = label.Label(index_zvuk);
        if strcmp(fonem, 'a')
            counter_aeiou(1) = counter_aeiou(1) + 1;
            
        elseif strcmp(fonem, 'e')
            counter_aeiou(2) = counter_aeiou(2) + 1;
            
        elseif strcmp(fonem, 'i')
            counter_aeiou(3) = counter_aeiou(3) + 1;
            
        elseif strcmp(fonem, 'o')
            counter_aeiou(4) = counter_aeiou(4) + 1;
            
        elseif strcmp(fonem, 'u')
            counter_aeiou(5) = counter_aeiou(5) + 1;
            
        elseif strcmp(fonem, 'a:')
            counter_aeiou(6) = counter_aeiou(6) + 1;
            
        elseif strcmp(fonem, 'e:')
            counter_aeiou(7) = counter_aeiou(7) + 1;
            
        elseif strcmp(fonem, 'i:')
            counter_aeiou(8) = counter_aeiou(8) + 1;
            
        elseif strcmp(fonem, 'o:')
            counter_aeiou(9) = counter_aeiou(9) + 1;
            
        elseif strcmp(fonem, 'u:')
            counter_aeiou(10) = counter_aeiou(10) + 1;
        end
    end
end

%%
%Uzimanje debele rezerve. Br�e nego naknadno pojedina�no dodavanje.
counter_aeiou = counter_aeiou * 10; 
slovo_a = zeros(counter_aeiou(1), koef_n + 1);
slovo_e = zeros(counter_aeiou(2), koef_n + 1);
slovo_i = zeros(counter_aeiou(3), koef_n + 1);
slovo_o = zeros(counter_aeiou(4), koef_n + 1);
slovo_u = zeros(counter_aeiou(5), koef_n + 1);

slovo_aa = zeros(counter_aeiou(6), koef_n + 1);
slovo_ee = zeros(counter_aeiou(7), koef_n + 1);
slovo_ii = zeros(counter_aeiou(8), koef_n + 1);
slovo_oo = zeros(counter_aeiou(9), koef_n + 1);
slovo_uu = zeros(counter_aeiou(10), koef_n + 1);
%%
disp('Proracun lpc-a.')
for index_file = 1:size(file_list, 1)
    %pokazatelj napredka
    if rem(index_file, 100) == 0
        fprintf('%d/%d\n', index_file, size(file_list, 1))
    end
    file_name_lab = strcat('sm04_lab/', file_list(index_file).name);
    file_name_wav = strrep(file_name_lab, 'lab', 'wav');
    
    % Load .lab file as table. 
    label = readtable(file_name_lab, 'FileType', 'text',....
        'Format', '%u%u%s',....
        'ReadVariableNames', false);

    % Rename proprerty/columns names in table.
    label.Properties.VariableNames = {'Start', 'Stop', 'Label'};
    
    % Ucitavanje odgovaraju�eg audio zapisa.
    [samples, sampling_frequency] = audioread(file_name_wav);

    % Faktor kojim se mno�e vremena zvukova kako bi se dobil broj uzorka.
    time_factor = sampling_frequency * 0.1e-6;
    window_width = sampling_frequency * 20e-3;
    window_half_width = window_width  / 2;
    
    % prozorska funkcija
    prozor = hamming(window_width);

    for index_zvuk = 1:size(label, 1)
        % Comparing two strings. strcmp(s1, s2)
        % Find all [samoglasnik] fonems in label file.
        fonem = label.Label(index_zvuk);
        if strcmp(fonem, 'a') || ...
                strcmp(fonem, 'e') || ...
                strcmp(fonem, 'i') || ...
                strcmp(fonem, 'o') || ...
                strcmp(fonem, 'u') || ...
                strcmp(fonem, 'a:') || ...
                strcmp(fonem, 'e:') || ...
                strcmp(fonem, 'i:') || ...
                strcmp(fonem, 'o:') || ...
                strcmp(fonem, 'u:')

            sample_start = label.Start(index_zvuk) * time_factor;
            sample_stop = label.Stop(index_zvuk)* time_factor;
            sample_delta = sample_stop - sample_start;

            % provjera dali je odsje�ak dovoljno dug za analizu. Ako nije
            % onda je odba�en.
            if sample_delta >= window_width
                djelj = idivide(sample_delta, window_half_width);
                ostatak = rem(sample_delta, window_half_width);
                broj_koraka = djelj - 2;
                
                for index_sample = 0:broj_koraka
                    start = sample_start + index_sample * window_half_width;
                    stop = start + window_width - 1;
                    [lpc_koef, greska] = lpc(samples(start:stop) .* prozor, koef_n);
                    
                    if strcmp(fonem, 'a')
                        slovo_a(index_lpc_aeiou(1), :) = lpc_koef;
                        index_lpc_aeiou(1) = index_lpc_aeiou(1) + 1;
                        
                    elseif strcmp(fonem, 'e')
                        slovo_e(index_lpc_aeiou(2), :) = lpc_koef;
                        index_lpc_aeiou(2) = index_lpc_aeiou(2) + 1;
                        
                    elseif strcmp(fonem, 'i')
                        slovo_i(index_lpc_aeiou(3), :) = lpc_koef;
                        index_lpc_aeiou(3) = index_lpc_aeiou(3) + 1;
                        
                    elseif strcmp(fonem, 'o')
                        slovo_o(index_lpc_aeiou(4), :) = lpc_koef;
                        index_lpc_aeiou(4) = index_lpc_aeiou(4) + 1;
                        
                    elseif strcmp(fonem, 'u')
                        slovo_u(index_lpc_aeiou(5), :) = lpc_koef;
                        index_lpc_aeiou(5) = index_lpc_aeiou(5) + 1;
                        
                    elseif strcmp(fonem, 'a:')
                        slovo_aa(index_lpc_aeiou(6), :) = lpc_koef;
                        index_lpc_aeiou(6) = index_lpc_aeiou(6) + 1;
                        
                    elseif strcmp(fonem, 'e:')
                        slovo_ee(index_lpc_aeiou(7), :) = lpc_koef;
                        index_lpc_aeiou(7) = index_lpc_aeiou(7) + 1;
                        
                    elseif strcmp(fonem, 'i:')
                        slovo_ii(index_lpc_aeiou(8), :) = lpc_koef;
                        index_lpc_aeiou(8) = index_lpc_aeiou(8) + 1;
                        
                    elseif strcmp(fonem, 'o:')
                        slovo_oo(index_lpc_aeiou(9), :) = lpc_koef;
                        index_lpc_aeiou(9) = index_lpc_aeiou(9) + 1;
                        
                    elseif strcmp(fonem, 'u:')
                        slovo_uu(index_lpc_aeiou(10), :) = lpc_koef;
                        index_lpc_aeiou(10) = index_lpc_aeiou(10) + 1;
                    end
                end

                if ostatak > 0
                    [lpc_koef, greska] = lpc(samples(start + ostatak:stop + ostatak) .* prozor, koef_n);
                    if strcmp(fonem, 'a')
                        slovo_a(index_lpc_aeiou(1), :) = lpc_koef;
                        index_lpc_aeiou(1) = index_lpc_aeiou(1) + 1;
                        
                    elseif strcmp(fonem, 'e')
                        slovo_e(index_lpc_aeiou(2), :) = lpc_koef;
                        index_lpc_aeiou(2) = index_lpc_aeiou(2) + 1;
                        
                    elseif strcmp(fonem, 'i')
                        slovo_i(index_lpc_aeiou(3), :) = lpc_koef;
                        index_lpc_aeiou(3) = index_lpc_aeiou(3) + 1;
                        
                    elseif strcmp(fonem, 'o')
                        slovo_o(index_lpc_aeiou(4), :) = lpc_koef;
                        index_lpc_aeiou(4) = index_lpc_aeiou(4) + 1;
                        
                    elseif strcmp(fonem, 'u')
                        slovo_u(index_lpc_aeiou(5), :) = lpc_koef;
                        index_lpc_aeiou(5) = index_lpc_aeiou(5) + 1;
                        
                    elseif strcmp(fonem, 'a:')
                        slovo_aa(index_lpc_aeiou(6), :) = lpc_koef;
                        index_lpc_aeiou(6) = index_lpc_aeiou(6) + 1;
                        
                    elseif strcmp(fonem, 'e:')
                        slovo_ee(index_lpc_aeiou(7), :) = lpc_koef;
                        index_lpc_aeiou(7) = index_lpc_aeiou(7) + 1;
                        
                    elseif strcmp(fonem, 'i:')
                        slovo_ii(index_lpc_aeiou(8), :) = lpc_koef;
                        index_lpc_aeiou(8) = index_lpc_aeiou(8) + 1;
                        
                    elseif strcmp(fonem, 'o:')
                        slovo_oo(index_lpc_aeiou(9), :) = lpc_koef;
                        index_lpc_aeiou(9) = index_lpc_aeiou(9) + 1;
                        
                    elseif strcmp(fonem, 'u:')
                        slovo_uu(index_lpc_aeiou(10), :) = lpc_koef;
                        index_lpc_aeiou(10) = index_lpc_aeiou(10) + 1;
                    end
                end
            else
                skip = skip + 1;
            end
        end
    end
end
disp('Broj presko�enih samoglasnika jer su prekratki')
disp(skip)
disp('Kraj proracuna. Spreman rezultate.')

%% Izrezivanje neiskori�tenoga dijela arraya
slovo_a = slovo_a(1:index_lpc_aeiou(1) - 1, :);
slovo_e = slovo_e(1:index_lpc_aeiou(2) - 1, :);
slovo_i = slovo_i(1:index_lpc_aeiou(3) - 1, :);
slovo_o = slovo_o(1:index_lpc_aeiou(4) - 1, :);
slovo_u = slovo_u(1:index_lpc_aeiou(5) - 1, :);

slovo_aa = slovo_aa(1:index_lpc_aeiou(6) - 1, :);
slovo_ee = slovo_ee(1:index_lpc_aeiou(7) - 1, :);
slovo_ii = slovo_ii(1:index_lpc_aeiou(8) - 1, :);
slovo_oo = slovo_oo(1:index_lpc_aeiou(9) - 1, :);
slovo_uu = slovo_uu(1:index_lpc_aeiou(10) - 1, :);

%% Spremanje rezultata u datoteke

save('lpc\lpc_pro.mat', 'slovo_a', 'slovo_e', 'slovo_i', 'slovo_o', 'slovo_u', 'slovo_aa', 'slovo_ee', 'slovo_ii', 'slovo_oo', 'slovo_uu', 'sampling_frequency')
disp('Podatci pohranjeni. Gotovo!')

