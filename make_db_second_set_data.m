clear all
close all
data_path = "D:\t1t2_new_set";
% PP_PARAMS.AUD_IMG_STIM.STIMS.fre
total_stimulus_duration = 2500;
stimulus_path_dir = dir(data_path);
% all_animals_response_cell_arr = cell(500,16);
all_animals_response_cell_arr = cell(500,17); % 17 - filename
total_iters = 80;
unit_counter = 1;

for f=3:length(stimulus_path_dir)
    stimulus_file_name = stimulus_path_dir(f).name;
    stimulus_file_path = strcat(data_path, '\', stimulus_file_name);
    STIMS = load(stimulus_file_path).PP_PARAMS.AUD_IMG_STIM.STIMS;
    fre = load(stimulus_file_path).PP_PARAMS.AUD_IMG_STIM.STIMS.fre;

    if isfield(STIMS,'stimcode_HC')
        stimulus_matrix = STIMS.stimcode_HC;
    else
        disp(stimulus_file_path)
        continue
    end
    
    stimulus_matrix_reshaped = reshape(transpose(stimulus_matrix), 1, total_iters);

    response_file = stimulus_file_path; % both are in same file this time
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

        all_animals_response_cell_arr{unit_counter,17} = stimulus_file_name;
        all_animals_response_cell_arr{unit_counter,20} = fre;

        unit_counter = unit_counter + 1;
    end % end of all units
end