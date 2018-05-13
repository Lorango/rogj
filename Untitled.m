clc
clear all
close all
%%
load('EEE.mat')
g_1 = f_1;
g_2 = f_2;
g_3 = f_3;
%%
load('AAA.mat')
%%
figure
hold on
scatter(f_1, f_2, 'r')
scatter(g_1, g_2, 'b')
xlim([0, 1400]) % Hz
ylim([0, 1400]) % Hz
grid on
legend('a', 'e')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')

figure
hold on
scatter(f_1, f_3, 'r')
scatter(g_1, g_3, 'b')
xlim([0, 1400]) % Hz
ylim([0, 1400]) % Hz
grid on
legend('a', 'e')
xlabel('f_1 [Hz]')
ylabel('f_3 [Hz]')

figure
hold on
scatter(f_2, f_3, 'r')
scatter(g_2, g_3, 'b')
xlim([0, 1400]) % Hz
ylim([0, 1400]) % Hz
grid on
legend('a', 'e')
xlabel('f_2 [Hz]')
ylabel('f_3 [Hz]')

%%
figure
hold on
scatter3(f_1, f_2, f_3, 'r')
scatter3(g_1, g_2, g_3, 'b')
xlim([0, 1400]) % Hz
ylim([0, 1400]) % Hz
zlim([0, 1400]) % Hz
grid on
legend('a', 'e')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')
zlabel('f_3 [Hz]')