function [inside_mean, inside_median] = remove_outside_mean_and_outside_median(arr)
    % returns 2 arrs 
    % inside_mean - within mean +/- 2 mean absolute deviation
    % inside median - within median +/- 2 median absolute deviation

    mean_arr = mean(arr);
    std_arr = std(arr);

    median_arr = median(arr);
    median_abs_dev_arr = mad(arr,1);

    inside_mean = arr(find(arr > mean_arr - 2*std_arr & arr < mean_arr + 2*std_arr));
    inside_median = arr( find(arr > median_arr - 2*median_abs_dev_arr & arr < median_arr + 2*median_abs_dev_arr) );
end