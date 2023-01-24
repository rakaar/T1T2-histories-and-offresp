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
n_boots = 1000;
%% bootstrap
% 4 + 1
rates_and_sig = set2_rates_and_sig;
stim1=[5:8 9:12];    
stim2=[1:4 13:16];
% stim12 = [stim1 stim2];
stim12 = [1:16];
seg = 5;
limit = 10e3;
for u=1:259
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

    if sum(stim1_rates_no_nan) == 0 || sum(stim2_rates_no_nan) == 0
        continue
    end

    stim12_rates = [stim1_rates_no_nan; stim2_rates_no_nan];

    chance_csi = zeros(n_boots,1);
    boots_csi = zeros(n_boots,1);
    counter = 1;
    for b=1:n_boots
            r1 = nanmean(datasample(stim12_rates,5,'Replace',true));
            r2 = nanmean(datasample(stim12_rates,5,'Replace',true));
    
            chance_csi(b,1) = (r1-r2);
           
          
            r1 = nanmean(datasample(stim1_rates_no_nan,5,'Replace',true));
            r2 = nanmean(datasample(stim2_rates_no_nan,5,'Replace',true));
    
            boots_csi(b,1) = (r1-r2);
    end % end of boots
    
    chance_csi = sort(chance_csi);
    boots_csi = sort(boots_csi);

    left_ci = 0.025;
    right_ci = 0.975;
    chance_ci = [chance_csi(round(left_ci*length(chance_csi))) chance_csi(round(right_ci*length(chance_csi)))];
    boots_ci = [boots_csi(round(left_ci*length(boots_csi))) boots_csi(round(right_ci*length(boots_csi)))];

    rates_and_sig{u,10} = chance_ci;
    rates_and_sig{u,11} = boots_ci;

    if boots_ci(1) >= chance_ci(2) 
        rates_and_sig{u,12} = 1;
        disp('1')
        disp(u)
    elseif chance_ci(1) >= boots_ci(2)
        rates_and_sig{u,12} = -1;
        disp('-1')
        disp(u)
    else
        rates_and_sig{u,12} = 0;
    end 
   
end % end of u


