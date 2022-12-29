% set 1 - 187
% set 2 - 194

%% take set 2 also as iter of means
set2_units_len = 194;
for i=1:set2_units_len
    set2{i,1} = squeeze(mean(set2{i,1},2));
end
%% rates at all tokens and all gaps for different gap values
% gap
% each row is for each gap - 60, 90, 110, 130, 150, 280
% each column is a stimulus type - T T HC.... T T T
% each cell value is 6 x 1 cell array = 6 arrays 
% 1 - token1 rates, 2 - token2 rates, 3-tok3, 4-gap1,5-gap2, 6-gap3
rates_at_all_gaps_data = cell(6,4);
for r=1:6
    for c=1:4
        rates_at_all_gaps_data{r,c} = cell(6,1);
    end
end

% for 60 gap
set1_units_len = 187;
for i=1:set1_units_len
    rates = set1{i,1};
    h_vals = set1{i,2};

    

    for g=1:4:13
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{1,floor(g/4)+1}{k,1} = [rates_at_all_gaps_data{1,floor(g/4)+1}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% for 280 gap
for i=1:set1_units_len
    rates = set1{i,1};
    h_vals = set1{i,2};

    

    for g=4:4:16
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{6,floor(g/4)}{k,1} = [rates_at_all_gaps_data{6,floor(g/4)}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% for 110
for i=1:set2_units_len
    rates = set2{i,1};
    h_vals = set2{i,2};

    

    for g=2:4:14
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{3,floor(g/4)+1}{k,1} = [rates_at_all_gaps_data{3,floor(g/4)+1}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% for 130 gap
for i=1:set2_units_len
    rates = set2{i,1};
    h_vals = set2{i,2};

    

    for g=3:4:15
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{4,floor(g/4)+1}{k,1} = [rates_at_all_gaps_data{4,floor(g/4)+1}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% for 90 has to be from 2 sets
% set 1
for i=1:set1_units_len
    rates = set1{i,1};
    h_vals = set1{i,2};

    

    for g=2:4:14
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{2,floor(g/4)+1}{k,1} = [rates_at_all_gaps_data{2,floor(g/4)+1}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% for 90
% set 2
for i=1:set2_units_len
    rates = set2{i,1};
    h_vals = set2{i,2};

    

    for g=1:4:13
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{2,floor(g/4)+1}{k,1} = [rates_at_all_gaps_data{2,floor(g/4)+1}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% for 150 from 2 sets

% set 1
for i=1:set1_units_len
    rates = set1{i,1};
    h_vals = set1{i,2};

    

    for g=3:4:15
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{5,floor(g/4)+1}{k,1} = [rates_at_all_gaps_data{5,floor(g/4)+1}{k,1}  rates(g,k)];
            end
            
        end
    end

end

%% 150 - set 2

for i=1:set2_units_len
    rates = set2{i,1};
    h_vals = set2{i,2};

    

    for g=4:4:16
        if isnan(h_vals(g,1))
            continue
        end

        if h_vals(g,1) == 1 || h_vals(g,2) == 1

            for k=1:6
                rates_at_all_gaps_data{5,floor(g/4)}{k,1} = [rates_at_all_gaps_data{5,floor(g/4)}{k,1}  rates(g,k)];
            end
            
        end
    end

end

