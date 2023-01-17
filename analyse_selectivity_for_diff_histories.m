%% to be run after analyse_for_each_stim_rates_vs_rebf
%% make nanmean
nanmean_stim_seg_rebf_gaps = zeros(4,6,13,6);
for stim=1:4
    
    for seg=1:6
        
        for r=1:13
            for    b=1:6
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

%% 3rd token - 3 -  hc history - tone history csi- hc his
hc_his = csi_mean;
%% 3rd token - 3 -  hc history - tone history csi- tone his
tone_his = csi_mean;
%% 3rd token
diff_tok3 = hc_his - tone_his;
figure
    imagesc(diff_tok3)
    alpha = double(~isnan(diff_tok3));
    imagesc(diff_tok3, 'AlphaData', alpha);
    caxis([min(min(diff_tok3))  max(max(diff_tok3))])
    title('3rd token - sel - sel hc his - tone his')
    colorbar()
grid
%% 3rd gap - hc his
hc_his = csi_mean;
%% 3rd gap - tone his
tone_his = csi_mean;
%% 3rd gap - hc - tone
diff_tok3 = hc_his - tone_his;
figure
    imagesc(diff_tok3)
    alpha = double(~isnan(diff_tok3));
    imagesc(diff_tok3, 'AlphaData', alpha);
    caxis([min(min(diff_tok3))  max(max(diff_tok3))])
    title('3rd gap - sel - sel hc his - tone his')
    colorbar()
grid

%% take marginals - 2nd gap

hc_responses = cell(13,6);
seg = 5;
for stim=[2 3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg)))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg)))
grid

%% take marginals - 3rd token - t his
hc_responses = cell(13,6);
seg = 3;
for stim=[1]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg),'tone his'))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg),'tone his'))
grid

%% take marginals - 3rd token - hc his
hc_responses = cell(13,6);
seg = 3;
for stim=[3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[2]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg),'hc his'))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg),'hc his'))
grid

% 
%% take marginals - 3rd gap - t his
hc_responses = cell(13,6);
seg = 6;
for stim=[1]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg),'tone his'))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg),'tone his'))
grid

% 
%% take marginals - 3rd token - hc his
hc_responses = cell(13,6);
seg = 6;
for stim=[3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[2]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg),'hc his'))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg),'hc his'))
grid

%% see combined response of T and HC to 3rd token
hc_responses = cell(13,6);
seg = 3;
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
    title('3rd token - csi to hc his - combined t + hc res')
grid
%% take marginal of above thing
hc_responses = cell(13,6);
seg = 3;
for stim=[2 3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg)))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg)))
grid

%% see combined of t + hc at 3rd gap

hc_responses = cell(13,6);
seg = 6;
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
    title('3rd gap - csi to hc his - combined t + hc res')
grid
%% take marginal of above

