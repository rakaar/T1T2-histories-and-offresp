    %% set2 
bf_data = load("D:\da\t1t2_set2_bf.mat").all_animals_response_cell_arr;
for u=1:259
        fre = all_animals_response_cell_arr{u,20}; % fre
        bf_data{u,20} = fre;
        if ~strcmp(bf_data{u,17},all_animals_response_cell_arr{u,17})
            disp("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        end
end

%% diff 
for u=1:259
    if ~isempty(bf_data{u,18})
        bf_data{u,21} = bf_data{u,20} - bf_data{u,18};
    end
end
%%
set1_bf = load("D:\da\t1t2_set1_with_bf.mat");
set1_bf = set1_bf.s_111_ONE;
for u=1:299
    set1_bf{u,20} = all_animals_response_cell_arr{u,20};
    if ~isempty(set1_bf{u,18})
        set1_bf{u,21} = all_animals_response_cell_arr{u,20} - set1_bf{u,18};
    end

    if ~strcmp(set1_bf{u,17}, all_animals_response_cell_arr{u,17})
        disp('XXXXXXXXXXXXXXXXXXXX ISSUE ')
    end

end

%% 
s2 = [];
for i=1:259
    if ~isempty(bf_data{i,21})
        s2 = [s2 bf_data{i,21}];
    end
end

s1 = [];
for i=1:299
    if ~isempty(set1_bf{i,21})
        s1 = [s1 set1_bf{i,21}];
    end
end

figure
    hist(s2)
grid

figure
    hist(s1)
grid

s3 = [s1 s2];
figure
    hist(s3)
grid