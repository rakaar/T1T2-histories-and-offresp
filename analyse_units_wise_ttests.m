%% load rates
clear
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
%% 
%
rates_and_sig = set1_rates_and_sig;
stim1=[9:12];    
stim2=[1:4];
% stim12 = [stim1 stim2];
stim12 = [1:16];
seg = 5;
limit = 10e3;


units_h1_ttest = [];
units_h1_ttest_right = [];
units_h1_ttest_left = [];
units_h1_ranksum = [];
units_h1_ranksum_right = [];
units_h1_ranksum_left = [];

for u=1:299
%     sigs = rates_and_sig{u,3};
%     sigs_taken = sigs(stim12,1:3);
%     sig_first_2 = reshape(sigs_taken, numel(sigs_taken),1);
%     not_include_unit_criteria = (nanmean(sig_first_2) == 0);
%     if not_include_unit_criteria
%         continue
%     end
    u_rate = rates_and_sig{u,1};
    stim1_rate = u_rate(stim1, :, seg);
    stim2_rate = u_rate(stim2, :, seg);
    
    stim1_rate_vec = reshape(stim1_rate, numel(stim1_rate),1);
    stim2_rate_vec = reshape(stim2_rate, numel(stim2_rate),1);

    stim1_rates_no_nan = stim1_rate_vec(~isnan(stim1_rate_vec));
    stim2_rates_no_nan = stim2_rate_vec(~isnan(stim2_rate_vec));

    if sum(stim1_rates_no_nan) == 0 || sum(stim2_rates_no_nan) == 0
        continue
    end

    
    [h,~] = ttest2(stim1_rates_no_nan, stim2_rates_no_nan);
    if h == 1
        units_h1_ttest = [units_h1_ttest u];
    end

    [h,~] = ttest2(stim1_rates_no_nan, stim2_rates_no_nan, 'Tail', 'left');
    if h == 1
        units_h1_ttest_left = [units_h1_ttest_left u];
    end
    
    [h,~] = ttest2(stim1_rates_no_nan, stim2_rates_no_nan, 'Tail', 'right');
    if h == 1
        units_h1_ttest_right = [units_h1_ttest_right u];
    end

    [~,h] = ranksum(stim1_rates_no_nan, stim2_rates_no_nan);
    if h == 1
        units_h1_ranksum = [units_h1_ranksum u];
    end
    
    [~,h] = ranksum(stim1_rates_no_nan, stim2_rates_no_nan, 'tail', 'right');
    if h == 1
        units_h1_ranksum_right = [units_h1_ranksum_right u];
    end

    [~,h] = ranksum(stim1_rates_no_nan, stim2_rates_no_nan, 'tail', 'left');
    if h == 1
        units_h1_ranksum_left = [units_h1_ranksum_left u];
    end
   
end % end of u
fprintf("\n %s vs %s @seg %s\n", strjoin(string(stim1), ','), strjoin(string(stim2), ','), num2str(seg))
fprintf("ttest n_units=%s, units=%s  \n",  num2str(length(units_h1_ttest)), strjoin(string(units_h1_ttest), ','))
fprintf("left ttest n_units=%s, units=%s  \n",  num2str(length(units_h1_ttest_left)), strjoin(string(units_h1_ttest_left), ','))
fprintf("right ttest n_units=%s, units=%s  \n",num2str(length(units_h1_ttest_right)), strjoin(string(units_h1_ttest_right), ','))
fprintf("ranksum n_units=%s, units=%s  \n",num2str(length(units_h1_ranksum)), strjoin(string(units_h1_ranksum), ','))
fprintf("left ranksum n_units=%s, units=%s  \n",num2str(length(units_h1_ranksum_left)), strjoin(string(units_h1_ranksum_left), ','))
fprintf("right ranksum n_units=%s, units=%s  \n",num2str(length(units_h1_ranksum_right)), strjoin(string(units_h1_ranksum_right), ','))

%% debg TEMP
rates_and_sig = set1_rates_and_sig;
stim1=[12];    
stim2=[4];
% stim12 = [stim1 stim2];
stim12 = [1:16];

seg = 6;
limit = 10e3;

s1 = [];
s2 = [];



for u=1:299
    sigs = rates_and_sig{u,3};
    sigs_taken = sigs(stim12,1:3);
    sig_first_2 = reshape(sigs_taken, numel(sigs_taken),1);
    not_include_unit_criteria = (nanmean(sig_first_2) == 0);
    if not_include_unit_criteria
        continue
    end
    u_rate = rates_and_sig{u,1};
    stim1_rate = u_rate(stim1, :, seg);
    stim2_rate = u_rate(stim2, :, seg);
    
    stim1_rate_vec = reshape(stim1_rate, numel(stim1_rate),1);
    stim2_rate_vec = reshape(stim2_rate, numel(stim2_rate),1);

    stim1_rates_no_nan = stim1_rate_vec(~isnan(stim1_rate_vec));
    stim2_rates_no_nan = stim2_rate_vec(~isnan(stim2_rate_vec));

    s1 = [s1 mean(stim1_rates_no_nan)];
    s2 = [s2 mean(stim2_rates_no_nan)];
   
end % end of u
disp('done 122')
%%
rates_and_sig = set1_rates_and_sig;
stim1=[12];    
stim2=[4];

seg = 6;


s1 = [];
s2 = [];

for u=1:299
    sig_val = rates_and_sig{u,4};
    sigs = rates_and_sig{u,3};

    sig2 = sigs(stim1,1:2);
    not_include_unit_criteria = ((sig2(1) ~= 1) && (sig2(2) ~= 1));
    
    
    if ~not_include_unit_criteria && sig_val
        u_rate = rates_and_sig{u,1};
        stim1_rate = u_rate(stim1, :, seg);
        stim1_rate_vec = reshape(stim1_rate, numel(stim1_rate),1);
        stim1_rates_no_nan = stim1_rate_vec(~isnan(stim1_rate_vec));
        s1 = [s1; stim1_rates_no_nan];
    end
    


    
   sig2 = sigs(stim2,1:2);
   not_include_unit_criteria = ((sig2(1) ~= 1) && (sig2(2) ~= 1));
    if ~not_include_unit_criteria && sig_val
        u_rate = rates_and_sig{u,1};
        stim2_rate = u_rate(stim2, :, seg);
        stim2_rate_vec = reshape(stim2_rate, numel(stim2_rate),1);
        stim2_rates_no_nan = stim2_rate_vec(~isnan(stim2_rate_vec));
        s2 = [s2; stim2_rates_no_nan];
    end   
end % end of u

disp('done')