clear all; close all;
stimulus_path = "D:\recheck_sorted_data\stimulus";
response_path = "D:\recheck_sorted_data\response";
raw_stimulus_path = "D:\recheck_sorted_data\raw_stimulus";

total_stimulus_duration = 2500;
stimulus_path_dir = dir(stimulus_path);
all_animals_response_cell_arr = cell(500,17);
total_iters = 80;
unit_counter = 1;

for f=3:length(stimulus_path_dir)
    stimulus_file_name = stimulus_path_dir(f).name;
    stimulus_file_path = strcat(stimulus_path, '\', stimulus_file_name);
    stimulus_matrix = load(stimulus_file_path).codes;
    stimulus_matrix_reshaped = reshape(stimulus_matrix, 1, total_iters);

    raw_file_names = strsplit(stimulus_file_name, '_stimcode');
    raw_file_name = raw_file_names{1,1};
    raw_file_name_full = strcat(raw_file_name,'.mat');
    raw_file_path = strcat(raw_stimulus_path, '\',raw_file_name_full);
    fre = load(raw_file_path).PP_PARAMS.AUD_IMG_STIM.STIMS.fre;

    response_file= strrep(stimulus_file_path, '_stimcode', '_unit_record');
    response_file = strrep(response_file,'\stimulus\','\response\');
    response_struct = load(response_file).unit_record_spike;
    
    for u=1:length(response_struct)
        response_negspiketime = response_struct(u).negspiketime;
        if isempty(response_negspiketime)
            continue
        end

        
        cluster1_response_timings = response_negspiketime.cl1;
        for iter=1:total_iters
            stimulus_played = stimulus_matrix_reshaped(1,iter);

            iter_field_str = strcat('iter',num2str(iter));
            negspike_timings = cluster1_response_timings.(iter_field_str);
            spikes_from_negspike_timings = get_spikes_from_timings(total_stimulus_duration, negspike_timings);
            

            all_animals_response_cell_arr{unit_counter, stimulus_played} = [all_animals_response_cell_arr{unit_counter, stimulus_played}; spikes_from_negspike_timings];
        end
        all_animals_response_cell_arr{unit_counter, 17} = stimulus_file_name;
        all_animals_response_cell_arr{unit_counter, 20} = fre;
        unit_counter = unit_counter + 1;
    end % end of all units
end