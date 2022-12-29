freqs = [6 8.5 12 17 24 34 48]*1000;
% set 2 - 259
% set 1 - 299
% set 1 -- 60 (90) (150) 280
% set 2 -- (90) 110 130 (150)
% analysis at second gap- gap after 2nd token
%% gap 1 - 60 -tone history
% 7 + 2*octave_diff
re_bf_rates = cell(13,1);
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [1 13]; 
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 60 tone history')
grid

%% gap 60 HC history- 2nd gap
re_bf_rates = cell(13,1);
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [5 9]; % tone history
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 60 HC history-gap after 2nd token')
grid
%% gap 90 tone history
re_bf_rates = cell(13,1);
% set 1
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [2 14]; % tone history
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

% set 2
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [1 13]; % tone history
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 90 T history-gap after 2nd token')
grid
%% gap 90 - second gap - HC his
re_bf_rates = cell(13,1);
% set 1
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [6 10]; 
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

% set 2
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [5 9]; 
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 90 HC history-gap after 2nd token')
grid

%% gap 110 - tone history - second gap
re_bf_rates = cell(13,1);
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [2 14]; 
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 110 tone history - gap after 2nd token')
grid

%% gap 110 - HC his - 2nd gap
re_bf_rates = cell(13,1);
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [6 10]; 
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 110 HC history - gap after 2nd token')
grid

%% gap 130 - tone his - 2nd gap
re_bf_rates = cell(13,1);
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [3 15]; 
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 130 tone history - 2nd gap')
grid

%% gap 130 hc his 2nd gap
re_bf_rates = cell(13,1);
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [7 11]; 
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 130 hc history - 2nd gap')
grid

%% gap 150 - tone his 2nd gap
re_bf_rates = cell(13,1);
% set 1
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [3 15]; 
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

% set 2
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [4 16]; % tone history
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 150 T history-gap after 2nd token')
grid
%% gap 150 - hc his - 2nd gap
re_bf_rates = cell(13,1);
% set 1
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [7 11]; 
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

% set 2
rates_and_bf = set2_rates_bf;
rates_and_sig = set2_rates_and_sig;
segment_num = 5; 
stim_num =  [8 12]; 
for u=1:259
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 150 hc history-gap after 2nd token')
grid

%% gap 280 tone his 2nd gap
re_bf_rates = cell(13,1);
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [4 16]; 
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 280 tone history 2nd gap')
grid

%% gap 280 - hc his - 2nd gap
re_bf_rates = cell(13,1);
rates_and_bf = set1_rates_bf;
rates_and_sig = set1_rates_and_sig;
segment_num = 5; 
stim_num =  [8 12]; 
for u=1:299
    % check if bf and f are there
    if isempty(rates_and_bf{u,19}) || isempty(rates_and_bf{u,20})
        continue
    end

    % check if its sig unit
    sig_vals = rates_and_sig{u,3};
    sig_vals_mean = nanmean(reshape(sig_vals(:,1:2), 32,1));
    if sig_vals_mean == 0
        continue;
    end

    if ismember(rates_and_bf{u,20}, freqs) && ismember(rates_and_bf{u,19}, freqs)
        octaves_apart = (find(freqs == rates_and_bf{u,20}) - find(freqs == rates_and_bf{u,19}))*0.5;
    else
        disp(u)
        disp(rates_and_bf{u,20})
        disp(rates_and_bf{u,19})
        continue
    end
    % find how many ocatves f apart from bf
    
    index = 7 + 2*octaves_apart;

    % append in appropirate cell
    re_bf_rates{index,1} = [re_bf_rates{index,1}; rates_and_sig{u,2}(stim_num,segment_num)/0.001];

end

mean_rates = [];
for i=1:13
    mean_rates = [mean_rates nanmean(re_bf_rates{i,1})];
end

figure
    bar(-3:0.5:3, mean_rates);
    title('gap 280 hc history 2nd gap')
grid
