%% bf 16 significant units
only_sig_16 = cell(500,2);
% 1 - rate avg over iters - 16 x 6
% 2 - sig matrix - 16 x 6

u_counter = 1;
n_units = 299;

for u=1:n_units
    if all_units_analysis{u,4} == 1
        only_sig_16{u_counter, 1} = all_units_analysis{u,2};
        only_sig_16{u_counter, 2} = all_units_analysis{u,3};

        u_counter = u_counter + 1;
    end
end

%% first T1 stimuli
t1_set1 = 1:4;
t1_set2 = 13:16;

t1_set1_res = [];
t1_set2_res = [];

for u=1:u_counter-1
    for s1=t1_set1
        sig_t1 = only_sig_16{u,2}(s1,1);
        if sig_t1 == 1
            t1_set1_res = [t1_set1_res, mean([only_sig_16{u,1}(s1,1), only_sig_16{u,1}(s1,4)])];
        end
    end

    for s2=t1_set2
        sig_t2 = only_sig_16{u,2}(s2,1);
        if sig_t2 == 1
            t1_set2_res = [t1_set2_res, mean([only_sig_16{u,1}(s2,1), only_sig_16{u,1}(s2,4)])];
        end
    end
        
end

[h,p] = ttest2(t1_set1_res, t1_set2_res)

%% t1 t2 first stimuli
t1t2_set1 = 5:8;
t1t2_set2 = 9:12;

t1t2_set1_res = [];
t1t2_set2_res = [];

for u=1:u_counter-1
    for s1=t1t2_set1
        sig_t1t2 = only_sig_16{u,2}(s1,1);
        if sig_t1t2 == 1
            t1t2_set1_res = [t1t2_set1_res, mean([only_sig_16{u,1}(s1,1), only_sig_16{u,1}(s1,4)])];
        end
    end

    for s2=t1t2_set2
        sig_t1t2 = only_sig_16{u,2}(s2,1);
        if sig_t1t2 == 1
            t1t2_set2_res = [t1t2_set2_res, mean([only_sig_16{u,1}(s2,1), only_sig_16{u,1}(s2,4)])];
        end
    end
        
end

[h,p] = ttest2(t1t2_set1_res, t1t2_set2_res)

%% first 2 stimuli T1
t1_set1 = 1:4;
t1_set2 = 13:16;

t1_set1_res2 = [];
t1_set2_res2 = [];

for u=1:u_counter-1
    for s1=t1_set1
        sig_t1 = only_sig_16{u,2}(s1,1);
        sig_t1_2 = only_sig_16{u,2}(s1,2);

        if sig_t1 == 1 && sig_t1_2 == 1
            t1_set1_res2 = [t1_set1_res2, mean([only_sig_16{u,1}(s1,1), only_sig_16{u,1}(s1,2), only_sig_16{u,1}(s1,4), only_sig_16{u,1}(s1,5)])];
        end
    end

    for s2=t1_set2
        sig_t2 = only_sig_16{u,2}(s2,1);
        sig_t2_2 = only_sig_16{u,2}(s2,2);

        if sig_t2 == 1 && sig_t2_2 == 1
            t1_set2_res2 = [t1_set2_res2, mean([only_sig_16{u,1}(s2,1), only_sig_16{u,1}(s2,2), only_sig_16{u,1}(s2,4), only_sig_16{u,1}(s2,5)])];
        end
    end
        
end

[h,p] = ttest2(t1_set1_res2, t1_set2_res2)

%% first 2  stimuli t1t2
t1_set1 = 5:8;
t1_set2 = 9:12;

t1_set1_res2 = [];
t1_set2_res2 = [];

for u=1:u_counter-1
    for s1=t1_set1
        sig_t1 = only_sig_16{u,2}(s1,1);
        sig_t1_2 = only_sig_16{u,2}(s1,2);

        if sig_t1 == 1 && sig_t1_2 == 1
            t1_set1_res2 = [t1_set1_res2, mean([only_sig_16{u,1}(s1,1), only_sig_16{u,1}(s1,2), only_sig_16{u,1}(s1,4), only_sig_16{u,1}(s1,5)])];
        end
    end

    for s2=t1_set2
        sig_t2 = only_sig_16{u,2}(s2,1);
        sig_t2_2 = only_sig_16{u,2}(s2,2);

        if sig_t2 == 1 && sig_t2_2 == 1
            t1_set2_res2 = [t1_set2_res2, mean([only_sig_16{u,1}(s2,1), only_sig_16{u,1}(s2,2), only_sig_16{u,1}(s2,4), only_sig_16{u,1}(s2,5)])];
        end
    end
        
