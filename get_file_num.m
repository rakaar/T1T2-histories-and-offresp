function filenum = get_file_num(fname)
    % fname = 'EPhys_data_25-Oct-2022_13_8_56-13_unit_record.mat'
    fname_split_minus = strsplit(fname,'-');
    word_with_underscore = fname_split_minus{1,4};
    word_split_underscore = strsplit(word_with_underscore, '_');
    fnum_str = word_split_underscore{1,1};
    filenum = str2num(fnum_str);
end