hc_responses = cell(13,6);
seg = 6;
for stim=[2 3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

csi_mean1 = nanmean(csi_mean,1);
csi_mean2 = nanmean(csi_mean,2);
figure
    plot(csi_mean1)
    title(strcat('seg-',num2str(seg)))
grid

figure
    plot(csi_mean2)
    title(strcat('seg-',num2str(seg)))
grid

%% ttests
% 2nd gap ttests
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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
figure
    imagesc(csi_ttest_h)
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid
%% 3rd token - tone his - ttest

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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
    title('3rd token - csi to hc')
    colorbar()
grid
figure
    imagesc(csi_ttest_h)
    title('h')
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid

%% 3rd token hc his

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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
    title('3rd token - hc his -csi to hc')
    colorbar()
    hold on
        for re=1:13
            for g=1:6
                if csi_ttest_h(re,g) == 1
                    plot(g,re,'marker','x','MarkerSize',25,'Color','black')
                end
            end
        end
    hold off
grid
figure
    imagesc(csi_ttest_h)
    title('h')
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid

%% 3rd gap -ttest - t his

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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
    title('3rd gap - T his -csi to hc')
    colorbar()
    hold on
        for re=1:13
            for g=1:6
                if csi_ttest_h(re,g) == 1
                    plot(g,re,'marker','x','MarkerSize',25,'Color','black','LineWidth',5)
                end
            end
        end
    hold off
grid


figure
    imagesc(csi_ttest_h)
    title('h')
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid

%% 3rd gap - hc his
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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
    title('3rd gap - hc his -csi to hc')
    colorbar()
    hold on
        for re=1:13
            for g=1:6
                if csi_ttest_h(re,g) == 1
                    plot(g,re,'marker','x','MarkerSize',25,'Color','black','LineWidth',5)
                end
            end
        end
    hold off
grid


figure
    imagesc(csi_ttest_h)
    title('h')
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid

%% 3rd token - tone + hc combined

hc_responses = cell(13,6);
seg = 3;
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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
    title('3rd token - t+hc his -csi to hc')
    hold on
        for re=1:13
            for g=1:6
                if csi_ttest_h(re,g) == 1
                    plot(g,re,'marker','x','MarkerSize',25,'Color','black')
                end
            end
        end
    hold off
grid


figure
    imagesc(csi_ttest_h)
    title('h')
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid

%% 3rd gap t + hc 

hc_responses = cell(13,6);
seg = 6;
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
csi_ttest_h = zeros(13,6);
csi_ttest_p = zeros(13,6);
for re=1:13
    for g=1:6
        if sum(isnan(hc_responses{re,g})) || sum(isnan(tone_responses{re,g}))
            csi_units{re,g} = nan;
        else
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_re_g = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = csi_re_g;
            [h,p] = ttest(csi_re_g);
            csi_ttest_h(re,g) = h;
            csi_ttest_p(re,g) = p;
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
    title('3rd gap - t+hc his -csi to hc')
    hold on
        for re=1:13
            for g=1:6
                if csi_ttest_h(re,g) == 1
                    plot(g,re,'marker','x','MarkerSize',25,'Color','black')
                end
            end
        end
    hold off
grid


figure
    imagesc(csi_ttest_h)
    title('h')
grid

figure
    imagesc(csi_ttest_p)
    title('p')
grid


%% do ttests for maringals
% second gap

hc_responses = cell(13,6);
seg = 5;
for stim=[2 3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid


%% ttests on marginals 
% seg 3 tone his
close all
hc_responses = cell(13,6);
seg = 3;
for stim=[1]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid


%% ttests on marginals
% seg 3 hc 
close all
hc_responses = cell(13,6);
seg = 3;
for stim=[3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[2]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid

%% ttsets on marginals
% seg 6 tone his
close all
seg = 6;

hc_responses = cell(13,6);
for stim=[1]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid

%% ttests on marginals
% seg 6 hc his

close all
seg = 6;

hc_responses = cell(13,6);
for stim=[3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[2]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid

%% ttests on marginals
% seg 3, combined tone + harmonic
close all
seg = 3;

hc_responses = cell(13,6);
for stim=[2 3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid

%% ttests on marginals
% seg 6, combined t and hc
close all
seg = 6;

hc_responses = cell(13,6);
for stim=[2 3]
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=[1 4]
    for re=1:13
        for g=1:6
                    tone_responses{re,g} = [tone_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

csi_units = cell(13,6);
for re=1:13
    for g=1:6
            hc_res = hc_responses{re,g};
            tone_res = tone_responses{re,g};

            csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
    end
end

csi_mean = zeros(13,6);
for re=1:13
    for g=1:6
            csi_mean(re,g) = nanmean(csi_units{re,g});
    end
end

% across rebf
across_rebf = cell(13,4); % units and length and ttest
for re=1:13
    csi_per_re = [];
    for g=1:6
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_re = [csi_per_re csi_re_g(i)];
            end
        end
    end
    across_rebf{re,1} = csi_per_re;
    across_rebf{re,2} = length(csi_per_re);

    if length(csi_per_re) == 0
        across_rebf{re,3} = 0;
        across_rebf{re,4} = 0;
    else
        [h,p] = ttest(csi_per_re);
        across_rebf{re,3} = h;
        across_rebf{re,4} = p;
    end
    
   
end

figure
    csi_mean2 = nanmean(csi_mean, 2);
    plot(csi_mean2) % plot
    h = cell2mat(across_rebf(1:13, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:13
            text(i, csi_mean2(i), num2str(across_rebf{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid



% across gap
across_gap = cell(6,4); % units and length and ttest
for g=1:6
    csi_per_g = [];
    for re=1:13
        csi_re_g = csi_units{re,g};
        for i=1:length(csi_re_g)
            if ~isnan(csi_re_g(i))
                csi_per_g = [csi_per_g csi_re_g(i)];
            end
        end
    end
    across_gap{g,1} = csi_per_g;
    across_gap{g,2} = length(csi_per_g);

    if length(csi_per_g) == 0
        across_gap{g,3} = 0;
        across_gap{g,4} = 0;
    else
        [h,p] = ttest(csi_per_g);
        across_gap{g,3} = h;
        across_gap{g,4} = p;
    end
    
   
end

figure
    csi_mean2 = transpose(nanmean(csi_mean, 1));
    plot(csi_mean2) % plot
    h = cell2mat(across_gap(1:6, 3));
    % put a star at the value
    h_plot = h.*csi_mean2;
    % replace zeros with nan
    h0_pos = find(h_plot == 0);
    h_plot(h0_pos) = nan;
    hold on
        % put a red spot only at sig=1
        plot(h_plot, 'o',  'MarkerFaceColor',[1 .6 .6], 'MarkerSize', 10)
        % put number as length of array
        for i=1:6
            text(i, csi_mean2(i), num2str(across_gap{i,2}), 'color', 'black')
        end
   hold off


    title(strcat('seg-', num2str(seg)))
grid

