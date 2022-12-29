function is_same = check_stim_matrices(matrix1, matrix2)
    matrix1_reshaped = reshape(matrix1, 1, numel(matrix1));
    matrix2_reshaped = reshape(matrix2, 1, numel(matrix2));

    is_same = 1;
    for i=1:numel(matrix1)
        if matrix1_reshaped(i) ~= matrix2_reshaped(i)
            is_same = 0;
            break
        end
    end
end