end

[h,p] = ttest2(t1_set1_res2, t1_set2_res2)

%% 3rd stimuli, t1 being first
t1_set1 = 1:4;
t1_set2 = 13:16;

t1_set1_res2 = [];
t1_set2_res2 = [];

for u=1:u_counter-1
    for s1=t1_set1
        sig_t1 = only_sig_16{u,2}(s1,1);
        sig_t1_2 = only_sig_16{u,2}(s1,2);

        if sig_t1 == 1 && sig_t1_2 == 1
            t1_set1_res2 = [t1_set1_res2, mean([only_sig_16{u,1}(s1,3), only_sig_16{u,1}(s1,6)])];
        end
    end

    for s2=t1_set2
        sig_t2 = only_sig_16{u,2}(s2,1);
        sig_t2_2 = only_sig_16{u,2}(s2,2);

        if sig_t2 == 1 && sig_t2_2 == 1
            t1_set2_res2 = [t1_set2_res2, mean([only_sig_16{u,1}(s2,3), only_sig_16{u,1}(s2,6)])];
        end
    end
        
end

[h,p] = ttest2(t1_set1_res2, t1_set2_res2)

%% 3rd stimuli, t1t2 being first
t1_set1 = 5:8;
t1_set2 = 9:12;

t1_set1_res2 = [];
t1_set2_res2 = [];

for u=1:u_counter-1
    for s1=t1_set1
        sig_t1 = only_sig_16{u,2}(s1,1);
        sig_t1_2 = only_sig_16{u,2}(s1,2);

        if sig_t1 == 1 && sig_t1_2 == 1
            t1_set1_res2 = [t1_set1_res2, mean([only_sig_16{u,1}(s1,3), only_sig_16{u,1}(s1,6)])];
        end
    end

    for s2=t1_set2
        sig_t2 = only_sig_16{u,2}(s2,1);
        sig_t2_2 = only_sig_16{u,2}(s2,2);

        if sig_t2 == 1 && sig_t2_2 == 1
            t1_set2_res2 = [t1_set2_res2, mean([only_sig_16{u,1}(s2,3), only_sig_16{u,1}(s2,6)])];
        end
    end
        
end

[h,p] = ttest2(t1_set1_res2, t1_set2_res2)
%% %% t1 t1,  3rd stim only gap
set1 = 6;
set2 = 14;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 60*rmmissing(only_sig_16{u,1}(s,6)) )/60];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 60*rmmissing(only_sig_16{u,1}(s,6))  )/60];
        end
    end
end


% fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res);
[p1,h1] = ranksum(set1_res, set2_res);
fprintf('\n t1t2 t1t2, only gap or token')
fprintf('\n sizes-%d-%d,h-%d,p-%f,h-med-%d,p-med-%f \n',length(set1_res),length(set2_res),h,p,h1,p1)

%% %% t1 t1,  gap and token
set1 = 7;
set2 = 15;
gaps = [60,90,150,280, 60,90,150,280, 60,90,150,280, 60,90,150,280,];

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, (70*rmmissing(only_sig_16{u,1}(s,3)) + gaps(s)*rmmissing(only_sig_16{u,1}(s,6)) )/(70 + gaps(s))];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, (70*rmmissing(only_sig_16{u,1}(s,3)) + gaps(s)*rmmissing(only_sig_16{u,1}(s,6)) )/(70 + gaps(s))];
        end
    end
end


% fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res);
[p1,h1] = ranksum(set1_res, set2_res);
fprintf('\n t1t2 t1t2, gap and token')
fprintf('\n sizes-%d %d,h-%d,p-%f,h-med-%d,p-med-%f \n',length(set1_res),length(set2_res),h,p,h1,p1)


