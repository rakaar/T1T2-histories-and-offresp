avg_over_units = zeros(16,259,2500);
% 259
for i=1:16
    for r=1:259
        avg_over_units(i,r,:) = mean(all_animals_response_cell_arr{r,i}, 1);
    end
end



gaps = [90 110 130 150];

avg = squeeze(mean(avg_over_units, 2));


figure
for i=1:4
    subplot(2,2,i)
        hold on
            plot(avg(i:4:i+12, :).')
            gap_type = i;
            stimulus = [zeros(1,500), 0.1*ones(1,50), zeros(1,gaps(gap_type)), 0.1*ones(1,50), zeros(1,gaps(gap_type)), 0.1*ones(1,50), zeros(1,gaps(gap_type)), zeros(1, 2500 - 500 - 3*(50 + gaps(gap_type)) )  ];
            plot(stimulus)
            title(num2str(i))
        hold off
end
grid