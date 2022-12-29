% 3rd token and 3rd gap and combined
% 1 - tone history vs harmonic history, tone vs harmonic in tone history
% and harmonic history
%% 
%% 3rd token - % currently with gap change - gap only after latency period
n_units = 192;
off_res_comp = 20;
stim1 = [14];
stim2 = [6];
all_stim_with_stim12_gap = 2:14;

res1 = [];
res2 = [];


sig_units_index = [];
for u=1:n_units
    u_sig_vals = [];
    u_sig_matrix = only_sig_16{u,2};
    for a=all_stim_with_stim12_gap
        u_sig_vals = [u_sig_vals u_sig_matrix(a,1:2)];
    end

    if length(find(u_sig_vals == 1)) ~= 0 
        sig_units_index = [sig_units_index u];
    end
end
%% tests
% check_index1 = 3;
% check_index2 = 6;
check_index = 3;
% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=sig_units_index
    for s=stim1
         res1 = [res1, squeeze(only_sig_16{u,1}(s,:,check_index))];
     end

    for s=stim2
          res2 = [res2, squeeze(only_sig_16{u,1}(s,:,check_index))];
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, medians -%f,%f ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2), median(res1), median(res2), h,p, h1,p1)

%%  3rd gap 
res1 = [];
res2 = [];

% check_index1 = 3;
% check_index2 = 6;
check_index = 6;
% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=sig_units_index
    for s=stim1
              res1 = [res1, squeeze(only_sig_16{u,1}(s,:,check_index))];
    end

    for s=stim2
              res2 = [res2, squeeze(only_sig_16{u,1}(s,:,check_index))];
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, medians -%f,%f, ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2), median(res1), median(res2), h,p, h1,p1)

%% 3rd gap + token
res1 = [];
res2 = [];

check_index1 = 3;
check_index2 = 6;

% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=sig_units_index
    for s=stim1
           res1 = [res1, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + (gaps(s)-off_res_comp)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s) - off_res_comp) ];
    end

    for s=stim2
        res2 = [res2, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + (gaps(s)-off_res_comp)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s) - off_res_comp)];
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, medians-%f,%f, ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2),median(res1),median(res2), h,p, h1,p1)