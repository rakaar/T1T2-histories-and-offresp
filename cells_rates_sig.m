%%  cell- all units 
all_units_analysis = cell(500, 8); 
% 1 - rate 16 stim x 20 iters x 6 segments
% 2 - rate avg over iters - 16 x 6
% 3 - sig matrix - 16 x 6 bonferoni = 16
% 4 - sig val - 1 or 0 - bonferoni = 16
% 5 - sig matrix - 16 x 6 bonferoni = 96
% 6 - sig val - 1 or 0 - bonferoni = 96
% 7 - token spont
% 8 - gap spont
%% 1- rate
unit_counter = 1;
n_units = 299;  % hard coded
n_stimulus = 16;

stim_durn = 50;
off_res_comp = 20;

for u=1:n_units
    single_unit_all_stim_6segement_values = nan(n_stimulus, 20, 6); % 16 stim, max 20 rep of each stim, 6 segments
   
    for s=1:n_stimulus
        gap_type = mod(s,4);
        if gap_type == 1
            gap_durn = 60;
        elseif gap_type == 2
            gap_durn = 90;
        elseif gap_type == 3
            gap_durn = 150;
        elseif gap_type == 0
            gap_durn = 280;
        end

        token1_start_time = 501;
        token1_end_time = token1_start_time - 1 + stim_durn;

        gap1_start_time = token1_end_time + 1;
        gap1_end_time = gap1_start_time - 1 + gap_durn;

        token2_start_time = gap1_end_time + 1;
        token2_end_time = token2_start_time - 1 + stim_durn;

        gap2_start_time = token2_end_time + 1;
        gap2_end_time = gap2_start_time - 1 + gap_durn;

        token3_start_time = gap2_end_time + 1;
        token3_end_time = token3_start_time - 1 + stim_durn;

        gap3_start_time = token3_end_time + 1;
        gap3_end_time = gap3_start_time - 1 + gap_durn;

        unit_response_for_stim = all_animals_response_cell_arr{u,s};
        n_rep = size(unit_response_for_stim, 1);

       
        for n=1:n_rep
            single_rep_single_unit_single_stim_res = unit_response_for_stim(n,:);
            % stim tokens
            single_unit_all_stim_6segement_values(s,n,1) = nanmean(single_rep_single_unit_single_stim_res(1, token1_start_time:token1_end_time+off_res_comp));
            single_unit_all_stim_6segement_values(s,n,2) = nanmean(single_rep_single_unit_single_stim_res(1, token2_start_time:token2_end_time+off_res_comp));
            single_unit_all_stim_6segement_values(s,n,3) = nanmean(single_rep_single_unit_single_stim_res(1, token3_start_time:token3_end_time+off_res_comp));

            % gaps
            single_unit_all_stim_6segement_values(s,n,4) = nanmean(single_rep_single_unit_single_stim_res(1, gap1_start_time:gap1_end_time));
            single_unit_all_stim_6segement_values(s,n,5) = nanmean(single_rep_single_unit_single_stim_res(1, gap2_start_time:gap2_end_time));
            single_unit_all_stim_6segement_values(s,n,6) = nanmean(single_rep_single_unit_single_stim_res(1, gap3_start_time:gap3_end_time));
        
        end % end of a rep
    end % end of stim
    all_units_analysis{unit_counter,1} = single_unit_all_stim_6segement_values;
    unit_counter = unit_counter + 1;
end % end of unit

%% 2 -avg rate over iters
for u=1:n_units
    all_units_analysis{u,2} = squeeze(nanmean(all_units_analysis{u,1}, 2));
end
%% 3 - sig matrix - bonferoni factor - 16
stimulus_path = "D:\recheck_sorted_data\stimulus";
response_path = "D:\recheck_sorted_data\response";

total_stimulus_duration = 2500;
stimulus_path_dir = dir(stimulus_path);
total_iters = 80;
n_units = 299;
n_stimulus = 16;
alpha = 0.05;
bonferoni_factor = 16;

stim_durn = 50; gap1_durn = 60; gap2_durn = 90; gap3_durn = 150; gap4_durn = 280;
starting_pt = 500;
off_res_comp = 20;

