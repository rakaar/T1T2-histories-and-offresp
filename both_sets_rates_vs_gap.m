% load 'rates_at_all_gaps_data.mat'
% 60 90 110 130 150 280  - gaps
%% rates vs gaps - 3rd token
rates = zeros(6,4);
for g=1:6
    for s=1:4
        disp(length(rates_at_all_gaps_data{g,s}{3,1}))
        rates(g,s) = mean(rates_at_all_gaps_data{g,s}{3,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('3rd token')
grid
%% rates vs gaps - 3rd gap
rates = zeros(6,4);
for g=1:6
    for s=1:4
        disp(length(rates_at_all_gaps_data{g,s}{6,1}))
        rates(g,s) = mean(rates_at_all_gaps_data{g,s}{6,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('3rd gap')
grid


%% rates vs gaps - 3rd token + gap
gaps = [60 90 110 130 150 280];

rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = mean((70*(rates_at_all_gaps_data{g,s}{3,1}) + gaps(g)*(rates_at_all_gaps_data{g,s}{6,1})) / (70 + gaps(g)));
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('3rd token + gap')
grid


%% rates vs gaps - 2nd gap

rates = zeros(6,4);
for g=1:6
    for s=1:4
        disp(length(rates_at_all_gaps_data{g,s}{5,1}))
        rates(g,s) = mean(rates_at_all_gaps_data{g,s}{5,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('2nd gap')
grid

%% repeat the above same with median
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median(rates_at_all_gaps_data{g,s}{3,1});
    end
end

figure('Name', 'rate_vs_gap_median-3rd-token')
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('median 3rd token')
grid

%% rates vs gaps - median - 3rd gap
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median(rates_at_all_gaps_data{g,s}{6,1});
    end
end

figure('Name', 'rate_vs_gap_median-3rd-gap')
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('3rd gap')
grid

%% rates vs gaps - 3rd token + gap
gaps = [60 90 110 130 150 280];

rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median((70*(rates_at_all_gaps_data{g,s}{3,1}) + gaps(g)*(rates_at_all_gaps_data{g,s}{6,1})) / (70 + gaps(g)));
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('median-3rd token + gap')
grid

%% median-rates vs gaps - 2nd gap

rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median(rates_at_all_gaps_data{g,s}{5,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('median-2nd gap')
grid

%% rates vs gaps - removing outliers, seeing both mean and median
% 3rd token
rates_mean_inside_mean = zeros(6,4);
rates_mean_inside_median = zeros(6,4);

rates_median_inside_mean = zeros(6,4);
rates_median_inside_median = zeros(6,4);
for g=1:6
    for s=1:4
        [inside_mean, inside_median] = remove_outside_mean_and_outside_median(rates_at_all_gaps_data{g,s}{3,1});
        
        disp(length(inside_mean))
        disp(length(inside_median))

        rates_mean_inside_mean(g,s) = mean(inside_mean);
        rates_mean_inside_median(g,s) = mean(inside_median);

        rates_median_inside_mean(g,s) = median(inside_mean);
        rates_median_inside_median(g,s) = median(inside_median);
    end
end

figure
    plot(rates_mean_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-mean-3rd token-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_mean_3rd_token.fig')
grid

figure
    plot(rates_mean_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-median-3rd token-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_median_3rd_token.fig')
grid

figure
    plot(rates_median_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-mean-3rd token-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_mean_3rd_token.fig')
grid

figure
    plot(rates_median_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-median-3rd token-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_median_3rd_token.fig')
grid

%% rates vs gaps - removing outliers, seeing both mean and median
% 3rd gap
rates_mean_inside_mean = zeros(6,4);
rates_mean_inside_median = zeros(6,4);

rates_median_inside_mean = zeros(6,4);
rates_median_inside_median = zeros(6,4);
for g=1:6
    for s=1:4
        [inside_mean, inside_median] = remove_outside_mean_and_outside_median(rates_at_all_gaps_data{g,s}{6,1});
        
        disp(length(inside_mean))
        disp(length(inside_median))

        rates_mean_inside_mean(g,s) = mean(inside_mean);
        rates_mean_inside_median(g,s) = mean(inside_median);

        rates_median_inside_mean(g,s) = median(inside_mean);
        rates_median_inside_median(g,s) = median(inside_median);
    end
end

figure
    plot(rates_mean_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-mean-3rd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_mean_3rd_gap.fig')
grid

figure
    plot(rates_mean_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-median-3rd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_median_3rd_gap.fig')
grid

figure
    plot(rates_median_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-mean-3rd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_mean_3rd_gap.fig')
grid

figure
    plot(rates_median_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-median-3rd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_median_3rd_gap.fig')
grid

%% rates vs gaps - removing outliers, seeing both mean and median
% 3rd token + gap
rates_mean_inside_mean = zeros(6,4);
rates_mean_inside_median = zeros(6,4);

rates_median_inside_mean = zeros(6,4);
rates_median_inside_median = zeros(6,4);
for g=1:6
    for s=1:4
        [inside_mean, inside_median] = remove_outside_mean_and_outside_median(mean((70*(rates_at_all_gaps_data{g,s}{3,1}) + gaps(g)*(rates_at_all_gaps_data{g,s}{6,1})) / (70 + gaps(g))));
        
        disp(length(inside_mean))
        disp(length(inside_median))

        rates_mean_inside_mean(g,s) = mean(inside_mean);
        rates_mean_inside_median(g,s) = mean(inside_median);

        rates_median_inside_mean(g,s) = median(inside_mean);
        rates_median_inside_median(g,s) = median(inside_median);
    end
end

figure
    plot(rates_mean_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-mean-3rd token + gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_mean_3rd_token_gap.fig')
grid

figure
    plot(rates_mean_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-median-3rd token-gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_median_3rd_token-gap.fig')
grid

figure
    plot(rates_median_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-mean-3rd token-gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_mean_3rd_token-gap.fig')
grid

figure
    plot(rates_median_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-median-3rd token-gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_median_3rd_token-gap.fig')
grid

%% rates vs gaps - removing outliers, seeing both mean and median
% 2nd gap
rates_mean_inside_mean = zeros(6,4);
rates_mean_inside_median = zeros(6,4);

rates_median_inside_mean = zeros(6,4);
rates_median_inside_median = zeros(6,4);
for g=1:6
    for s=1:4
        [inside_mean, inside_median] = remove_outside_mean_and_outside_median(rates_at_all_gaps_data{g,s}{5,1});
        
        disp(length(inside_mean))
        disp(length(inside_median))

        rates_mean_inside_mean(g,s) = mean(inside_mean);
        rates_mean_inside_median(g,s) = mean(inside_median);

        rates_median_inside_mean(g,s) = median(inside_mean);
        rates_median_inside_median(g,s) = median(inside_median);
    end
end

figure
    plot(rates_mean_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-mean-2nd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_mean_2nd_gap.fig')
grid

figure
    plot(rates_mean_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-mean-inside-median-2nd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_mean_inside_median_2nd_gap.fig')
grid

figure
    plot(rates_median_inside_mean)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-mean-2nd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_mean_2nd_gap.fig')
grid

figure
    plot(rates_median_inside_median)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title(strcat('rates-median-inside-median-2nd gap-', num2str(length(inside_mean)), '-', num2str(length(inside_median))))
    saveas(gcf, 'D:\da\rates_median_inside_median_2nd_gap.fig')
grid


%% rates vs gaps - 1st token
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = mean(rates_at_all_gaps_data{g,s}{1,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('1st token')
    saveas(gcf, 'D:\da\rates-vs-gaps-mean-first-token.fig')
grid

%% rates vs gaps - 2nd token
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = mean(rates_at_all_gaps_data{g,s}{2,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('2nd token')
    saveas(gcf, 'D:\da\rates-vs-gaps-mean-2nd-token.fig')
grid

%% rates vs gaps - 1st gap
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = mean(rates_at_all_gaps_data{g,s}{4,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('1st gap')
    saveas(gcf, 'D:\da\rates-vs-gaps-mean-1st-gap.fig')
grid

% next repeat for median
%% rates vs gaps - 1st token
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median(rates_at_all_gaps_data{g,s}{1,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('1st token')
    saveas(gcf, 'D:\da\rates-vs-gaps-median-first-token.fig')
grid

%% rates vs gaps - 2nd token
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median(rates_at_all_gaps_data{g,s}{2,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('2nd token')
    saveas(gcf, 'D:\da\rates-vs-gaps-median-2nd-token.fig')
grid

%% rates vs gaps - 1st gap
rates = zeros(6,4);
for g=1:6
    for s=1:4
        rates(g,s) = median(rates_at_all_gaps_data{g,s}{4,1});
    end
end

figure
    plot(rates)
    legend('T T HC','HC HC T','HC HC HC', 'T T T')
    title('1st gap')
    saveas(gcf, 'D:\da\rates-vs-gaps-median-1st-gap.fig')
grid

%% 4 stimuli, for each a 6 x 6 matrix - 6 gaps - 6 (tok1, tok2... gap2, gap3)
rates_gaps_durs = zeros(4,6,6);
for s=1:4
    for g=1:6
        rate = rates_at_all_gaps_data{g,s};
        for i=1:6
            rates_gaps_durs(s,g,i) = mean(rate{i,1});
        end
    end
end

%% 4 matrices
figure
    subplot(2,2,1)
        imagesc(squeeze(rates_gaps_durs(1,:,:)))
        caxis([0 0.005])
        title('T T HC')

    subplot(2,2,2)
        imagesc(squeeze(rates_gaps_durs(2,:,:)))
        caxis([0 0.005])
        title('HC HC T')

    subplot(2,2,3)
        imagesc(squeeze(rates_gaps_durs(3,:,:)))
        caxis([0 0.005])
        title('HC HC HC')
    
    subplot(2,2,4)
        imagesc(squeeze(rates_gaps_durs(4,:,:)))
        caxis([0 0.005])
        title('T T T')
 grid


