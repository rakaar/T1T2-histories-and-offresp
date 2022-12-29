%% sample db creation example
for kk=1:16
    idx=find(snm==kk);
    alldata{2,kk}=psttrial(idx,:);
end

for jj=1:80
    eval(sprintf('sktms=unit_record_spike(2).negspcounts.cl1.iter%i;',jj))
    allspktms{jj}=fix(sktms*1000)+1;
    psttrial(jj,1:2000)=0;
    psttrial(jj,allspktms{jj}(find(allspktms{jj}<=2000)))=1;
end

%%  analysis code
gap = [12 18 30 56];
for jj=1:299
    for kk=1:16
        nrep=size(all_data_units{jj,kk},1);
        if nrep~=0
        respall(jj,kk,:)=mean(reshape(mean(all_data_units{jj,kk},1),5,500));
    end
    end
end

for kk=1:4
    subplot(2,2,kk),plot(squeeze(mean(squeeze(respall(:,kk+4:4:12,:))))')
    hold on
       plot(get_binned_vec(get_stimulus_shape(kk, 0.03), 5))
    
end