unit_counter = 1;
for f=3:length(stimulus_path_dir)
    stimulus_file_name = stimulus_path_dir(f).name;
    stimulus_file_path = strcat(stimulus_path, '\', stimulus_file_name);
    stimulus_matrix = load(stimulus_file_path).codes;
    stimulus_matrix_reshaped = reshape(stimulus_matrix, 1, total_iters);

    response_file = strrep(stimulus_file_path, '_stimcode', '_unit_record');
    response_file = strrep(response_file,'\stimulus\','\response\');
    response_struct = load(response_file).unit_record_spike;

     for u=1:length(response_struct)
        single_unit_sig_matrix = zeros(16,6);
        response_negspiketime = response_struct(u).negspiketime;
        if isempty(response_negspiketime)
            continue
        end

        cluster1_response_timings = response_negspiketime.cl1;

        % calculate spont
        stim_spont = zeros(1, total_iters);
        gap1_spont = zeros(1, total_iters);
        gap2_spont = zeros(1, total_iters);
        gap3_spont = zeros(1, total_iters);
        gap4_spont = zeros(1, total_iters);
       

        for iter=1:80
             iter_field = strcat('iter', num2str(iter));
             negspike_timings = cluster1_response_timings.(iter_field);
             spikes_from_negspike_timings = get_spikes_from_timings(total_stimulus_duration, negspike_timings);
             stim_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-(stim_durn + off_res_comp)+1:starting_pt));  
             gap1_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap1_durn+1:starting_pt));  
             gap2_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap2_durn+1:starting_pt));  
             gap3_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap3_durn+1:starting_pt));  
             gap4_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap4_durn+1:starting_pt));  
        end

        for s=1:n_stimulus
            responses_for_single_stim = [];
            s_stim_indices = find(stimulus_matrix_reshaped == s);
            for i=1:length(s_stim_indices)
                iter_field = strcat('iter', num2str(s_stim_indices(i)));
                negspike_timings = cluster1_response_timings.(iter_field);
                spikes_from_negspike_timings = get_spikes_from_timings(total_stimulus_duration, negspike_timings);
                responses_for_single_stim = [responses_for_single_stim; spikes_from_negspike_timings];
            end
            
            n_res = size(responses_for_single_stim, 1);
            
            % sig test
            if n_res < 4
                single_unit_sig_matrix(s,1:6) = nan;
            else
             gap_type = mod(s,4);
            if gap_type == 1
                gap_durn = gap1_durn;
                gap_spont = gap1_spont;
            elseif gap_type == 2
                gap_durn = gap2_durn;
                gap_spont = gap2_spont;
            elseif gap_type == 3
                gap_durn = gap3_durn;
                gap_spont = gap3_spont;
            elseif gap_type == 0
                gap_durn = gap4_durn;
                gap_spont = gap4_spont;
            end
    
            token1_start_time = 501;
            token1_end_time = token1_start_time - 1 + stim_durn;
    
            gap1_start_time = token1_end_time + 1;
            gap1_end_time = gap1_start_time - 1 + gap_durn;
    
            token2_start_time = gap1_end_time + 1;
            token2_end_time = token2_start_time - 1 + stim_durn;
    
            gap2_start_time = token2_end_time + 1;
            gap2_end_time = gap2_start_time - 1 + gap_durn;
    
            token3_start_time = gap2_end_time + 1;
            token3_end_time = token3_start_time - 1 + stim_durn;
    
            gap3_start_time = token3_end_time + 1;
            gap3_end_time = gap3_start_time - 1 + gap_durn;
    
            % stim tokens - mean across time
            mean1 = nanmean(responses_for_single_stim(:, token1_start_time:token1_end_time + off_res_comp), 2); 
            mean2 = nanmean(responses_for_single_stim(:, token2_start_time:token2_end_time + off_res_comp), 2);
            mean3 = nanmean(responses_for_single_stim(:, token3_start_time:token3_end_time + off_res_comp), 2);
    
            % gaps
            mean4 = nanmean(responses_for_single_stim(:, gap1_start_time:gap1_end_time), 2);
            mean5 = nanmean(responses_for_single_stim(:, gap2_start_time:gap2_end_time), 2);
            mean6 = nanmean(responses_for_single_stim(:, gap3_start_time:gap3_end_time), 2);
            
            single_unit_sig_matrix(s,1) = custom_ttest2(stim_spont, mean1, 'Alpha',alpha/bonferoni_factor);
            single_unit_sig_matrix(s,2) = custom_ttest2(stim_spont, mean2, 'Alpha',alpha/bonferoni_factor); 
            single_unit_sig_matrix(s,3) = custom_ttest2(stim_spont, mean3, 'Alpha',alpha/bonferoni_factor);
    
            single_unit_sig_matrix(s,4) = custom_ttest2(gap_spont, mean4, 'Alpha',alpha/bonferoni_factor);
            single_unit_sig_matrix(s,5) = custom_ttest2(gap_spont, mean5, 'Alpha',alpha/bonferoni_factor);
            single_unit_sig_matrix(s,6) = custom_ttest2(gap_spont, mean6, 'Alpha',alpha/bonferoni_factor);
        end
            
        end % end of all stimulus

        all_units_analysis{unit_counter, 3} = single_unit_sig_matrix;
        all_units_analysis{unit_counter, 7} = stim_spont;
        all_units_analysis{unit_counter, 8} = gap_spont;
       
        

        unit_counter = unit_counter + 1;    
     end % end of unit
