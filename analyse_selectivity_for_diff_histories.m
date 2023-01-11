%% to be run after analyse_for_each_stim_rates_vs_rebf
%% make nanmean
nanmean_stim_seg_rebf_gaps = zeros(4,6,13,6);
for stim=1:4
    
    for seg=1:6
        
        for r=1:13
            for g=1:6
                if length(stim_seg_rebf_gaps{stim,seg,r,g}) > 5
                    nanmean_stim_seg_rebf_gaps(stim,seg,r,g) = nanmean(stim_seg_rebf_gaps{stim,seg,r,g});
                else
                    nanmean_stim_seg_rebf_gaps(stim,seg,r,g) = nan;
                end
            end % end of 
        end % end of r
      
    end % end of seg
    
end % end of stim
disp('nanmean of atleast 5 done')

%% csi at 2nd gap for hc, hc - tone/hc + tone
% 13 re bf vs 6 gaps
% nanmean_stim_seg_rebf_gaps , stim_seg_rebf_gaps
hc_responses = cell(13,6);
seg = 5;
for stim=[2 3]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    hc_responses{re,g} = nan;
            end
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    tone_responses{re,g} = nan;
            end
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
        end
            

    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
        if isnan(csi_units{re,g})
            csi_mean(re,g) = nan;
        else
            csi_mean(re,g) = nanmean(csi_units{re,g});
        end
    end
end

figure
    imagesc(csi_mean)
    alpha = double(~isnan(csi_mean));
    imagesc(csi_mean, 'AlphaData', alpha);
    caxis([min(min(csi_mean))  max(max(csi_mean))])
    title('2nd gap - csi to hc')
grid




%% csi at 3rd token, with tone history
% 13 re bf vs 6 gaps
% nanmean_stim_seg_rebf_gaps , stim_seg_rebf_gaps
hc_responses = cell(13,6);
seg = 3;
for stim=[1]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    hc_responses{re,g} = nan;
            end
        end
    end
end

tone_responses = cell(13,6);
for stim=[4]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    tone_responses{re,g} = nan;
            end
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
        end
            

    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
        if isnan(csi_units{re,g})
            csi_mean(re,g) = nan;
        else
            csi_mean(re,g) = nanmean(csi_units{re,g});
        end
    end
end

figure
    imagesc(csi_mean)
    alpha = double(~isnan(csi_mean));
    imagesc(csi_mean, 'AlphaData', alpha);
    caxis([min(min(csi_mean))  max(max(csi_mean))])
    title('3rd token - tone his- csi to hc')
grid

%% csi at 3rd token, with hc history
% 13 re bf vs 6 gaps
% nanmean_stim_seg_rebf_gaps , stim_seg_rebf_gaps
hc_responses = cell(13,6);
seg = 3;
for stim=[3]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    hc_responses{re,g} = nan;
            end
        end
    end
end

tone_responses = cell(13,6);
for stim=[2]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    tone_responses{re,g} = nan;
            end
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
        end
            

    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
        if isnan(csi_units{re,g})
            csi_mean(re,g) = nan;
        else
            csi_mean(re,g) = nanmean(csi_units{re,g});
        end
    end
end

figure
    imagesc(csi_mean)
    alpha = double(~isnan(csi_mean));
    imagesc(csi_mean, 'AlphaData', alpha);
    caxis([min(min(csi_mean))  max(max(csi_mean))])
    title('3rd token - hc his- csi to hc')
grid

%% csi at 3rd gap, with tone his
% 13 re bf vs 6 gaps
% nanmean_stim_seg_rebf_gaps , stim_seg_rebf_gaps
hc_responses = cell(13,6);
seg = 6;
for stim=[1]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    hc_responses{re,g} = nan;
            end
        end
    end
end

tone_responses = cell(13,6);
for stim=[4]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    tone_responses{re,g} = nan;
            end
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
        end
            

    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
        if isnan(csi_units{re,g})
            csi_mean(re,g) = nan;
        else
            csi_mean(re,g) = nanmean(csi_units{re,g});
        end
    end
end

figure
    imagesc(csi_mean)
    alpha = double(~isnan(csi_mean));
    imagesc(csi_mean, 'AlphaData', alpha);
    caxis([min(min(csi_mean))  max(max(csi_mean))])
    title('3rd gap - T his- csi to hc')
    colorbar()
grid

%% csi at 3rd gap, with hc his
% 13 re bf vs 6 gaps
% nanmean_stim_seg_rebf_gaps , stim_seg_rebf_gaps
hc_responses = cell(13,6);
seg = 6;
for stim=[3]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    hc_responses{re,g} = nan;
            end
        end
    end
end

tone_responses = cell(13,6);
for stim=[2]
    for re=1:13
        for g=1:6
            if length(stim_seg_rebf_gaps{stim,seg,re,g}) > 5
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
            else
                    tone_responses{re,g} = nan;
            end
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
        end
            

    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
        if isnan(csi_units{re,g})
            csi_mean(re,g) = nan;
        else
            csi_mean(re,g) = nanmean(csi_units{re,g});
        end
    end
end

figure
    imagesc(csi_mean)
    alpha = double(~isnan(csi_mean));
    imagesc(csi_mean, 'AlphaData', alpha);
    caxis([min(min(csi_mean))  max(max(csi_mean))])
    title('3rd gap - HC his- csi to hc')
    colorbar()
grid