psth = zeros(290,4);
s=8;
for i=1:290
    rates = all_unit_all_stimrates_avg{i,1};
    psth(i,:) = rates(s,:);
end

figure
    plot(psth(:,1:3).')
grid


%% s = 1
s = 1;
x = [];
for i=1:290
    x = [x; mean(psth_stimlines_chk{i,s},1)];
end

figure
    imagesc(squeeze(mean(reshape(x, 290,10,500), 2)))
grid

stim = [zeros(1,500)];
for i=1:36
stim = [stim 0.4*ones(1,30) zeros(1,70)];
end
stim = [stim zeros(1,900)];
stim_reshape = mean(reshape(stim, 10,500), 1);

figure
    plot(squeeze(mean(reshape(x, 290,10,500), 2)).')
    hold on
    plot(stim_reshape)
    hold off
grid
%%
x = [];
for i=1:16
    p = psth_stimlines_chk{1,i};
    p = mean(p,1);
    p = mean(reshape(p,10,500),1);
    x = [x; p];
end

figure
imagesc(x)
grid

%%
figure
    p = psth_stimlines_chk{200,6};
    imagesc(p(:,501:550))
grid
%% 
x = []
for i=1:290
    for s=1:16
        p = psth_stimlines_chk{i,s};
        for r=1:5
            x = [x; sum(p(r,501:550))];
        end
    end
    
end

figure
    plot(mean(reshape(x,5,23200/5),1))
grid
rate = mean(reshape(x,5,23200/5),1);

%% 
%% 
x = []
for i=1:290
    for s=1:16
        p = psth_stimlines_chk{i,s};
        for r=1:5
            x = [x; sum(p(r,451:500))];
        end
    end
    
end


figure
    plot(mean(reshape(x,5,23200/5),1))
    title('spt')
    grid
spt = mean(reshape(x,5,23200/5),1);
%% 
f1=[1,3,5,7,9,11,14,15];
f2=[2,4,6,8,10,12,13,16];

x = psth_stimlines_chk{122,1};
figure
    imagesc(x)
grid