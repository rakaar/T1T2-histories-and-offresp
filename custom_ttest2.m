function h = custom_ttest2(arr1, arr2, alpha_str, alpha_value)
    % arr1:  spont
    % arr2:  response

    h_val = ttest2(arr1, arr2, alpha_str, alpha_value);
    if h_val == 1
        if nanmean(arr2) > nanmean(arr1)
            h = 1;
        else
            disp('-1')
            h = -1;
        end
    else
        h = 0;
    end


end