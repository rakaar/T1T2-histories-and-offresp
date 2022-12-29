%% bf 16 significant units
only_sig_16 = cell(500,2);
% 1 - rate avg over iters - 16 x 6
% 2 - sig matrix - 16 x 6

u_counter = 1;
n_units = 259;

for u=1:n_units
    if all_units_analysis{u,4} == 1
        only_sig_16{u_counter, 1} = all_units_analysis{u,1};
        only_sig_16{u_counter, 2} = all_units_analysis{u,3};

        u_counter = u_counter + 1;
    end
end
disp('done')
%% t1 - not seeing gap
set1 = 1:4;
set2 = 13:16;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1
            set1_res = [set1_res, rmmissing(only_sig_16{u,1}(s,:,1))];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1
            set2_res = [set2_res, rmmissing(only_sig_16{u,1}(s,:,1))];
        end
    end
end

disp('t1 not seeing gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1 with gap
set1 = 1:4;
set2 = 13:16;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) )/120];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1
            set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) )/120];
        end
    end
end

disp('t1 with gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1 t2 no gap

set1 = 5:8;
set2 = 9:12;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1
            set1_res = [set1_res, rmmissing(only_sig_16{u,1}(s,:,1))];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1
            set2_res = [set2_res, rmmissing(only_sig_16{u,1}(s,:,1))];
        end
    end
end

disp('t1 not seeing gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1 t2 with gap 

set1 = 5:8;
set2 = 9:12;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) )/120];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1
            set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) )/120];
        end
    end
end

disp('t1 with gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1 t1 with gap
set1 = 1:4;
set2 = 13:16;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) + 70*rmmissing(only_sig_16{u,1}(s,:,2)) + 50*rmmissing(only_sig_16{u,1}(s,:,5)) )/240];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) + 70*rmmissing(only_sig_16{u,1}(s,:,2)) + 50*rmmissing(only_sig_16{u,1}(s,:,5)) )/240];
        end
    end
end

disp('t1 t1 with gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1t2 t1t2 with gap
set1 = 5:8;
set2 = 9:12;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) + 70*rmmissing(only_sig_16{u,1}(s,:,2)) + 50*rmmissing(only_sig_16{u,1}(s,:,5)) )/240];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,1)) + 50*rmmissing(only_sig_16{u,1}(s,:,4)) + 70*rmmissing(only_sig_16{u,1}(s,:,2)) + 50*rmmissing(only_sig_16{u,1}(s,:,5)) )/240];
        end
    end
end

disp('t1t2 t1t2 with gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1 t1,  3rd stim with gap
set1 = 1:4;
set2 = 13:16;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3)) + 50*rmmissing(only_sig_16{u,1}(s,:,6)) )/120];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3)) + 50*rmmissing(only_sig_16{u,1}(s,:,6)) )/120];
        end
    end
end

disp('t1 t1 3rd stim with gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% %% t1 t1,  3rd stim no gap
set1 = 1:4;
set2 = 13:16;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3)) )/70];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3))  )/70];
        end
    end
end

disp('t1 t1, 3rd stim  gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% %% t1 t1,  3rd stim only gap
set1 = 1:4;
set2 = 13:16;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,6)) )/70];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,6))  )/70];
        end
    end
end

disp('t1 t1, 3rd only  gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% t1t2 t1,  3rd stim with gap
set1 = 5:8;
set2 = 9:12;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3)) + 50*rmmissing(only_sig_16{u,1}(s,:,6)) )/120];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3)) + 50*rmmissing(only_sig_16{u,1}(s,:,6)) )/120];
        end
    end
end

disp('t1t2 t1t2 3rd stim with gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% %% t1 t1,  3rd stim no gap
set1 = 5:8;
set2 = 9:12;

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3)) )/70];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 70*rmmissing(only_sig_16{u,1}(s,:,3))  )/70];
        end
    end
end

disp('t1t2 t1t2, 3rd stim  gap')
fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res)

%% %% playground-t1 t1,  3rd stim only gap
% --- token 3
clc
set1 = [8];
set2 = [12];

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 60*rmmissing(only_sig_16{u,1}(s,:,3)) )/60];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 60*rmmissing(only_sig_16{u,1}(s,:,3))  )/60];
        end
    end
end


% fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res);
[p1,h1] = ranksum(set1_res, set2_res);
fprintf('\n sizes=%d,%d, h=%d,p=%f, h_med=%d,p_med=%f, means=%f,%f',length(set1_res),length(set2_res),h,p,h1,p1, mean(set1_res),mean(set2_res))

% -------------- gap - 6
set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, ( 60*rmmissing(only_sig_16{u,1}(s,:,6)) )/60];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, ( 60*rmmissing(only_sig_16{u,1}(s,:,6))  )/60];
        end
    end
end


[h,p] = ttest2(set1_res, set2_res);
[p1,h1] = ranksum(set1_res, set2_res);
fprintf('\n sizes=%d,%d, h=%d,p=%f, h_med=%d,p_med=%f, means=%f,%f',length(set1_res),length(set2_res),h,p,h1,p1, mean(set1_res),mean(set2_res))


% ----------token with gap
gaps = [60,90,150,280, 60,90,150,280, 60,90,150,280, 60,90,150,280,];

set1_res = [];
set2_res = [];
for u=1:u_counter-1
    for s=set1
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
            set1_res = [set1_res, (70*rmmissing(only_sig_16{u,1}(s,:,3)) + gaps(s)*rmmissing(only_sig_16{u,1}(s,:,6)) )/(70 + gaps(s))];
        end
    end

    for s=set2
        if only_sig_16{u,2}(s,1) == 1 || only_sig_16{u,2}(s,2) == 1
             set2_res = [set2_res, (70*rmmissing(only_sig_16{u,1}(s,:,3)) + gaps(s)*rmmissing(only_sig_16{u,1}(s,:,6)) )/(70 + gaps(s))];
        end
    end
end


% fprintf('\n sizes - %d, %d \n', length(set1_res), length(set2_res));
[h,p] = ttest2(set1_res, set2_res);
[p1,h1] = ranksum(set1_res, set2_res);
fprintf('\n sizes=%d,%d, h=%d,p=%f, h_med=%d,p_med=%f, means=%f,%f',length(set1_res),length(set2_res),h,p,h1,p1, mean(set1_res),mean(set2_res))
