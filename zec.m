clc
clear all
close all

%%
load('lpc\lpc_pro.mat')

%% sadrži sve prva tri formanta za sve uzorke
f_a = zeros(size(slovo_a, 1), 3);
f_e = zeros(size(slovo_e, 1), 3);
f_i = zeros(size(slovo_i, 1), 3);
f_o = zeros(size(slovo_o, 1), 3);
f_u = zeros(size(slovo_u, 1), 3);

% a: varijacija
f_aa = zeros(size(slovo_aa, 1), 3);
f_ee = zeros(size(slovo_ee, 1), 3);
f_ii = zeros(size(slovo_ii, 1), 3);
f_oo = zeros(size(slovo_oo, 1), 3);
f_uu = zeros(size(slovo_uu, 1), 3);


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

%% Matlabov proracun a:
disp('Proraèun za "a:".')
for i = 1:size(f_aa, 1)
    % svi korjeni
    rts = roots(slovo_aa(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_aa(i, :) = frqs(1:3);
end

%% Matlabov proracun e:
disp('Proraèun za "e:".')
for i = 1:size(f_ee, 1)
    % svi korjeni
    rts = roots(slovo_ee(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_ee(i, :) = frqs(1:3);
end

%% Matlabov proracun i:
disp('Proraèun za "i:".')
for i = 1:size(f_ii, 1)
    % svi korjeni
    rts = roots(slovo_ii(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_ii(i, :) = frqs(1:3);
end

%% Matlabov proracun o:
disp('Proraèun za "o:".')
for i = 1:size(f_oo, 1)
    % svi korjeni
    rts = roots(slovo_oo(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_oo(i, :) = frqs(1:3);
end

%% Matlabov proracun u:
disp('Proraèun za "u:".')
for i = 1:size(f_uu, 1)
    % svi korjeni
    rts = roots(slovo_uu(i, :));
    
    % korjeni koji ne leže na realnoj osi
    rts = rts(imag(rts)>0);
    angz = atan2(imag(rts),real(rts));
    
    % sortiranje formanti
    [frqs, indices] = sort(angz.*(sampling_frequency/(2*pi)));
    
    % izvlaèenje prva tri formanta
    f_uu(i, :) = frqs(1:3);
end

%% plotanje formanti f1 f2
close all
% prikaz x
prikaz_ff(f_a, 'a', 1, 2, 'r', 1400, 2500, true, true)
prikaz_ff(f_e, 'e', 1, 2, 'g', 1400, 2500, true, true)
prikaz_ff(f_i, 'i', 1, 2, 'b', 1400, 2500, true, true)
prikaz_ff(f_o, 'o', 1, 2, [0, 0.5, 1], 1400, 2500, true, true)
prikaz_ff(f_u, 'u', 1, 2, [1, 0.5, 0], 1400, 2500, true, true)
% prikaz x:

prikaz_ff(f_aa, 'aa', 1, 2, 'b', 1400, 2500, true, true)
prikaz_ff(f_ee, 'ee', 1, 2, 'r', 1400, 2500, true, true)
prikaz_ff(f_ii, 'ii', 1, 2, 'b', 1400, 2500, true, true)
prikaz_ff(f_oo, 'oo', 1, 2, [0, 0.5, 1], 1400, 2500, true, true)
prikaz_ff(f_uu, 'uu', 1, 2, [1, 0.5, 0], 1400, 2500, true, true)

%% plotanje formanti f1 f3
close all

% prikaz x
prikaz_ff(f_a, 'a', 1, 3, 'b', 1400, 3000, true, true)
prikaz_ff(f_e, 'e', 1, 3, 'r', 1400, 3000, true, true)
prikaz_ff(f_i, 'i', 1, 3, 'b', 1400, 3000, true, true)
prikaz_ff(f_o, 'o', 1, 3, [0, 0.5, 1], 1400, 3000, true, true)
prikaz_ff(f_u, 'u', 1, 3, [1, 0.5, 0], 1400, 3000, true, true)

% prikaz x:
prikaz_ff(f_aa, 'aa', 1, 3, 'b', 1400, 3000, true, true)
prikaz_ff(f_ee, 'ee', 1, 3, 'r', 1400, 3000, true, true)
prikaz_ff(f_ii, 'ii', 1, 3, 'b', 1400, 3000, true, true)
prikaz_ff(f_oo, 'oo', 1, 3, [0, 0.5, 1], 1400, 3000, true, true)
prikaz_ff(f_uu, 'uu', 1, 3, [1, 0.5, 0], 1400, 3000, true, true)

%% plotanje formanti f2 f3
close all

% prikaz x
prikaz_ff(f_a, 'a', 2, 3, 'b', 2500, 3000, true, true)
prikaz_ff(f_e, 'e', 2, 3, 'r', 2500, 3000, true, true)
prikaz_ff(f_i, 'i', 2, 3, 'b', 2500, 3000, true, true)
prikaz_ff(f_o, 'o', 2, 3, [0, 0.5, 1], 2500, 3000, true, true)
prikaz_ff(f_u, 'u', 2, 3, [1, 0.5, 0], 2500, 3000, true, true)

% prikaz x:
prikaz_ff(f_aa, 'aa', 1, 3, 'b', 2500, 3000, true, true)
prikaz_ff(f_ee, 'ee', 1, 3, 'r', 2500, 3000, true, true)
prikaz_ff(f_ii, 'ii', 1, 3, 'b', 2500, 3000, true, true)
prikaz_ff(f_oo, 'oo', 1, 3, [0, 0.5, 1], 2500, 3000, true, true)
prikaz_ff(f_uu, 'uu', 1, 3, [1, 0.5, 0], 2500, 3000, true, true)

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
save('formanti\f_pro.mat', 'f_a', 'f_e', 'f_i', 'f_o', 'f_u', 'f_aa', 'f_ee', 'f_ii', 'f_oo', 'f_uu')
