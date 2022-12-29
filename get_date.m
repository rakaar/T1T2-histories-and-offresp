function date = get_date(filename)
    % filename = 'EPhys_data_19-Oct-2022_14_6_31-11_unit_record.mat'
    filename_split = strsplit(filename, 'EPhys_data_');
    str_with_date = strsplit(filename_split{1,2}, '-2022');
    date = str_with_date{1,1};
end