% %% Master script for QA analysis
% % This script calls several custom QA functions, make sure to have these 
% % functions in the same directory as this script or added to your Matlab path
% 
% % Required functions are:
% % - calc_tsnr_capsaicin.m
% % - calc_tsnr_saline.m
% % - calc_tsnr_capsaicin_uncl.m
% % - calc_tsnr_saline_uncl.m
% % - extract_voxel_values.m
% % - DVARSCalc.m
% 
% %-------------------------------------------------------------------------
% %% Framewise displacement calculation
% % Based on Power et al.: Spurious but systematic correlations in functional connectivity MRI networks arise from subject motion
% % for reference see https://wiki.cam.ac.uk/bmuwiki/FMRI#Framewise_Displacement
% %-------------------------------------------------------------------------
% 
% dataDir = 'D:\Capsaicin preprocessing\parameters';
% cd(dataDir);
% 
% sub_capsaicin = dir('rp_asubj*_func_cap_ET1.txt');
% % sub_saline = dir('rp_asubj*_func_con_ET1.txt');
% 
% for i = 1:length(sub_capsaicin);
%     HeadMotionList = sub_capsaicin(i).name;
%     head_motion = load(HeadMotionList); 
%     motion_diff = diff(head_motion);
%     FD_capsaicin(:,i) = sum([abs(motion_diff(:, 1:3)), 50 * (pi/180) * abs(motion_diff(:, 4:6))], 2);
%     mean_FD_capsaicin(i) = mean(FD_capsaicin(:,i));
%     RMS_FD_capsaicin(i) = rms(FD_capsaicin(:,i));
%     FD_over_25_capsaicin(i) = sum(FD_capsaicin(:,i)>=.25);
%         
% end
% 
% for i = 1:length(sub_saline);
%     HeadMotionList = sub_saline(i).name;
%     head_motion = load(HeadMotionList);
%     motion_diff = diff(head_motion);
%     FD_saline(:,i) = sum([abs(motion_diff(:, 1:3)), 50 * (pi/180) * abs(motion_diff(:, 4:6))], 2);
%     mean_FD_saline(i) = mean(FD_saline(:,i));
%     RMS_FD_saline(i) = rms(FD_capsaicin(:,i));
%     FD_over_25_saline(i) = sum(FD_saline(:,i)>=.25);
%         
% end
% 
% mean_FD_capsaicin = mean_FD_capsaicin';
% mean_FD_saline = mean_FD_saline';
% RMS_FD_capsaicin = RMS_FD_capsaicin';
% RMS_FD_saline = RMS_FD_saline';
% FD_over_25_capsaicin = FD_over_25_capsaicin';
% FD_over_25_saline = FD_over_25_saline';
% 
%     disp('Framewise displacement calculated')
%     
% 
% %-------------------------------------------------------------------------
% %% DVARS calculation
% %based on Afyouni et al.: Insight and inference for DVARS
% %-------------------------------------------------------------------------
% 
% dataDir = 'D:\Capsaicin preprocessing\TEDANA ts_OC\';
% cd(dataDir);
% 
% sub_capsaicin_uncleaned = dir('ts_OC_cap_*.nii');
% sub_saline_uncleaned = dir('ts_OC_saline_*.nii');
% 
% for i = 1:length(sub_capsaicin_uncleaned);
% 
% V0 = sub_capsaicin_uncleaned(i).name;
% DVARS_cap_uncleaned(:,i) = DVARSCalc(V0);
% mean_DVARS_cap_uncleaned(i,1) = mean(DVARS_cap_uncleaned(:,i))
% std_DVARS_cap_uncleaned(i,1) = std(DVARS_cap_uncleaned(:,i))
% 
% end
% 
% for i = 1:length(sub_saline_uncleaned);
% 
% V0 = sub_saline_uncleaned(i).name;
% DVARS_sal_uncleaned(:,i) = DVARSCalc(V0);
% mean_DVARS_sal_uncleaned(i,1) = mean(DVARS_sal_uncleaned(:,i))
% std_DVARS_sal_uncleaned(i,1) = std(DVARS_sal_uncleaned(:,i))
% 
% end
% 
% dataDir = 'D:\Capsaicin preprocessing\Denoised data (analysis ready - smoothed)\';
% cd(dataDir);
% 
% sub_capsaicin = dir('dniftiDATA_subjcon*_capsaicin.nii');
% sub_saline = dir('dniftiDATA_subjcon*_saline.nii');
% 
% for i = 1:length(sub_capsaicin);
% 
% V0 = sub_capsaicin(i).name;
% DVARS_cap(:,i) = DVARSCalc(V0);
% mean_DVARS_cap(i,1) = mean(DVARS_cap(:,i))
% std_DVARS_cap(i,1) = std(DVARS_cap(:,i))
% 
% end
% 
% for i = 1:length(sub_saline);
% 
% V0 = sub_saline(i).name;
% DVARS_sal(:,i) = DVARSCalc(V0);
% mean_DVARS_sal(i,1) = mean(DVARS_sal(:,i))
% std_DVARS_sal(i,1) = std(DVARS_sal(:,i))
% 
% end
% 
% std_DVARS_all = [std_DVARS_sal; std_DVARS_cap];
% std_DVARS_all_uncleaned = [std_DVARS_sal_uncleaned; std_DVARS_cap_uncleaned];
% mean_DVARS_all = [mean_DVARS_sal; mean_DVARS_cap];
% mean_DVARS_all_uncleaned = [mean_DVARS_sal_uncleaned; mean_DVARS_cap_uncleaned];

