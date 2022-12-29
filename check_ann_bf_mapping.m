%% set 2 analysis
% AD db mapping - 'date-num': bf
% get_file_num
% get date
%% AD 
AD_map = containers.Map;
% AD_map('1') = 2;  
for i=1:259
    filename = all_animals_response_cell_arr{i,17};
    f_num = num2str(get_file_num(filename));
    f_date = get_date(filename);
    key = strcat(f_date, '-', f_num);
    
    bf = all_animals_response_cell_arr{i,18};
    if isempty(bf)
        bf = -1;
    end

    if isKey(AD_map, key)
        AD_map(key) = [AD_map(key) bf];
    else
        AD_map(key) = [bf];
    end
end

%% AS map - AS db mapping  - 'date-num': bf
AS_map = containers.Map;
% AD_map('1') = 2;  
for i=2:291
    filename = database_perrand{i,11};
    f_num = num2str(get_file_num(filename));
    f_date = get_date(filename);
    key = strcat(f_date, '-', f_num);
    
    bf = database_perrand{i,6};
    if isempty(bf)
        bf = -1;
    end

    if length(bf) ~= 1
        disp(i)
        disp('XXXXXXXXXXXXXXXX')
    end

    if isKey(AS_map, key)
        AS_map(key) = [AS_map(key) bf];
    else
        AS_map(key) = [bf];
    end
end

%% % AD - AS mapping  - 'date-num': 'date-num'
AD_AS_map = containers.Map;
AD_AS_map('25-Oct-12') = '25-Oct-9';    
AD_AS_map('25-Oct-15') = '25-Oct-14';    
AD_AS_map('25-Oct-18') = '25-Oct-17';    
AD_AS_map('25-Oct-26') = '25-Oct-25';    
AD_AS_map('25-Oct-29') = '25-Oct-28';    
AD_AS_map('25-Oct-32') = '25-Oct-31';    
AD_AS_map('25-Oct-42') = '25-Oct-43';    

AD_AS_map('19-Oct-11') = '19-Oct-10';

AD_AS_map('26-Oct-3') = '26-Oct-2';    
AD_AS_map('26-Oct-6') = '26-Oct-5';    
AD_AS_map('26-Oct-9') = '26-Oct-8';    
AD_AS_map('26-Oct-19') = '26-Oct-17';    
AD_AS_map('26-Oct-29') = '26-Oct-27';    
AD_AS_map('26-Oct-32') = '26-Oct-30';    
AD_AS_map('26-Oct-40') = '26-Oct-39';    
AD_AS_map('26-Oct-41') = '26-Oct-39';    
AD_AS_map('26-Oct-58') = '26-Oct-57';    
AD_AS_map('26-Oct-59') = '26-Oct-48';    

AD_AS_map('28-Oct-4') = '28-Oct-3';    
AD_AS_map('28-Oct-8') = '28-Oct-6';    
AD_AS_map('28-Oct-14') = '28-Oct-12';    
AD_AS_map('28-Oct-17') = '28-Oct-15';    
AD_AS_map('28-Oct-20') = '28-Oct-18';    
AD_AS_map('28-Oct-23') = '28-Oct-22';


%% the final check
not_in_AS_DB = containers.Map;
not_in_AS_AD_map = containers.Map;
error = containers.Map;

for i=1:259
    filename = all_animals_response_cell_arr{i,17};
    f_num = num2str(get_file_num(filename));
    f_date = get_date(filename);
    key = strcat(f_date, '-', f_num);
    AD_bfs = AD_map(key);

    if ~isKey(AD_AS_map,key)
        disp('NOT IN AD AS MAP')
        not_in_AS_AD_map(key) = 1;
        continue
    end
    AS_key = AD_AS_map(key);
    if ~isKey(AS_map, AS_key)
        disp('NOT IN AS DB')
        not_in_AS_DB(AS_key) = 1;
        continue
    end
    AS_bfs = AS_map(AS_key);

    diff = abs(AD_bfs - AS_bfs);
    no_err = 1;
    disp('XXXXXXXXXXXXXXXXXXXXXXX')
    if sum(diff) ~= 0
        disp(i)
        disp(key)
        disp(AS_key)
        no_err = 0;
        error(AS_key) = 1;
    else
        disp('CORRECT')
    end

    disp(no_err)

end



