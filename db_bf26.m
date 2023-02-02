%% 
n_units = 299;
set1_bf26 = cell(299,1);
bf = 26;
new_alpha = 0.05/bf;
gaps = [60 90 150 280 60 90 150 280 60 90 150 280 60 90 150 280];
%% 
c = 1;
for u=1:n_units
    % per unit matrix
    sig_matrix = zeros(16,3);
    
    % spont 
    all_rates =  all_animals_response_cell_arr(u,1:16);
    spont_res = [];
%     spont_60 = [];
%     spont_90 = [];
%     spont_150 = [];
%     spont_280 = [];
    for s=1:16
        res_s = all_rates{1,s};
        n_iters = size(res_s,1);
        for i=1:n_iters
            spont_res = [spont_res mean(res_s(i,431:500))];
            % for gaps, 20 ms removed due to off latency from response period
%             spont_60 = [spont_60 mean(res_s(i,461:500))];
%             spont_90 = [spont_90 mean(res_s(i,431:500))];
%             spont_150 = [spont_150 mean(res_s(i,371:500))];
%             spont_280 = [spont_280 mean(res_s(i,241:500))];
            
        end
    end

    % seg 1 - tone
    t_res = all_animals_response_cell_arr(u,[1:4 13:16]);
    t_res_tok1 = [];
    for s=1:8
        t_res_s = t_res{1,s};
        n_iters = size(t_res_s,1);
        for i=1:n_iters
            t_res_tok1 = [t_res_tok1 mean(t_res_s(i,501:570))];
        end
    end 

    % seg 1 - hc
    hc_res = all_animals_response_cell_arr(u,[5:8 9:12]);
    hc_res_tok1 = [];
    for s=1:8
        hc_res_s = hc_res{1,s};
        n_iters = size(hc_res_s,1);
        for i=1:n_iters
            hc_res_tok1 = [hc_res_tok1 mean(hc_res_s(i,501:570))];
        end
    end
    
    h_t = custom_ttest2(spont_res, t_res_tok1, 'Alpha',new_alpha);
    h_hc = custom_ttest2(spont_res, hc_res_tok1, 'Alpha', new_alpha);

    sig_matrix([1:4 13:16],1) = h_t;
    sig_matrix([5:8 9:12],1) = h_hc;

    % seg 2 - token
    % 60 - t t 
    res_tt60 = all_animals_response_cell_arr(u,[1 13]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,611:680))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([1 13],2) = h;
    
    % 60 - h h
    res_tt60 = all_animals_response_cell_arr(u,[5 9]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,611:680))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([5 9],2) = h;

    % 90 - t t
    res_tt60 = all_animals_response_cell_arr(u,[2 14]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,641:710))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([2 14],2) = h;

    % 90 - h h 
    res_tt60 = all_animals_response_cell_arr(u,[6 10]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,641:710))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([6 10],2) = h;

    % 150 t t
    res_tt60 = all_animals_response_cell_arr(u,[3 15]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,701:770))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([3 15],2) = h;

    % 150 - h h
    res_tt60 = all_animals_response_cell_arr(u,[7 11]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,701:770))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([7 11],2) = h;

    % 280 - t t
    res_tt60 = all_animals_response_cell_arr(u,[4 16]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,831:900))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([4 16],2) = h;

    % 280 - h h
    res_tt60 = all_animals_response_cell_arr(u,[8 12]);
    res_tt60_mean_rates = [];
    for s=1:2
        rate_s = res_tt60{1,s};
        n_iters = size(rate_s,1);
        for i=1:n_iters
            res_tt60_mean_rates = [res_tt60_mean_rates mean(rate_s(i,831:900))]; 
        end 
    end
    h = custom_ttest2(spont_res, res_tt60_mean_rates, 'Alpha', new_alpha);
    sig_matrix([8 12],2) = h;



    % seg 3 - token
    for s=1:16
        mean_rates = [];
        start_time = 501 + (2*50) + (2*gaps(s));
        end_time = start_time + 69;
        rate_s = all_animals_response_cell_arr{u,s};
        if ~isempty(rate_s)
            n_iters = size(rate_s,1);
            for i=1:n_iters
                mean_rates = [mean_rates mean(rate_s(i,start_time:end_time))];
            end
            h = custom_ttest2(spont_res, mean_rates, 'Alpha', new_alpha);
            sig_matrix(s,3) = h;
        else
            sig_matrix(s,3) = nan;  
        end
    end

    set1_bf26{u,1} = sig_matrix;

    nanmean_h = nanmean( reshape(sig_matrix, numel(sig_matrix),1) );
    if nanmean_h == 0
        set1_bf26{u,2} = 0;
    else
        set1_bf26{u,2} = 1;
        c = c + 1;
    end

end % end of u

%% 
disp(c)
%% 
set1_rates_and_sig = load('set1_rates_and_sig.mat').set1_rates_and_sig;
%% 9 10
for u=1:299
    set1_rates_and_sig{u,9} = set1_bf26{u,1};
    set1_rates_and_sig{u,10} = set1_bf26{u,2};
end
%% 
save('set1_rates_and_sig.mat', "set1_rates_and_sig")