% %-------------------------------------------------------------------------
% %% tSNR mapping
% % 
% %         Calculates temporal SNR maps on a subject level for cleaned and
% %         uncleaned data. Then calculates mean tSNR maps per preprocessing
% %         pipeline and tSNR ratio maps (showing improvement in tSNR with the
% %         respective cleaning method).
% %-------------------------------------------------------------------------
% dataDir = 'D:\Capsaicin preprocessing\Denoised data (analysis ready - smoothed)\';
% cd(dataDir);
% global sub_capsaicin
% global sub_saline
% sub_capsaicin = dir('dniftiDATA_subjcon*_capsaicin.nii');
% sub_saline = dir('dniftiDATA_subjcon*_saline.nii');
% 
% global T
% global R
% 
% for R = 1:length(sub_capsaicin)
% 
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);
% 
%     calc_tsnr_capsaicin(file_capsaicin); %% pay attention to tSNR file naming in these scripts
% 
% end
% 
% for T = 1:length(sub_saline)
%     
%         file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);
% 
%         calc_tsnr_saline(file_saline);
%         
% end
% 
% 
% dataDir = 'D:\Capsaicin preprocessing\TEDANA ts_OC\';
% cd(dataDir);
% sub_capsaicin = dir('wts_OC_cap_*.nii');
% sub_saline = dir('wts_OC_saline_*.nii');
% 
% for R = 1:length(sub_capsaicin)
% 
%     file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);
% 
%     calc_tsnr_capsaicin_uncl(file_capsaicin); %% pay attention to tSNR file naming in these scripts
% 
% end
% 
% for T = 1:length(sub_saline)
%     
%         file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);
% 
%         calc_tsnr_saline_uncl(file_saline);
%         
% end
% 
% clean_cap_sub = dir('tsnr_capsaicin_subj*.nii');
% clean_sal_sub = dir('tsnr_saline_subj*.nii');
% uncleaned_cap_sub = dir('tsnr_capsaicin_uncleaned_subj*.nii');
% uncleaned_sal_sub = dir('tsnr_saline_uncleaned_subj*.nii');
% 
% clean_cap_files = strvcat(clean_cap_sub.name);
% clean_sal_files = strvcat(clean_cap_sub.name);
% uncleaned_cap_files = strvcat(uncleaned_cap_sub.name);
% uncleaned_sal_files = strvcat(uncleaned_cap_sub.name);
% 
% Vi = {clean_cap_files};
% Vo = 'tsnr_capsaicin_mean.nii';
% f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
% flags.dmtx = 0;
% flags.mask = 0;
% flags.interp = 1;
% flags.dtype = 4;
% spm_imcalc(Vi,Vo,f,flags)
% 
% Vi = {clean_sal_files};
% Vo = 'tsnr_saline_mean.nii';
% f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
% spm_imcalc(Vi,Vo,f,flags)
% 
% Vi = {uncleaned_cap_files};
% Vo = 'tsnr_capsaicin_uncleaned_mean.nii';
% f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
% spm_imcalc(Vi,Vo,f,flags)
% 
% Vi = {uncleaned_sal_files};
% Vo = 'tsnr_saline_uncleaned_mean.nii';
% f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
% spm_imcalc(Vi,Vo,f,flags)
% 
% % Calculate tSNR ratio maps (showing regions that benefit the most from
% % cleaning method)
% 
% Vi = {'tsnr_capsaicin_mean.nii'
%     'tsnr_capsaicin_uncleaned_mean.nii'};
% Vo = 'tsnr_capsaicin_ratio.nii';
% f = 'i1/i2';
% spm_imcalc(Vi,Vo,f,flags)
% 
% 
% Vi = {'tsnr_saline_mean.nii'
%     'tsnr_saline_uncleaned_mean.nii'};
% Vo = 'tsnr_saline_ratio.nii';
% f = 'i1/i2';
% spm_imcalc(Vi,Vo,f,flags)
% 
% 
% %-------------------------------------------------------------------------
% %% Extract mean tSNR from tSNR maps and store value
% %-------------------------------------------------------------------------
% dataDir = 'D:\Capsaicin preprocessing\Denoised data (analysis ready - smoothed)\';
% cd(dataDir);
% 
% sub_capsaicin = dir('tsnr_capsaicin_subj*.nii');
% sub_saline = dir('tsnr_saline_subj*.nii');
% 
% for R = 1:length(sub_capsaicin);
%     input = (strvcat(sub_capsaicin(R).name));
%     Vi = {input};
%     Vo = 'mask.nii';
%     f = 'i1>0';
%     flags.dmtx = 0;
%     flags.mask = 0;
%     flags.interp = 1;
%     flags.dtype = 4;
%     spm_imcalc(Vi,Vo,f,flags);
%     
%     tSNR_capsaicin_cleaned(R,1) = extract_voxel_values('mask.nii',input);
%     
% end
% 
% for R = 1:length(sub_saline);
%     input = (strvcat(sub_saline(R).name));
%     Vi = {input};
%     Vo = 'mask.nii';
%     f = 'i1>0';
%     spm_imcalc(Vi,Vo,f,flags);
%     
%     tSNR_saline_cleaned(R,1) = extract_voxel_values('mask.nii',input);
%     
% end
% 
% dataDir = 'D:\Capsaicin preprocessing\TEDANA ts_OC\';
% cd(dataDir);
% 
% sub_capsaicin = dir('tsnr_capsaicin_uncleaned_subj*.nii');
% sub_saline = dir('tsnr_saline_uncleaned_subj*.nii');
% 
% for R = 1:length(sub_capsaicin);
%     input = (strvcat(sub_capsaicin(R).name));
%     Vi = {input};
%     Vo = 'mask.nii';
%     f = 'i1>0';
%     spm_imcalc(Vi,Vo,f,flags);
%     
%     tSNR_capsaicin_uncleaned(R,1) = extract_voxel_values('mask.nii',input);
%     
% end
% 
% for R = 1:length(sub_saline);
%     input = (strvcat(sub_saline(R).name));
%     Vi = {input};
%     Vo = 'mask.nii';
%     f = 'i1>0';
%     flags.dmtx = 0;
%     flags.mask = 0;
%     flags.interp = 1;
%     flags.dtype = 4;
%     spm_imcalc(Vi,Vo,f,flags);
%     
%     tSNR_saline_uncleaned(R,1) = extract_voxel_values('mask.nii',input);
%     
% end
% 
% 
% 


