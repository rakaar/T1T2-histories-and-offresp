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

%% 60 gap
rates_and_bf = set1_rates_and_bf;
rates_and_sig = set1_rates_and_sig;
stim_num =  1:4:13;
re_bf_rates = cell(13,6);
for seg=1:6
    
    disp(seg)
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(stim_num,seg)/0.001];

end

end % end of seg 1 to 6

mean_rates = zeros(13,6);
for i=1:13
    for j=1:6
        mean_rates(i,j) = nanmean(re_bf_rates{i,j});
    end
end

figure
   imagesc(mean_rates.')
    title(strcat('gap-60-seg-',num2str(seg)))
    colorbar()
grid

%% gap 90
re_bf_rates = cell(13,6); %
for seg=1:6
     
    disp(seg)

    rates_and_bf = set1_rates_and_bf;
    rates_and_sig = set1_rates_and_sig;
    
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(2:4:14,seg)/0.001];

end

% set 2
rates_and_bf = set2_rates_and_bf;
rates_and_sig = set2_rates_and_sig;
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(1:4:13,seg)/0.001];

end


end % end of seg 1 to 6

mean_rates = zeros(13,6);
for i=1:13
    for j=1:6
        mean_rates(i,j) = nanmean(re_bf_rates{i,j});
    end
end

figure
   imagesc(mean_rates.')
    title(strcat('gap-90-seg-',num2str(seg)))
    colorbar()
grid

%% 110
rates_and_bf = set2_rates_and_bf;
rates_and_sig = set2_rates_and_sig;
stim_num =  2:4:14;
re_bf_rates = cell(13,6);

for seg=1:6
    
    disp(seg)
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(stim_num,seg)/0.001];

end

end % end of seg 1 to 6

mean_rates = zeros(13,6);
for i=1:13
    for j=1:6
        mean_rates(i,j) = nanmean(re_bf_rates{i,j});
    end
end

figure
   imagesc(mean_rates.')
    title(strcat('gap-110-seg-',num2str(seg)))
    colorbar()
grid

%% 130 gap
rates_and_bf = set2_rates_and_bf;
rates_and_sig = set2_rates_and_sig;
stim_num =  3:4:15;
re_bf_rates = cell(13,6);

for seg=1:6
    
    disp(seg)
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(stim_num,seg)/0.001];

end

end % end of seg 1 to 6

mean_rates = zeros(13,6);
for i=1:13
    for j=1:6
        mean_rates(i,j) = nanmean(re_bf_rates{i,j});
    end
end

figure
   imagesc(mean_rates.')
    title(strcat('gap-130-seg-',num2str(seg)))
    colorbar()
grid


%% 150 gap

re_bf_rates = cell(13,6); %
for seg=1:6
     
    disp(seg)

    rates_and_bf = set1_rates_and_bf;
    rates_and_sig = set1_rates_and_sig;
    
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(3:4:15,seg)/0.001];

end

% set 2
rates_and_bf = set2_rates_and_bf;
rates_and_sig = set2_rates_and_sig;
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(4:4:16,seg)/0.001];

end


end % end of seg 1 to 6

mean_rates = zeros(13,6);
for i=1:13
    for j=1:6
        mean_rates(i,j) = nanmean(re_bf_rates{i,j});
    end
end

figure
   imagesc(mean_rates.')
    title(strcat('gap-150-seg-',num2str(seg)))
    colorbar()
grid

%% 280 gap
rates_and_bf = set1_rates_and_bf;
rates_and_sig = set1_rates_and_sig;
stim_num =  4:4:16;
re_bf_rates = cell(13,6);
for seg=1:6
    
    disp(seg)
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:3), 48,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,seg} = [re_bf_rates{index,seg}; rates_and_sig{u,2}(stim_num,seg)/0.001];

end

end % end of seg 1 to 6

mean_rates = zeros(13,6);
for i=1:13
    for j=1:6
        mean_rates(i,j) = nanmean(re_bf_rates{i,j});
    end
end

figure
   imagesc(mean_rates.')
    title(strcat('gap-280-seg-',num2str(seg)))
    colorbar()
grid

