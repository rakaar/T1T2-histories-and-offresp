n_units = 299;
filename_stimlus_cell_arr = cell(n_units,3); % filename, response file, stimulus 80 x 1
stimulus_path = "D:\recheck_sorted_data\stimulus";
stimulus_path_dir = dir(stimulus_path);
unit_counter = 1;

for f=3:length(stimulus_path_dir)
    stimulus_file_name = stimulus_path_dir(f).name;
    stimulus_file_path = strcat(stimulus_path, '\', stimulus_file_name);
    stimulus_matrix = load(stimulus_file_path).codes;
    stimulus_matrix_reshaped = reshape(stimulus_matrix, 1, total_iters);
   
     response_file= strrep(stimulus_file_path, '_stimcode', '_unit_record');
    response_file = strrep(response_file,'\stimulus\','\response\');
    response_struct = load(response_file).unit_record_spike;

     for u=1:length(response_struct)
        response_negspiketime = response_struct(u).negspiketime;
        if isempty(response_negspiketime)
            continue
        end
     
         filename_stimlus_cell_arr{unit_counter,1} = stimulus_file_name;

         response_file_name = strrep(stimulus_file_name, '_stimcode', '');
         filename_stimlus_cell_arr{unit_counter,2} = response_file_name;
         
         filename_stimlus_cell_arr{unit_counter,3} = stimulus_matrix_reshaped;
         
       unit_counter = unit_counter + 1;
     end
end

%% compare directly with raw data
raw_data_path = "D:\all_raw_ep";
for u=1:n_units
     ep_file_name = filename_stimlus_cell_arr{u,2};
     disp('checking')
     disp(ep_file_name)
     raw_data_file_path = strcat(raw_data_path, '\', ep_file_name);
     raw_data_pp_params = load(raw_data_file_path,'PP_PARAMS').PP_PARAMS;
     stim_matrix = transpose(raw_data_pp_params.AUD_IMG_STIM.STIMS.stimcode_HC);
     sorted_stim_matrix = filename_stimlus_cell_arr{u,3};

     if check_stim_matrices(sorted_stim_matrix, stim_matrix) ~= 1
        disp(ep_file_name)
        disp('*****************************ISSUE****************')
        break
     elseif check_stim_matrices(sorted_stim_matrix, stim_matrix) == 1
         disp("okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk")
     end
end

%% add significance also in filename stimulus mapping
for u=1:n_units
    filename_stimlus_cell_arr{u,4} = units_sig_matrix{u,2};
end
%% mapping of only signicant ones
filename_stimulus_only_sig_cell = cell(200,3);
n_units = 299;
u_counter = 1;
for u=1:n_units
    if filename_stimlus_cell_arr{u,4} == 1
        filename_stimulus_only_sig_cell{u_counter,1} = filename_stimlus_cell_arr{u,1};
        filename_stimulus_only_sig_cell{u_counter,2} = filename_stimlus_cell_arr{u,2};
        filename_stimulus_only_sig_cell{u_counter,3} = filename_stimlus_cell_arr{u,3};
        
        u_counter = u_counter + 1;
    end
end
%% WRONG - check first t1 responses, t1t2 responses, averaging and checking doesn't make sense. see for indiv units

first_token_t1_responses = zeros(1,8);
sem_first_token_t1_responses = zeros(1,8);

first_token_t1t2_responses = zeros(1,8);
sem_first_token_t1t2_responses = zeros(1,8);

t1_stim = [1:4, 13:16];
t1t2_stim = [5:8, 9:12];

all_stim_mean_response = zeros(n_stimulus, total_stimulus_duration);
all_stim_std_response = zeros(n_stimulus, total_stimulus_duration);
n_units = 184;

for s=1:n_stimulus
    all_units_single_stim_matrix = [];
    for u=1:n_units
        all_units_single_stim_matrix = [all_units_single_stim_matrix; only_sig_units_db{u,s}];
    end

    mean_single_stim_all_units_response = mean(all_units_single_stim_matrix,1);
    all_stim_mean_response(s,:) = mean_single_stim_all_units_response;
    all_stim_std_response(s,:) = std(all_units_single_stim_matrix,1);
end

token_start_time = 501;
token_end_time = 550;

for i=1:length(t1_stim)
    t1_set_num = t1_stim(i);
    first_token_t1_responses(1,i) = mean(all_stim_mean_response(t1_set_num, token_start_time:token_end_time));
    sem_first_token_t1_responses(1,i) = std(all_stim_mean_response(t1_set_num, token_start_time:token_end_time))/50;

    t1t2_set_num = t1t2_stim(i);
    first_token_t1t2_responses(1,i) = mean(all_stim_mean_response(t1t2_set_num, token_start_time:token_end_time));
    sem_first_token_t1t2_responses(1,i) = std(all_stim_mean_response(t1t2_set_num, token_start_time:token_end_time))/50;
end

figure
    plot(first_token_t1_responses)
    title('t1 501 to 550')
grid

figure
    plot(first_token_t1t2_responses)
    title('t1t2 501 to 550')
grid

% sem
figure
    errorbar(1:8,first_token_t1_responses, sem_first_token_t1_responses)
    title('err bar t1 501 to 550')
grid

figure
    errorbar(1:8, first_token_t1t2_responses,sem_first_token_t1t2_responses)
    title('err bart1t2 501 to 550')
grid
%% for each unit check first 50ms response for t1 and t1t2
clc
close all
n_units = 184;
t1_response_8_stim = zeros(n_units, 8);
t1t2_response_8_stim = zeros(n_units, 8);

t1_stim = [1:4, 13:16];
t1t2_stim = [5:8, 9:12];
end_time = 570;

for i=1:length(t1_stim)
    t1_stim_set = t1_stim(i);
    t1t2_stim_set = t1t2_stim(i);

    for u=1:n_units
       t1_stim_res  = only_sig_units_db{u,t1_stim_set};
       t1_stim_res_avg = mean(t1_stim_res, 1);
       t1_token_res = mean(t1_stim_res_avg(1, 501:end_time));
       t1_response_8_stim(u,i) = t1_token_res;

       t1t2_stim_res  = only_sig_units_db{u,t1t2_stim_set};
       t1t2_stim_res_avg = mean(t1t2_stim_res, 1);
       t1t2_token_res = mean(t1t2_stim_res_avg(1, 501:end_time));
       t1t2_response_8_stim(u,i) = t1t2_token_res;
    end
end

u1 = 1;
u2 = 184;
figure
    plot(t1_response_8_stim(u1:u2,:).')
    title(['t1 response-501 to 550-',num2str(n_units)])
grid


figure
    plot(t1t2_response_8_stim(u1:u2,:).')
    title(['t1t2 response-501 to 550-',num2str(n_units)])
grid

variance_t1 = zeros(1, n_units);
variance_t1t2 = zeros(1, n_units);

for u=1:n_units
    variance_t1(1,u) = std(t1_response_8_stim(u,:));
    variance_t1t2(1,u) = std(t1t2_response_8_stim(u,:));
end

figure
    plot(variance_t1)
    title('variance t1')
grid

figure
    plot(variance_t1t2)
    title('variance t1t2')
grid

t1_gaps_s1to4 = t1_response_8_stim(:, 1:4);
t1_gaps_s1to4_avg = mean(t1_gaps_s1to4, 2);

t1_gaps_s13to16 = t1_response_8_stim(:, 5:8);
t1_gaps_s13to16_avg = mean(t1_gaps_s13to16, 2);

figure
    scatter(t1_gaps_s1to4_avg, t1_gaps_s13to16_avg);
    title('1 to 4 vs 13 to 16')
grid

[h,p] = ttest(t1_gaps_s1to4_avg, t1_gaps_s13to16_avg)

t1t2_gaps_s1to4 = t1t2_response_8_stim(:, 1);
t1t2_gaps_s1to4_avg = mean(t1t2_gaps_s1to4, 2);

t1t2_gaps_s13to16 = t1t2_response_8_stim(:, 5);
t1t2_gaps_s13to16_avg = mean(t1t2_gaps_s13to16, 2);

figure
    scatter(t1t2_gaps_s1to4_avg, t1t2_gaps_s13to16_avg);
    title('t1t2')
grid

[h,p] = ttest(t1t2_gaps_s1to4_avg, t1t2_gaps_s13to16_avg)