clc
clear all
close all

%%
f_max = 3000;
f = linspace(0, f_max, 4*f_max);

aeiou = {f_aa, f_ee, f_ii, f_oo, f_uu};
BW = [20, 40, 40;
      20, 40, 40;
      20, 50, 40;
      20, 40, 40;
      20, 40, 40];
  
%% Plotanje funnkcija gustoæe distribucije vjerojatnosti
for i = 1:3
    figure
    hold on
    for j = 1:5
        samoglasnik = cell2mat(aeiou(j));
        pd = fitdist(samoglasnik(:, i), 'Kernel','Kernel','epanechnikov','BandWidth', BW(j, i));
        y = pdf(pd, f);
        plot(f, y)
    end
    
    grid on
    legend('a', 'e', 'i', 'o', 'u')
end

%% asdasd
gustoce = zeros(5, 3);
gustoce_2 = zeros(5, 1);
%% generiranje svih gustoæa vjerojatnosti
for i = 1:5
    %% za svaki samoglasnik
    samoglasnik = cell2mat(aeiou(i));
    for j = 1:3
        %% za svaki formant
        pdd(i, j) = fitdist(samoglasnik(:, j), 'Kernel','Kernel','epanechnikov','BandWidth', BW(i, j));
    end
end


%% analiza slova
rez = zeros(5, 5);

for i = 1:5                             % za svako slovo*
    samoglasnik = cell2mat(aeiou(i));
    disp(i);
    for j = 1:200%size(samoglasnik, 1)      % za svaki uzorak samoglasnika
        gustoca_rez = zeros(5, 1);
        if rem(j, 100) == 0    % pokazatelj napredka
            disp(j)
        end
  
        for k = 1:5                     % za svaki samoglasnik**
            gustoca_slova = 1;
            for m = 1:3                 % za svaki formant
                gustoca_formanta = pdf(pdd(k, m), samoglasnik(j, m));
                gustoca_slova = gustoca_slova * gustoca_formanta;
            end
            gustoca_rez(k) = gustoca_slova;
        end
        [M, I] = max(gustoca_rez);
        rez(i, I) = rez(i, I) + 1;
    end
end

%% analiza rezultata

rez_p = zeros(5, 5);
for i = 1:5
    suma = sum(rez(i, :));
    rez_p(i, :) = rez(i, :) ./ suma;
end



%%
f = 3000;
x = linspace(0, f, 10*f);
pd = fitdist(f_aa(:, 3), 'Kernel','Kernel','epanechnikov','BandWidth', 20);
y = pdf(pd, x);
plot(x, y)
hold on
%%
pd = fitdist(f_ee(:, 3), 'Kernel','Kernel','epanechnikov','BandWidth', 20);
y = pdf(pd, x);
plot(x, y)
%%
pd = fitdist(f_ii(:, 3), 'Kernel','Kernel','epanechnikov','BandWidth', 20);
y = pdf(pd, x);
plot(x, y)
%%
pd = fitdist(f_oo(:, 3), 'Kernel','Kernel','epanechnikov','BandWidth', 20);
y = pdf(pd, x);
plot(x, y)
%%
pd = fitdist(f_uu(:, 3), 'Kernel','Kernel','epanechnikov','BandWidth', 20);
y = pdf(pd, x);
plot(x, y)

%%
a = [1, 2, 3];
b = [4, 5, 6];
c = [b, a]
