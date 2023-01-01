%% for each gap value, rate vs re BF 
freqs = [6 8.5 12 17 24 34 48]*1000; 

%% get the vars
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;

%% 4 stim, 6 segments - 13 re BF, 6 gap[60(1) 90(2) 110(3) 130(4) 150(5) 280(6)]
stim_seg_rebf_gaps = cell(4,6,13,6);
gap_values = [60 90 110 130 150 280];
%% set1
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
    sig_vals = reshape(sig_vals(:,1:3), 48,1);
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

%% set 2
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
    sig_vals = reshape(sig_vals(:,1:3), 48,1);
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

disp('set 2')
%% make nanmean
nanmean_stim_seg_rebf_gaps = zeros(4,6,13,6);
for stim=1:4
    
    for seg=1:6
        
        for r=1:13
            for g=1:6
                nanmean_stim_seg_rebf_gaps(stim,seg,r,g) = nanmean(stim_seg_rebf_gaps{stim,seg,r,g});
            end % end of 
        end % end of r
      
    end % end of seg
    
end % end of stim
disp('nanmean done')
%% make plot
for s=1:4
    figure
        for seg=1:6
            subplot(3,3,seg)
            imagesc(squeeze(nanmean_stim_seg_rebf_gaps(s,seg,:,:))*1000.')
            title(strcat('seg-',num2str(seg)))
            colorbar()
            caxis([0 15])
        end
    title(strcat('stim-',num2str(s)))
    saveas(gcf, strcat( num2str(s),'.png' ))
    grid
    
end
disp('plots')