-------------------------------------------------------------------------
% Power Spectral Density analysis using multitaper method
-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\TEDANA ts_OC\topup\';
cd(dataDir)
sub_capsaicin_uncleaned = dir('swdsc_ts_OC_cap_*.nii');

for R = 1:length(sub_capsaicin_uncleaned);
for f = 1:1350;
    file_capsaicin_uncleaned = spm_select('Extlist', dataDir, sub_capsaicin_uncleaned(R).name,f);
j(R,f) = extract_voxel_values('mask.nii',file_capsaicin_uncleaned);
end
scaling_factor(1,R) = std(j(R,:));
end
disp('--global signal of uncleaned dataset extracted, scaling factor calculated--')

dataDir = 'D:\Capsaicin preprocessing\Denoised data (analysis ready - smoothed)\';
cd(dataDir)
sub_capsaicin_cleaned = dir('dniftiDATA_subjcon*_capsaicin.nii');

for R = 1:length(sub_capsaicin_cleaned);
for f = 1:1350;
    file_capsaicin_cleaned = spm_select('Extlist', dataDir, sub_capsaicin_cleaned(R).name,f);
k(R,f) = extract_voxel_values('mask.nii',file_capsaicin_cleaned);
end
x(R,:) = k(R,:)/scaling_factor(1,R);
end
disp('--global signal of cleaned dataset extracted--')

   Fs = 0.625;                 % samples per second
   T = 1/Fs;                   % seconds per sample
   L = 1350;                   % signal length (number of samples)
   t = (0:L-1)*T;              % Time vector
   
   figure(1)
   plot (t,x)
   xlabel('time (in seconds)');
   title('Signal versus Time');
   zoom xon;
   
%----SHOULD ALSO DO A HIGHPASS OF 125S/.008Hz, if not already performed in denoising step----%%%
% Something like:
% for R = 1:18;
% q(R,:) = highpass(x(R,:),0.008,0.625);
% end

for R = 1:18;
PSD_scaled(R,:) = pmtm(q(R,:),18,L,Fs);
end

figure(2)  %q is high-pass filtered, x is niet gefilterd
PSD_dB = 10*log10(PSD_scaled/1);
mean_PSD_dB = mean(PSD_dB);
plot(mean_PSD_dB)
     xlim([0 389]); %676 values
     xticks(0:(389/9):389);
     set(gca,'XTickLabel',[0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)
     
figure(3)
pmtm(x(1,:),5,L,Fs);
     xlim([0 180]);
     set(gca,'XTickLabel',[0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)
xlabel('f (Hz)')

% %Could also do simple fft, but probably less realistic for noisy signal
% Y = fft(x);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% f = Fs*(0:(L/2))/L;
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of x(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

    