end % end of all files

%% 4 - sig value - bonferoni value - 16
for u=1:n_units
    per_unit_sig_matrix = all_units_analysis{u,3};
    h_values_is1_per_stim = zeros(1, n_stimulus); % for a single stim, out of 6 segments if any segment as 1
    
    for s=1:n_stimulus
        if any(per_unit_sig_matrix(s,:) == 1)
            h_values_is1_per_stim(1,s) = 1;
        end
    end
    
    
    if any(h_values_is1_per_stim == 1) || any(h_values_is1_per_stim == -1)
        all_units_analysis{u,4} = 1;
    else
        all_units_analysis{u,4} = 0;
    end
end
%% num of sig units with bonferoni = 16
sig_bf_16 = 0;
for u=1:n_units
    if all_units_analysis{u,4} == 1 || all_units_analysis{u,4} == -1
        sig_bf_16 = sig_bf_16 + 1;
    end
end

disp(sig_bf_16)
%% 5 - sig matrix - bonferoni factor - 96
stimulus_path = "D:\recheck_sorted_data\stimulus";
response_path = "D:\recheck_sorted_data\response";

total_stimulus_duration = 2500;
stimulus_path_dir = dir(stimulus_path);
total_iters = 80;
n_units = 299;
n_stimulus = 16;
alpha = 0.05;
bonferoni_factor = 96;

stim_durn = 50; gap1_durn = 60; gap2_durn = 90; gap3_durn = 150; gap4_durn = 280;
starting_pt = 500;
off_res_comp = 20;

