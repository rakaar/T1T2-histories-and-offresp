% 2nd gap - tone vs harmonic histories
n_units = 200;
stim1 = [1:4 13:16];
stim2 = [5:8 9:12];

res1 = [];
res2 = [];

check_index = 5;
% check_durn 

gaps = [90 110 130 150 90 110 130 150 90 110 130 150 90 110 130 150];
for u=1:n_units
    for s=stim1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
              res1 = [res1, squeeze(only_sig_16{u,1}(s,:,check_index))];
        end
    end

    for s=stim2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
              res2 = [res2, squeeze(only_sig_16{u,1}(s,:,check_index))];
        end
    end
end

[h,p] = ttest2(res1, res2);
[p1,h1] = ranksum(res1, res2);
fprintf("\n lengths-%d %d, means-%f %f, ttest-%d,%f, ranksum-%d,%f \n", length(res1), length(res2), mean(res1), mean(res2), h,p, h1,p1)