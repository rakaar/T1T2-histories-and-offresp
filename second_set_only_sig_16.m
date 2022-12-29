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