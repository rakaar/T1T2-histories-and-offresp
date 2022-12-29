db = cell(290,16);
for u=1:290
    stim = reshape(transpose(database_perrand{u,7}), 80,1);
    times = database_perrand{u,10};

    for iter=1:80
        sp_time = times.(strcat('iter', num2str(iter)));
        bins = fix(sp_time*1000) + 1;
        psth = zeros(1,5000);
        psth(bins) = 1;
        current_stim = stim(iter);
        db{u,current_stim} = [db{u,current_stim}; psth(1:5000)];
    end
end

%% ttest
f1=[1,3,5,7,9,11,14,15];
f2=[2,4,6,8,10,12,13,16];

h1_counter = 0;
h2_counter = 0;
for u=1:290
    % get spont
    spont = [];
    f1_rates = [];
    f2_rates = [];

    for s=1:16
        spont = [spont; mean(db{u,s}(:,451:500),2)];
        if ismember(s, f1)
            f1_rates = [f1_rates; mean(db{u,s}(:,501:550),2)];
        else
            f2_rates = [f2_rates; mean(db{u,s}(:,501:550),2)];
        end
    end

    h1 = ttest2(spont, f1_rates, 'Alpha', 0.05);
    if h1 == 1
        if mean(f1_rates) > mean(spont)
            db{u,17} = 1;   
        else
            db{u,17} = -1;
        end
        h1_counter = h1_counter + 1;
    else
        db{u,17} = 0;
    end


    h1 = ttest2(spont, f2_rates, 'Alpha', 0.05);
    if h1 == 1
        if mean(f2_rates) > mean(spont)
            db{u,18} = 1;
        else
            db{u,18} = -1;
        end
        h2_counter = h2_counter + 1;
    else
        db{u,18} = 0;
    end
end