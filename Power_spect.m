% % 
% % -------------------------------------------------------------------------
% % % Power Spectral Density analysis using multitaper method
% % -------------------------------------------------------------------------

%-------------------------------------------------------------------------
% %% UNCLEANED DATA
%-------------------------------------------------------------------------

% dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
% cd(dataDir);
% 
% sub_capsaicin = dir('dswdsc_ts_OC_cap_*.nii');
% sub_saline = dir('dswdsc_ts_OC_saline_*.nii');
% 
% counter = 0;
% for R = 1:length(sub_capsaicin);
% for f = 1:1350;
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,f);
% signal_capsaicin_uncleaned(R,f) = extract_voxel_values('mask.nii',file_capsaicin);
% end
% scaling_factor_capsaicin_uncleaned(1,R) = std(signal_capsaicin_uncleaned(R,:));
% signal_capsaicin_uncleaned_sc(R,:) = signal_capsaicin_uncleaned(R,:)/scaling_factor_capsaicin_uncleaned(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of uncleaned dataset extracted, scaling factor calculated--')
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_capsaicin_uncleaned_schpf(R,:) = highpass(signal_capsaicin_uncleaned_sc(R,:),0.008,0.625);
% PSD_scaled_capsaicin_uncleaned(R,:) = pmtm(signal_capsaicin_uncleaned_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% counter = 0;
% for R = 1:length(sub_saline);
% for f = 1:1350;
%     file_saline = spm_select('Extlist', dataDir, sub_saline(R).name,f);
% signal_saline_uncleaned(R,f) = extract_voxel_values('mask.nii',file_saline);
% end
% scaling_factor_saline_uncleaned(1,R) = std(signal_saline_uncleaned(R,:));
% signal_saline_uncleaned_sc(R,:) = signal_saline_uncleaned(R,:)/scaling_factor_saline_uncleaned(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of uncleaned dataset extracted, scaling factor calculated--')
% % 
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_saline_uncleaned_schpf(R,:) = highpass(signal_saline_uncleaned_sc(R,:),0.008,0.625);
% PSD_scaled_saline_uncleaned(R,:) = pmtm(signal_saline_uncleaned_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana without acompcor
% %-------------------------------------------------------------------------
% dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
% cd(dataDir);
% 
% sub_capsaicin = dir('dswdscdn_ts_OC_subj*_capsaicin.nii');
% sub_saline = dir('dswdscdn_ts_OC_subj*_saline.nii');
% 
% counter = 0;
% for R = 1:length(sub_capsaicin);
% for f = 1:1350;
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,f);
% signal_capsaicin_ted(R,f) = extract_voxel_values('mask.nii',file_capsaicin);
% end
% scaling_factor_capsaicin_ted(1,R) = std(signal_capsaicin_ted(R,:));
% signal_capsaicin_ted_sc(R,:) = signal_capsaicin_ted(R,:)/scaling_factor_capsaicin_ted(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of ted dataset extracted, scaling factor calculated--')
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_capsaicin_ted_schpf(R,:) = highpass(signal_capsaicin_ted_sc(R,:),0.008,0.625);
% PSD_scaled_capsaicin_ted(R,:) = pmtm(signal_capsaicin_ted_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% counter = 0;
% for R = 1:length(sub_saline);
% for f = 1:1350;
%     file_saline = spm_select('Extlist', dataDir, sub_saline(R).name,f);
% signal_saline_ted(R,f) = extract_voxel_values('mask.nii',file_saline);
% end
% scaling_factor_saline_ted(1,R) = std(signal_saline_ted(R,:));
% signal_saline_ted_sc(R,:) = signal_saline_ted(R,:)/scaling_factor_saline_ted(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of ted dataset extracted, scaling factor calculated--')
% % 
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_saline_ted_schpf(R,:) = highpass(signal_saline_ted_sc(R,:),0.008,0.625);
% PSD_scaled_saline_ted(R,:) = pmtm(signal_saline_ted_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% % %-------------------------------------------------------------------------
% % % %% CLEANED DATA - tedana + acompcor
% % %-------------------------------------------------------------------------
% dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
% cd(dataDir);
% 
% sub_capsaicin = dir('dswdscdn_ts_OC_subj*_capsaicin.nii');
% sub_saline = dir('dswdscdn_ts_OC_subj*_saline.nii');
% 
% counter = 0;
% for R = 1:length(sub_capsaicin);
% for f = 1:1350;
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,f);
% signal_capsaicin_tedcomp(R,f) = extract_voxel_values('mask.nii',file_capsaicin);
% end
% scaling_factor_capsaicin_tedcomp(1,R) = std(signal_capsaicin_tedcomp(R,:));
% signal_capsaicin_tedcomp_sc(R,:) = signal_capsaicin_tedcomp(R,:)/scaling_factor_capsaicin_tedcomp(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of tedcomp dataset extracted, scaling factor calculated--')
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_capsaicin_tedcomp_schpf(R,:) = highpass(signal_capsaicin_tedcomp_sc(R,:),0.008,0.625);
% PSD_scaled_capsaicin_tedcomp(R,:) = pmtm(signal_capsaicin_tedcomp_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% counter = 0;
% for R = 1:length(sub_saline);
% for f = 1:1350;
%     file_saline = spm_select('Extlist', dataDir, sub_saline(R).name,f);
% signal_saline_tedcomp(R,f) = extract_voxel_values('mask.nii',file_saline);
% end
% scaling_factor_saline_tedcomp(1,R) = std(signal_saline_tedcomp(R,:));
% signal_saline_tedcomp_sc(R,:) = signal_saline_tedcomp(R,:)/scaling_factor_saline_tedcomp(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of tedcomp dataset extracted, scaling factor calculated--')
% % 
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_saline_tedcomp_schpf(R,:) = highpass(signal_saline_tedcomp_sc(R,:),0.008,0.625);
% PSD_scaled_saline_tedcomp(R,:) = pmtm(signal_saline_tedcomp_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% 
% % %-------------------------------------------------------------------------
% % % %% CLEANED DATA - acompcor only
% % %-------------------------------------------------------------------------
% dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
% cd(dataDir);
% 
% sub_capsaicin = dir('dswdsc_ts_OC_cap_*.nii');
% sub_saline = dir('dswdsc_ts_OC_saline_*.nii');
% 
% counter = 0;
% for R = 1:length(sub_capsaicin);
% for f = 1:1350;
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,f);
% signal_capsaicin_comp(R,f) = extract_voxel_values('mask.nii',file_capsaicin);
% end
% scaling_factor_capsaicin_comp(1,R) = std(signal_capsaicin_comp(R,:));
% signal_capsaicin_comp_sc(R,:) = signal_capsaicin_comp(R,:)/scaling_factor_capsaicin_comp(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of comp dataset extracted, scaling factor calculated--')
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_capsaicin_comp_schpf(R,:) = highpass(signal_capsaicin_comp_sc(R,:),0.008,0.625);
% PSD_scaled_capsaicin_comp(R,:) = pmtm(signal_capsaicin_comp_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% counter = 0;
% for R = 1:length(sub_saline);
% for f = 1:1350;
%     file_saline = spm_select('Extlist', dataDir, sub_saline(R).name,f);
% signal_saline_comp(R,f) = extract_voxel_values('mask.nii',file_saline);
% end
% scaling_factor_saline_comp(1,R) = std(signal_saline_comp(R,:));
% signal_saline_comp_sc(R,:) = signal_saline_comp(R,:)/scaling_factor_saline_comp(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of comp dataset extracted, scaling factor calculated--')
% 
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_saline_comp_schpf(R,:) = highpass(signal_saline_comp_sc(R,:),0.008,0.625);
% PSD_scaled_saline_comp(R,:) = pmtm(signal_saline_comp_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% % %-------------------------------------------------------------------------
% % % %% CLEANED DATA - AROMA
% % %-------------------------------------------------------------------------
% dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
% cd(dataDir);
% 
% sub_capsaicin = dir('daroma_caps_*.nii');
% sub_saline = dir('daroma_saline_*.nii');
% 
% counter = 0;
% for R = 1:length(sub_capsaicin);
% for f = 1:1350;
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,f);
% signal_capsaicin_aroma(R,f) = extract_voxel_values('mask.nii',file_capsaicin);
% end
% scaling_factor_capsaicin_aroma(1,R) = std(signal_capsaicin_aroma(R,:));
% signal_capsaicin_aroma_sc(R,:) = signal_capsaicin_aroma(R,:)/scaling_factor_capsaicin_aroma(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of aroma dataset extracted, scaling factor calculated--')
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_capsaicin_aroma_schpf(R,:) = highpass(signal_capsaicin_aroma_sc(R,:),0.008,0.625);
% PSD_scaled_capsaicin_aroma(R,:) = pmtm(signal_capsaicin_aroma_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end
% 
% counter = 0;
% for R = 1:length(sub_saline);
% for f = 1:1350;
%     file_saline = spm_select('Extlist', dataDir, sub_saline(R).name,f);
% signal_saline_aroma(R,f) = extract_voxel_values('mask.nii',file_saline);
% end
% scaling_factor_saline_aroma(1,R) = std(signal_saline_aroma(R,:));
% signal_saline_aroma_sc(R,:) = signal_saline_aroma(R,:)/scaling_factor_saline_aroma(1,R);
% counter = counter + 1;
% fprintf('finished subject %d \n', counter);
% end
% disp('--global signal of aroma dataset extracted, scaling factor calculated--')
%  
% 
% % % ----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% % % Something like:
% counter = 0;
% for R = 1:18;
% signal_saline_aroma_schpf(R,:) = highpass(signal_saline_aroma_sc(R,:),0.008,0.625);
% PSD_scaled_saline_aroma(R,:) = pmtm(signal_saline_aroma_schpf(R,:),18,L,Fs);
% counter = counter + 1;
% fprintf('finished power spectrum subject %d \n', counter);
% end



% % %-------------------------------------------------------------------------
% % % %% scaling and Matlabs highpass function did not work as intended, sc
% % % % %and schpf data can therefore be disregarded hereafter!!!
% % %-------------------------------------------------------------------------

   Fs = 0.625;                 % samples per second
   T = 1/Fs;                   % seconds per sample
   L = 1350;                   % signal length (number of samples)
   t = (0:L-1)*T;              % Time vector
   
load PowerSpect_complete
% % First plot PSD for capsaicin run
     for R = 1:18;
y = signal_capsaicin_uncleaned(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(y, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
     figure(1)
      a = plot(mean(f,2));
      hold on
      a.LineWidth = 1;
      a.Color = 'm';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
   
     for R = 1:18;
w = signal_capsaicin_comp(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(w, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      s = plot(mean(f,2));
      s.LineWidth = 1;
      s.Color = 'b';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
          for R = 1:18;
q = signal_capsaicin_ted(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(q, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      d = plot(mean(f,2));
      d.LineWidth = 1;
      d.Color = 'y';
      xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     for R = 1:18;
u = signal_capsaicin_tedcomp(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(u, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
end
       g = plot(mean(f,2));
       g.LineWidth = 1;
       g.Color = 'g';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     for R = 1:18;
t = signal_capsaicin_aroma(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(t, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      h =  plot(mean(f,2));
      h.LineWidth = 1;
      h.Color = 'r';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     
% % %      Now plot all PSD for saline run
     for R = 1:18;
y = signal_saline_uncleaned(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(y, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
     figure(2)
      a = plot(mean(f,2));
      hold on
      a.LineWidth = 1;
      a.Color = 'm';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     for R = 1:18;
w = signal_saline_comp(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(w, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      s = plot(mean(f,2));
      s.LineWidth = 1;
      s.Color = 'b';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
          for R = 1:18;
q = signal_saline_ted(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(q, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      d = plot(mean(f,2));
      d.LineWidth = 1;
      d.Color = 'y';
      xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     for R = 1:18;
u = signal_saline_tedcomp(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(u, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
end
       g = plot(mean(f,2));
       g.LineWidth = 1;
       g.Color = 'g';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
         for R = 1:18;
t = signal_saline_aroma(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(t, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      h =  plot(mean(f,2));
      h.LineWidth = 1;
      h.Color = 'r';
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.01 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
    