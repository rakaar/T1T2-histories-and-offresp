% 3rd token and 3rd gap and combined
% 1 - tone history vs harmonic history, tone vs harmonic in tone history
% and harmonic history
%% 3rd token - % currently with gap change - gap only after latency period
n_units = 200;
off_res_comp = 20;
stim1 = [5:5+1+1+1];
stim2 = [9:9+1+1+1];

res1 = [];
res2 = [];

% check_index1 = 3;
% check_index2 = 6;
check_index = 3;
% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=1:n_units
    for s=stim1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
%             res1 = [res1, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + gaps(s)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s)) ];
              res1 = [res1, squeeze(only_sig_16{u,1}(s,:,check_index))];
        end
    end

    for s=stim2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
%             res2 = [res2, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + gaps(s)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s))];
              res2 = [res2, squeeze(only_sig_16{u,1}(s,:,check_index))];
        end
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2), h,p, h1,p1)

%%  3rd gap 
res1 = [];
res2 = [];

% check_index1 = 3;
% check_index2 = 6;
check_index = 6;
% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=1:n_units
    for s=stim1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
%             res1 = [res1, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + gaps(s)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s)) ];
              res1 = [res1, squeeze(only_sig_16{u,1}(s,:,check_index))];
        end
    end

    for s=stim2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
%             res2 = [res2, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + gaps(s)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s))];
              res2 = [res2, squeeze(only_sig_16{u,1}(s,:,check_index))];
        end
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2), h,p, h1,p1)

%% 3rd gap + token
res1 = [];
res2 = [];

check_index1 = 3;
check_index2 = 6;

% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=1:n_units
    for s=stim1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
           res1 = [res1, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + (gaps(s)-off_res_comp)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s) - off_res_comp) ];
        end
    end

    for s=stim2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            res2 = [res2, (70*squeeze(only_sig_16{u,1}(s,:,check_index1)) + (gaps(s)-off_res_comp)*squeeze(only_sig_16{u,1}(s,:,check_index2)))/(70 + gaps(s) - off_res_comp)];
        end
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2), h,p, h1,p1)