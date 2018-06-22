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
%%
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
    hold on
    legend('a', 'e', 'i', 'o', 'u')
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
