clc
clear all
close all

%%
load('lpc\lpc_pro.mat')

%% za a
%sadrži sve prva tri formanta za sve uzorke
f_a = zeros(size(slovo_a, 1), 3);
f_e = zeros(size(slovo_e, 1), 3);
f_i = zeros(size(slovo_i, 1), 3);
f_o = zeros(size(slovo_o, 1), 3);
f_u = zeros(size(slovo_u, 1), 3);


%% Matlabov proracun a
disp('Proraèun za "a".')
for i = 1:size(f_a, 1)
    % svi korjeni
    rts = roots(slovo_a(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_a(i, :) = frqs(1:3);
end

%% Matlabov proracun e
disp('Proraèun za "e".')
for i = 1:size(f_e, 1)
    % svi korjeni
    rts = roots(slovo_e(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_e(i, :) = frqs(1:3);
end

%% Matlabov proracun i
disp('Proraèun za "i".')
for i = 1:size(f_i, 1)
    % svi korjeni
    rts = roots(slovo_i(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_i(i, :) = frqs(1:3);
end

%% Matlabov proracun o
disp('Proraèun za "o".')
for i = 1:size(f_o, 1)
    % svi korjeni
    rts = roots(slovo_o(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_o(i, :) = frqs(1:3);
end

%% Matlabov proracun u
disp('Proraèun za "u".')
for i = 1:size(f_u, 1)
    % svi korjeni
    rts = roots(slovo_u(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_u(i, :) = frqs(1:3);
end
%% plotanje formanti f1 f2
close all
figure
scatter(f_a(:, 1), f_a(:, 2), 'r.')
xlim([0, 1400]) % Hz
ylim([0, 2500]) % Hz
title('A f_1 f_2')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')
grid on
print('slike/novo/A f_1 f_2','-dpng')

figure
scatter(f_e(:, 1), f_e(:, 2), 'b.')
xlim([0, 1400]) % Hz
ylim([0, 2500]) % Hz
title('E f_1 f_2')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')
grid on
print('slike/novo/E f_1 f_2','-dpng')

figure
scatter(f_i(:, 1), f_i(:, 2), 'y.')
xlim([0, 1400]) % Hz
ylim([0, 2500]) % Hz
title('I f_1 f_2')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')
grid on
print('slike/novo/I f_1 f_2','-dpng')

figure
scatter(f_o(:, 1), f_o(:, 2), 'g.')
xlim([0, 1400]) % Hz
ylim([0, 2500]) % Hz
title('O f_1 f_2')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')
grid on
print('slike/novo/O f_1 f_2','-dpng')

figure
scatter(f_u(:, 1), f_u(:, 2), 'k.')
xlim([0, 1400]) % Hz
ylim([0, 2500]) % Hz
title('U f_1 f_2')
xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')
grid on
print('slike/novo/U f_1 f_2','-dpng')

%% plotanje formanti f1 f3
close all
figure
scatter(f_a(:, 1), f_a(:, 3), 'r.')
xlim([0, 1400]) % Hz
ylim([0, 3000]) % Hz
title('A f_1 f_3')
xlabel('f_1 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/A f_1 f_3','-dpng')

figure
scatter(f_e(:, 1), f_e(:, 3), 'b.')
xlim([0, 1400]) % Hz
ylim([0, 3000]) % Hz
title('E f_1 f_3')
xlabel('f_1 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/E f_1 f_3','-dpng')

figure
scatter(f_i(:, 1), f_i(:, 3), 'y.')
xlim([0, 1400]) % Hz
ylim([0, 3000]) % Hz
title('I f_1 f_3')
xlabel('f_1 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/I f_1 f_3','-dpng')

figure
scatter(f_o(:, 1), f_o(:, 3), 'g.')
xlim([0, 1400]) % Hz
ylim([0, 3000]) % Hz
title('O f_1 f_3')
xlabel('f_1 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/O f_1 f_3','-dpng')

figure
scatter(f_u(:, 1), f_u(:, 3), 'k.')
xlim([0, 1400]) % Hz
ylim([0, 3000]) % Hz
title('U f_1 f_3')
xlabel('f_1 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/U f_1 f_3','-dpng')

%% plotanje formanti f2 f3
close all
figure
scatter(f_a(:, 2), f_a(:, 3), 'r.')
xlim([0, 2500]) % Hz
ylim([0, 3000]) % Hz
title('A f_2 f_3')
xlabel('f_2 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/A f_2 f_3','-dpng')

figure
scatter(f_e(:, 2), f_e(:, 3), 'b.')
xlim([0, 2500]) % Hz
ylim([0, 3000]) % Hz
title('E f_2 f_3')
xlabel('f_2 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/E f_2 f_3','-dpng')

figure
scatter(f_i(:, 2), f_i(:, 3), 'y.')
xlim([0, 2500]) % Hz
ylim([0, 3000]) % Hz
title('I f_2 f_3')
xlabel('f_2 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/I f_2 f_3','-dpng')

figure
scatter(f_o(:, 2), f_o(:, 3), 'g.')
xlim([0, 2500]) % Hz
ylim([0, 3000]) % Hz
title('O f_2 f_3')
xlabel('f_2 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/O f_2 f_3','-dpng')

figure
scatter(f_u(:, 2), f_u(:, 3), 'k.')
xlim([0, 2500]) % Hz
ylim([0, 3000]) % Hz
title('U f_2 f_3')
xlabel('f_2 [Hz]')
ylabel('f_3 [Hz]')
grid on
print('slike/novo/U f_2 f_3','-dpng')

%% 
% scatter3(f_a(:, 1), f_a(:, 2), f_a(:, 3), '.')
% hold on
% scatter3(f_e(:, 1), f_e(:, 2), f_e(:, 3), '.')
% scatter3(f_i(:, 1), f_i(:, 2), f_i(:, 3), '.')
% scatter3(f_o(:, 1), f_o(:, 2), f_o(:, 3), '.')
% scatter3(f_u(:, 1), f_u(:, 2), f_u(:, 3), '.')
% 
% xlabel('f_1 [Hz]')
% ylabel('f_2 [Hz]')
% zlabel('f_3 [Hz]')
% xlim([0, 1400]) % Hz
% ylim([0, 2500]) % Hz
% zlim([0, 3000]) % Hz
% grid on
% 
%% outline
% alfa = 0.8;
% srinkk = 0;
% k = boundary(f_a(:, 1), f_a(:, 2), f_a(:, 3), srinkk);
% figure
% trisurf(k, f_a(:, 1), f_a(:, 2), f_a(:, 3),'Facecolor','b','FaceAlpha', alfa, 'LineStyle', 'None')
% hold on
% k = boundary(f_e(:, 1), f_e(:, 2), f_e(:, 3), srinkk);
% trisurf(k, f_e(:, 1), f_e(:, 2), f_e(:, 3),'Facecolor','r','FaceAlpha', alfa, 'LineStyle', 'None')
% 
% k = boundary(f_i(:, 1), f_i(:, 2), f_i(:, 3), srinkk);
% trisurf(k, f_i(:, 1), f_i(:, 2), f_i(:, 3),'Facecolor','g','FaceAlpha', alfa, 'LineStyle', 'None')
% 
% k = boundary(f_o(:, 1), f_o(:, 2), f_o(:, 3), srinkk);
% trisurf(k, f_o(:, 1), f_o(:, 2), f_o(:, 3),'Facecolor','y','FaceAlpha', alfa, 'LineStyle', 'None')
% 
% k = boundary(f_u(:, 1), f_u(:, 2), f_u(:, 3), srinkk);
% trisurf(k, f_u(:, 1), f_u(:, 2), f_u(:, 3),'Facecolor','c','FaceAlpha', alfa, 'LineStyle', 'None')
% 
% xlabel('f_1 [Hz]')
% ylabel('f_2 [Hz]')
% zlabel('f_3 [Hz]')
% xlim([0, 2000]) % Hz
% ylim([0, 2500]) % Hz
% zlim([0, 3500]) % Hz
% grid on

%% save
save('formanti\f_pro.mat', 'f_a', 'f_e', 'f_i', 'f_o', 'f_u')