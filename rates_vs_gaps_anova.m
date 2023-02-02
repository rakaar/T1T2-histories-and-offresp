%% rates vs gaps
close all;
seg = 6;
rates_at_stim_vs_gaps = zeros(4,6);
% nanmean_stim_seg_rebf_gaps 4 stim 6 segs 13 rebf 6 gaps
for stim=1:4
    for g=1:6
        rates_at_stim_vs_gaps(stim,g) = nanmean(squeeze(nanmean_stim_seg_rebf_gaps(stim,seg,:,g)));
    end
end

%%
figure
    plot(rates_at_stim_vs_gaps')
    legend('T T H', 'H H T', ' H H H', 'T T T')
    title(strcat('seg=',num2str(seg),'rates-vs-gaps'))
grid
%% anova 

[p,tbl,stats] = anova1(rates_at_stim_vs_gaps);

