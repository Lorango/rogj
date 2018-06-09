function prikaz_ff( f_x, slovo, m, n, color, x_lim, y_lim, spremi, new_fig )
%KUMPIR Summary of this function goes here
%   Detailed explanation goes here

if new_fig
%     figure
    % naredba da prikaže figure na ful skrin
    figure('units','normalized','outerposition',[0 0 1 1])
else
    hold on
end

scatter(f_x(:, m), f_x(:, n), '.', 'MarkerEdgeColor', color)
xlim([0, x_lim]) % Hz
ylim([0, y_lim]) % Hz
title(sprintf('%s f_%d f_%d', slovo, m, n))
xlabel(sprintf('f_%d [Hz]', m))
ylabel(sprintf('f_%d [Hz]', n))
grid on
if spremi
    print(sprintf('slike/novo/%s f_%d f_%d', slovo, m, n), '-dpng')
end

