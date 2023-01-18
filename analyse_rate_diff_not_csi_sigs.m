%% ttest on marginals non-normal csi
close all
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% ttest on marginals not csi
% 3rd token - tone his
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% ttest on marginals - non-csi
% 3rd token - hc his
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% 3rd token - combined t and hc
close all
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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
%% ttest-non-csi
% 3rd gap - tone his
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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
%% ttest-non-csi
% 3rd gap - hc his
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% ttest-non-csi
% 3rd gap - combined
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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
%% ttest non-csi
% diff his, same 3rd token - hc
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
for stim=[1]
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% ttest non-csi
% diff his, same 3rd token - t
hc_responses = cell(13,6);
seg = 3;
for stim=[2]
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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


%% ttest non-csi
% diff his, same 3rd gap - hc
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
for stim=[1]
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% ttest non-csi
% diff his, same 3rd gap - hc
hc_responses = cell(13,6);
seg = 6;
for stim=[2]
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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

%% ttest non-csi
% 2 
hc_responses = cell(13,6);
seg = 6;
for stim=[2]
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

%             csi_units{re,g} = (hc_res - tone_res)./(hc_res + tone_res);
            csi_units{re,g} = (hc_res - tone_res);
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
%% just some random checks - ignore
r2 = hc_responses(1:13,6);
r2s = [];
for i=1:13
    r2s = [r2s; r2{i,1}];
end
r4 = tone_responses(1:13,6);
r4s = [];
for i=1:13
    r4s = [r4s; r4{i,1}];
end