units_sig_matrix = cell(500,2); % the cell arr
unit_counter = 1;
for f=3:length(stimulus_path_dir)
    stimulus_file_name = stimulus_path_dir(f).name;
    stimulus_file_path = strcat(stimulus_path, '\', stimulus_file_name);
    stimulus_matrix = load(stimulus_file_path).codes;
    stimulus_matrix_reshaped = reshape(stimulus_matrix, 1, total_iters);

    response_file = strrep(stimulus_file_path, '_stimcode', '_unit_record');
    response_file = strrep(response_file,'\stimulus\','\response\');
    response_struct = load(response_file).unit_record_spike;

     for u=1:length(response_struct)
        single_unit_sig_matrix = zeros(16,6);
        response_negspiketime = response_struct(u).negspiketime;
        if isempty(response_negspiketime)
            continue
        end

        cluster1_response_timings = response_negspiketime.cl1;

        % calculate spont
        stim_spont = zeros(1, total_iters);
        gap1_spont = zeros(1, total_iters);
        gap2_spont = zeros(1, total_iters);
        gap3_spont = zeros(1, total_iters);
        gap4_spont = zeros(1, total_iters);
       

        for iter=1:80
             iter_field = strcat('iter', num2str(iter));
             negspike_timings = cluster1_response_timings.(iter_field);
             spikes_from_negspike_timings = get_spikes_from_timings(total_stimulus_duration, negspike_timings);
             stim_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-(stim_durn + off_res_comp)+1:starting_pt));  
             gap1_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap1_durn+1:starting_pt));  
             gap2_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap2_durn+1:starting_pt));  
             gap3_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap3_durn+1:starting_pt));  
             gap4_spont(1,iter) = nanmean(spikes_from_negspike_timings(1, starting_pt-gap4_durn+1:starting_pt));  
        end

        for s=1:n_stimulus
            responses_for_single_stim = [];
            s_stim_indices = find(stimulus_matrix_reshaped == s);
            for i=1:length(s_stim_indices)
                iter_field = strcat('iter', num2str(s_stim_indices(i)));
                negspike_timings = cluster1_response_timings.(iter_field);
                spikes_from_negspike_timings = get_spikes_from_timings(total_stimulus_duration, negspike_timings);
                responses_for_single_stim = [responses_for_single_stim; spikes_from_negspike_timings];
            end
            
            n_res = size(responses_for_single_stim, 1);
            
            % sig test
            if n_res < 4
                single_unit_sig_matrix(s,1:6) = nan;
            else
             gap_type = mod(s,4);
            if gap_type == 1
                gap_durn = gap1_durn;
                gap_spont = gap1_spont;
            elseif gap_type == 2
                gap_durn = gap2_durn;
                gap_spont = gap2_spont;
            elseif gap_type == 3
                gap_durn = gap3_durn;
                gap_spont = gap3_spont;
            elseif gap_type == 0
                gap_durn = gap4_durn;
                gap_spont = gap4_spont;
            end
    
            token1_start_time = 501;
            token1_end_time = token1_start_time - 1 + stim_durn;
    
            gap1_start_time = token1_end_time + 1;
            gap1_end_time = gap1_start_time - 1 + gap_durn;
    
            token2_start_time = gap1_end_time + 1;
            token2_end_time = token2_start_time - 1 + stim_durn;
    
            gap2_start_time = token2_end_time + 1;
            gap2_end_time = gap2_start_time - 1 + gap_durn;
    
            token3_start_time = gap2_end_time + 1;
            token3_end_time = token3_start_time - 1 + stim_durn;
    
            gap3_start_time = token3_end_time + 1;
            gap3_end_time = gap3_start_time - 1 + gap_durn;
    
           % stim tokens
            mean1 = nanmean(responses_for_single_stim(:, token1_start_time:token1_end_time + off_res_comp), 2); 
            mean2 = nanmean(responses_for_single_stim(:, token2_start_time:token2_end_time + off_res_comp), 2);
            mean3 = nanmean(responses_for_single_stim(:, token3_start_time:token3_end_time + off_res_comp), 2);
    
            % gaps
            mean4 = nanmean(responses_for_single_stim(:, gap1_start_time:gap1_end_time), 2);
            mean5 = nanmean(responses_for_single_stim(:, gap2_start_time:gap2_end_time), 2);
            mean6 = nanmean(responses_for_single_stim(:, gap3_start_time:gap3_end_time), 2);
            
            single_unit_sig_matrix(s,1) = custom_ttest2(stim_spont, mean1, 'Alpha',alpha/bonferoni_factor);
            single_unit_sig_matrix(s,2) = custom_ttest2(stim_spont, mean2, 'Alpha',alpha/bonferoni_factor); 
            single_unit_sig_matrix(s,3) = custom_ttest2(stim_spont, mean3, 'Alpha',alpha/bonferoni_factor);
    
            single_unit_sig_matrix(s,4) = custom_ttest2(gap_spont, mean4, 'Alpha',alpha/bonferoni_factor);
            single_unit_sig_matrix(s,5) = custom_ttest2(gap_spont, mean5, 'Alpha',alpha/bonferoni_factor);
            single_unit_sig_matrix(s,6) = custom_ttest2(gap_spont, mean6, 'Alpha',alpha/bonferoni_factor);
            
        end
            
        end % end of all stimulus

        all_units_analysis{unit_counter, 5} = single_unit_sig_matrix;
        unit_counter = unit_counter + 1;    
     end % end of unit
end % end of all files

%% 6 - sig value - bonferoni value - 96
for u=1:n_units
    per_unit_sig_matrix = all_units_analysis{u,5};
    h_values_is1_per_stim = zeros(1, n_stimulus); % for a single stim, out of 6 segments if any segment as 1
    
    for s=1:n_stimulus
        if any(per_unit_sig_matrix(s,:) == 1)
            h_values_is1_per_stim(1,s) = 1;
        end
    end
    
    if any(h_values_is1_per_stim == 1)
        all_units_analysis{u,6} = 1;
    else
        all_units_analysis{u,6} = 0;
    end
end

%% num of sig units with bonferoni = 96
sig_bf_96 = 0;
for u=1:n_units
    if all_units_analysis{u,6} == 1
        sig_bf_96 = sig_bf_96 + 1;
    end
end

disp(sig_bf_96)

