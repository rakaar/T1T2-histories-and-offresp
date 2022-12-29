%% rounding off BFs properly
% set 1
bfs = [];
for u=1:299
    bfs = [bfs set1_bf{u,18}];
end

% disp(bfs)
bf = unique(bfs);

%% change by floors
floors_bf = [ 6     8    12    16    24    33];
for u=1:299
    bf = set1_bf{u,18};
    if floor(bf/1000) == 6
        set1_bf{u,19} = 6000;
    elseif floor(bf/1000) == 8
        set1_bf{u,19} = 8500;
    elseif floor(bf/1000) == 12
        set1_bf{u,19} = 12000;
   elseif floor(bf/1000) == 16
        set1_bf{u,19} = 17000;
    elseif floor(bf/1000) == 24
        set1_bf{u,19} = 24000;
    elseif floor(bf/1000) == 33
        set1_bf{u,19} = 34000;
    end
end

%% testing rounding off
for u=1:299 
    if abs(set1_bf{u,19} - set1_bf{u,18}) > 100
        disp('issue')
    end
end
disp('no issue')
%% set 2
bfs = [];
for u=1:259
    bfs = [bfs bf_data{u,18}];
end

% disp(bfs)
bf = unique(bfs);
%% round off bfs set 2
floors_bf = [6     8    12    16    24    33    48];
for u=1:259
    bf = bf_data{u,18};
    if isempty(bf)
        continue
    end
    if floor(bf/1000) == 6
        bf_data{u,19} = 6000;
    elseif floor(bf/1000) == 8
        bf_data{u,19} = 8500;
    elseif floor(bf/1000) == 12
        bf_data{u,19} = 12000;
   elseif floor(bf/1000) == 16
        bf_data{u,19} = 17000;
    elseif floor(bf/1000) == 24
        bf_data{u,19} = 24000;
    elseif floor(bf/1000) == 33
        bf_data{u,19} = 34000;
    elseif floor(bf/1000) == 48
        bf_data{u,19} = 48000;
    end
end

% --  COULD HAVE DONE ceil(/1000)*1000

%% testing rounding off
for u=1:259 
    if isempty(bf_data{u,18})
        continue
    end
    if abs(bf_data{u,19} - bf_data{u,18}) > 100
        disp('issue')
    end
end
disp('no issue')

