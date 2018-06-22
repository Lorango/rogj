for i = 1:3
    disp('Formanti: (a, a:, e, e:, i, i:, o, o:, u, u:)')
    disp(i)
    disp('a')
    mean(f_a(:, i))
    mean(f_aa(:, i))
    h = histogram(f_a(:, i), 500);
    pause
    disp('e')
    mean(f_e(:, i))
    mean(f_ee(:, i))
    h = histogram(f_e(:, i), 500);
    pause
    disp('i')
    mean(f_i(:, i))
    mean(f_ii(:, i))
    h = histogram(f_i(:, i), 500);
    pause
    disp('o')
    mean(f_o(:, i))
    mean(f_oo(:, i))
    h = histogram(f_o(:, i), 500);
    pause
    disp('u')
    mean(f_u(:, i))
    mean(f_uu(:, i))
    h = histogram(f_u(:, i), 500);
    pause
end

%%

%x = randn(10000,1);
h = histogram(f_e(:, 2), 500)
grid on

%%
plot(hamming(960));
title('Hammingova prozorska funkcija')
xlabel('uzorci')
ylabel('amplituda')
grid on
xlim([0, 960])