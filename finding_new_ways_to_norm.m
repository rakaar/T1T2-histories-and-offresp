%% initialize
set1_rates_and_bf = load('t1t2_set1_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set1_rates_and_bf = set1_rates_and_bf.set1_bf;

set2_rates_and_bf = load('t1t2_set2_bf-18_f-20_f-bf-21_rounded_bf-19.mat');
set2_rates_and_bf = set2_rates_and_bf.bf_data;

set1_rates_and_sig = load('set1_rates_and_sig.mat');
set1_rates_and_sig = set1_rates_and_sig.set1_rates_and_sig;

set2_rates_and_sig = load('set2_rates_and_sig.mat');
set2_rates_and_sig = set2_rates_and_sig.set2_rates_and_sig;
%% 
hist_mean_rates = cell(500,5);
% 1 - first token mean of all stim
% 2 - first t 
% 3 - first hc
% 4 - max out of all 48
% 5 - index of max out of 48
counter = 1;
%%  set 1
rates_and_sig = set1_rates_and_sig;
for u=1:299
    if rates_and_sig{u,4} == 0
        continue
    end
    u_rate = rates_and_sig{u,2};
    u_rate1_mean = nanmean(u_rate(:,1));
    u_rate_t_mean = nanmean(u_rate([1:4 13:16],1));
    u_rate_hc_mean = nanmean(u_rate([5:8 9:12],1));

    u_rate_reshape = reshape(u_rate(:,1:6), 96,1);
    [max_val, max_index] = max(u_rate_reshape);
    
    hist_mean_rates{counter,1} = u_rate1_mean;
    hist_mean_rates{counter,2} = u_rate_t_mean;
    hist_mean_rates{counter,3} = u_rate_hc_mean;
    hist_mean_rates{counter,4} = max_val;
    hist_mean_rates{counter,5} = max_index;
    
    hist_mean_rates{counter,6} = nanstd(u_rate(:,1));
    hist_mean_rates{counter,7} = nanstd(u_rate([1:4 13:16],1));
    hist_mean_rates{counter,8} = nanstd(u_rate([5:8 9:12],1));

    counter = counter + 1;
end

%% set 2
rates_and_sig = set2_rates_and_sig;
for u=1:259
    if rates_and_sig{u,4} == 0
        continue
    end
    u_rate = rates_and_sig{u,2};
    u_rate1_mean = nanmean(u_rate(:,1));
    u_rate_t_mean = nanmean(u_rate([1:4 13:16],1));
    u_rate_hc_mean = nanmean(u_rate([5:8 9:12],1));

    u_rate_reshape = reshape(u_rate(:,1:6), 96,1);
    [max_val, max_index] = max(u_rate_reshape);
    
    hist_mean_rates{counter,1} = u_rate1_mean;
    hist_mean_rates{counter,2} = u_rate_t_mean;
    hist_mean_rates{counter,3} = u_rate_hc_mean;
    hist_mean_rates{counter,4} = max_val;
    hist_mean_rates{counter,5} = max_index;

    hist_mean_rates{counter,6} = nanstd(u_rate(:,1));
    hist_mean_rates{counter,7} = nanstd(u_rate([1:4 13:16],1));
    hist_mean_rates{counter,8} = nanstd(u_rate([5:8 9:12],1));

    counter = counter + 1;
end

%% check
s1 = set1_rates_and_sig(1:299,4);

s1 = cell2mat(s1);

s2 = set2_rates_and_sig(1:259,4);

s2 = cell2mat(s2);

%% 
figure
    rate1 = cell2mat(hist_mean_rates(1:379,1))*1000; 
    histogram(rate1)
    title('1')
grid

figure
    rate1 = cell2mat(hist_mean_rates(1:379,2))*1000; 
    histogram(rate1)
    title('1 t')
grid



figure
    rate1 = fix(cell2mat(hist_mean_rates(1:379,5))/16)+1; 
    histogram(rate1)
    title('max index')
grid

%% 
 rate1 = cell2mat(hist_mean_rates(1:379,1))*1000;
 figure
 hist(rate1,[-1:1:40])

 %% 
 rate1 = cell2mat(hist_mean_rates(1:379,1))*1000; 
 rate4 = cell2mat(hist_mean_rates(1:379,4))*1000; 

 figure
    scatter(rate1,rate4)
    hold on
    plot([0 40], [0 40])
 grid

 %% 
rate1 = cell2mat(hist_mean_rates(1:379,1))*1000; 
 rate2 = cell2mat(hist_mean_rates(1:379,2))*1000; 
 rate3 = cell2mat(hist_mean_rates(1:379,3))*1000; 
%% 
figure
s7 = cell2mat(hist_mean_rates(1:379,7))*1000; 
s8 = cell2mat(hist_mean_rates(1:379,8))*1000; 
scatter(s7,s8)

grid
 %%
figure
    s = (cell2mat(hist_mean_rates(1:379,4))*1000)./( (cell2mat(hist_mean_rates(1:379,7))*1000).^2 + (cell2mat(hist_mean_rates(1:379,8))*1000).^2 ).^0.5;
    hist(s)
grid

