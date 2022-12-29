% clear all;
% currdir=(pwd);
% maindir='D:\ami_hc_new_data_ephys\sorted data';
% cd (maindir)
% num_dir=length(dir)-2;
% name_dir=dir;
% count=0;
% totdur=2.5;
% bin_size=.01;
% diif_bin_sizes=[0.01 0.02 0.05];
% file_count=0;
% currdir=(pwd);
% % 
% % 
% maindir='D:\ami_hc_new_data_ephys\sorted data\15722_pv_gf_yes';
% cd (maindir)
% mat_files=dir('*.mat')
% for a_all = 1:length(mat_files)
% all_sorted_files{end+1}=load(mat_files(a_all).name);
% %all_sorted_files{a_all}=load(mat_files(a_all).name);
% end
% 
% 
% 
% maindir='D:\ami_hc_new_data_ephys\sorted data\15722_pv_gf_yes\stimcodes';
% cd (maindir)
% mat_files=dir('*.mat')
% for a_all = 1:length(mat_files)
% %all_sorted_files_stimcodes{a_all}=load(mat_files(a_all).name);
% all_sorted_files_stimcodes{end+1}=load(mat_files(a_all).name);
% end
% % %% appending code
% save all_sorted_files all_sorted_files;
% save all_sorted_files_stimcodes all_sorted_files_stimcodes;
% %  


all_data_units_trial=cell(500,16);
x=0;
for all_files=1:length(all_sorted_files)% 31 files
    if all_files >= 15 && all_files <= 21
        continue
    end
    stimulus_all_iters=all_sorted_files_stimcodes{1,all_files}.codes(:);% for all 16 stimulus
    for stimulus_count=1:16
        stim_pos_iter=find(stimulus_count==stimulus_all_iters);
         unit_count=0;
        for units=1:length(all_sorted_files{1,all_files}.unit_record_spike)  % channels
            if ~isempty (all_sorted_files{1,all_files}.unit_record_spike(units).negspiketime)
                unit_count=unit_count+1;
                for iters=1:80
                    eval(sprintf('sktms=all_sorted_files{1,all_files}.unit_record_spike(units).negspiketime.cl1.iter%i;',iters))
                    allspktms{iters}=fix(sktms*1000)+1;
                    psttrial(iters,1:2500)=0;
                    psttrial(iters,allspktms{iters}(find(allspktms{iters}<=2500)))=1;
                    disp(size(psttrial))
                end
               all_data_units_trial{x+unit_count,stimulus_count}=[all_data_units_trial{x+unit_count, stimulus_count};psttrial(stim_pos_iter,:)];      
            
            end
        end
    end
    x=x+unit_count;
end 

%%%% animal database





%%  
% all_data_units=cell(500,16);
% x=0;
% for all_files=1:length(all_sorted_files)% 31 files
%     stimulus_all_iters=all_sorted_files_stimcodes{1,all_files}.codes(:);% for all 16 stimulus
%     for stimulus_count=1:16
%         stim_pos_iter=find(stimulus_count==stimulus_all_iters);
%          unit_count=0;
%         for units=1:16  % channels
%             if ~isempty (all_sorted_files{1,all_files}.unit_record_spike(units).negspiketime)
%                 unit_count=unit_count+1;
%                 for iters=1:80
%                     eval(sprintf('sktms=all_sorted_files{1,all_files}.unit_record_spike(units).negspiketime.cl1.iter%i;',iters))
%                     allspktms{iters}=fix(sktms*1000)+1;
%                     psttrial(iters,1:4100)=0;
%                     psttrial(iters,allspktms{iters}(find(allspktms{iters}<=4100)))=1;
%                 end     
%             end
%           all_data_units{x+unit_count,stimulus_count}=[all_data_units{x+unit_count, stimulus_count};psttrial(stim_pos_iter,:)];      
%         end
%     end
%     x=x+unit_count;
% end 
% %%
% 
% 
%         fname='EPhys_data_06-Jul-2022_12_28_21-3';
%         sorteddata=load(strcat(fname,'_unit_record.mat'));
%         cd('D:\sorted data\060722_vipgf_yes\stimcodes')
%         %raw_data=load(strcat(fname,'.mat'));
%         codes=load(strcat(fname,'_stimcode.mat'));
%         cd(currdir);
%         stimulus=PP_PARAMS.protocol;
% 
%         spktms=unit_record_spike1.negspcounts
%         cl1=1;
%         for ch=1:15
%             if ~isempty(unit_record_spike(ch).negspikemat)
%                 spktms(ch) =unit_record_spike(ch).negspiketime;
%             end
%         end
% 
% for aa=3:length(dir)
%     cd (maindir);
%   %  cd(name_dir(aa).name) 
%   cd(strcat(name_dir(aa).folder, '\', name_dir(aa).name));
%end