%% comp things - set 1 2
% for each gap value, rate vs re BF 
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [3];
stim2 = [1];

stim1_like = [9:12];
stim2_like = [1:4];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 3; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% - NEW SECTION - same as above with csi

clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [3];
stim2 = [1];

stim1_like = [9:12];
stim2_like = [1:4];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 3; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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
            %             csi_units{re,g} = (hc_res - tone_res);
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% NEW SECTion -seg 6 non csi
close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [3];
stim2 = [1];

stim1_like = [9:12];
stim2_like = [1:4];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 6; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% NEW SECTION -    SEG 6 -CSI 3 vs 1 
close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [3];
stim2 = [1];

stim1_like = [9:12];
stim2_like = [1:4];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 6; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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
%                         csi_units{re,g} = (hc_res - tone_res);
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% new section - 2 vs 4 - seg 3 - non csi

close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [2];
stim2 = [4];

stim1_like = [5:8];
stim2_like = [13:16];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 3; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%%  new section - same as above csi
close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [2];
stim2 = [4];

stim1_like = [5:8];
stim2_like = [13:16];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 3; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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
%                         csi_units{re,g} = (hc_res - tone_res);
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% same as above - seg 6 - non csi - 2 vs 4
close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [2];
stim2 = [4];

stim1_like = [5:8];
stim2_like = [13:16];

stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
seg = 6; % segment to check at 
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% same as above csi
close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [2];
stim2 = [4];

stim1_like = [5:8];
stim2_like = [13:16];
seg = 6; % segment to check at 


stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,3};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u


hc_responses = cell(13,6);
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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
%                         csi_units{re,g} = (hc_res - tone_res);
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid

%% NOW ON - USE THIS - sec - comp btn diff his 
close all
clear all
freqs = [6 8.5 12 17 24 34 48]*1000; 

% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

gap_values = [60 90 110 130 150 280];

stim_seg_rebf_gaps = cell(4,6,13,6);


stim1 = [2 3];
stim2 = [1 4];

stim1_like = [5:8 9:12];
stim2_like = [1:4 13:16];


stim_like = [stim1_like stim2_like];
% set1
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
rates_and_sig = set1_rates_and_sig;
rates_and_bf = set1_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,5};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

% set 2
gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
rates_and_sig = set2_rates_and_sig;
rates_and_bf = set2_rates_and_bf;
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % sig check
    sig_vals = rates_and_sig{u,5};
    sig_vals = reshape(sig_vals(stim_like,1:3), numel(sig_vals(stim_like,1:3)),1);
    sig_mean = nanmean(sig_vals);
    if sig_mean == 0
        continue
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    rebf = 7 + 2*octaves_apart;

    rates = rates_and_sig{u,2};

    for s=1:4
       for g=1:4
           stim_index = (s-1)*4 + g;
           gap = gaps(stim_index);
           gap_index = find(gap == gap_values);
           for seg=1:6
                rate = rates(stim_index, seg);
                stim_seg_rebf_gaps{s,seg,rebf,gap_index} = [stim_seg_rebf_gaps{s,seg,rebf,gap_index}; rate];
           end % end of seg
       end % end of g
    end % end of s

end % end of u

seg = 6;
hc_responses = cell(13,6);
for stim=stim1
    for re=1:13
        for g=1:6
                hc_responses{re,g} = [hc_responses{re,g}; stim_seg_rebf_gaps{stim,seg,re,g}];
        end
    end
end

tone_responses = cell(13,6);
for stim=stim2
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

            % csi to non-csi conversion
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


     title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
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


    title(strcat(string(stim1),'-vs-',string(stim2),'-seg-', num2str(seg)))
grid
