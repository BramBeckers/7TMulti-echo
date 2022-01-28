% % -------------------------------------------------------------------------
% %% Framewise displacement calculation
% % Based on Power et al.: Spurious but systematic correlations in functional connectivity MRI networks arise from subject motion
% % for reference see https://wiki.cam.ac.uk/bmuwiki/FMRI#Framewise_Displacement
% % %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\parameters';
cd(dataDir);

sub_capsaicin = dir('rp_asubj*_func_cap_ET1.txt');
sub_saline = dir('rp_asubj*_func_con_ET1.txt');

for i = 1:length(sub_capsaicin);
    HeadMotionList = sub_capsaicin(i).name;
    head_motion = load(HeadMotionList); 
    motion_diff = diff(head_motion);
    FD_capsaicin(:,i) = sum([abs(motion_diff(:, 1:3)), 50 * (pi/180) * abs(motion_diff(:, 4:6))], 2);
    mean_FD_capsaicin(i) = mean(FD_capsaicin(:,i));
    RMS_FD_capsaicin(i) = rms(FD_capsaicin(:,i));
    FD_over_25_capsaicin(i) = sum(FD_capsaicin(:,i)>=.25);
        
end

for i = 1:length(sub_saline);
    HeadMotionList = sub_saline(i).name;
    head_motion = load(HeadMotionList);
    motion_diff = diff(head_motion);
    FD_saline(:,i) = sum([abs(motion_diff(:, 1:3)), 50 * (pi/180) * abs(motion_diff(:, 4:6))], 2);
    mean_FD_saline(i) = mean(FD_saline(:,i));
    RMS_FD_saline(i) = rms(FD_capsaicin(:,i));
    FD_over_25_saline(i) = sum(FD_saline(:,i)>=.25);
        
end

mean_FD_capsaicin = mean_FD_capsaicin';
mean_FD_saline = mean_FD_saline';
RMS_FD_capsaicin = RMS_FD_capsaicin';
RMS_FD_saline = RMS_FD_saline';
FD_over_25_capsaicin = FD_over_25_capsaicin';
FD_over_25_saline = FD_over_25_saline';

    disp('Framewise displacement calculated')
    

%-------------------------------------------------------------------------
%% DVARS calculation
%based on Afyouni et al.: Insight and inference for DVARS
%-------------------------------------------------------------------------

% %-------------------------------------------------------------------------
% % %% UNCLEANED DATA
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
cd(dataDir);

sub_capsaicin_uncleaned = dir('dswdsc_ts_OC_cap_*.nii');
sub_saline_uncleaned = dir('dswdsc_ts_OC_saline_*.nii');

for i = 1:length(sub_capsaicin_uncleaned);

V0 = sub_capsaicin_uncleaned(i).name;
DVARS_cap_uncleaned(:,i) = DVARSCalc(V0);
mean_DVARS_cap_uncleaned(i,1) = mean(DVARS_cap_uncleaned(:,i))
std_DVARS_cap_uncleaned(i,1) = std(DVARS_cap_uncleaned(:,i))

end

for i = 1:length(sub_saline_uncleaned);

V0 = sub_saline_uncleaned(i).name;
DVARS_sal_uncleaned(:,i) = DVARSCalc(V0);
mean_DVARS_sal_uncleaned(i,1) = mean(DVARS_sal_uncleaned(:,i))
std_DVARS_sal_uncleaned(i,1) = std(DVARS_sal_uncleaned(:,i))

end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana without acompcor
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);

sub_capsaicin = dir('dswdscdn_ts_OC_subj*_capsaicin.nii');
sub_saline = dir('dswdscdn_ts_OC_subj*_saline.nii');

for i = 1:length(sub_capsaicin);

V0 = sub_capsaicin(i).name;
DVARS_cap_ted(:,i) = DVARSCalc(V0);
mean_DVARS_cap_ted(i,1) = mean(DVARS_cap_ted(:,i))
std_DVARS_cap_ted(i,1) = std(DVARS_cap_ted(:,i))

end

for i = 1:length(sub_saline);

V0 = sub_saline(i).name;
DVARS_sal_ted(:,i) = DVARSCalc(V0);
mean_DVARS_sal_ted(i,1) = mean(DVARS_sal_ted(:,i))
std_DVARS_sal_ted(i,1) = std(DVARS_sal_ted(:,i))

end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana + acompcor
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);

sub_capsaicin = dir('dswdscdn_ts_OC_subj*_capsaicin.nii');
sub_saline = dir('dswdscdn_ts_OC_subj*_saline.nii');

for i = 1:length(sub_capsaicin);

V0 = sub_capsaicin(i).name;
DVARS_cap_tedcomp(:,i) = DVARSCalc(V0);
mean_DVARS_cap_tedcomp(i,1) = mean(DVARS_cap_tedcomp(:,i))
std_DVARS_cap_tedcomp(i,1) = std(DVARS_cap_tedcomp(:,i))

end

for i = 1:length(sub_saline);

V0 = sub_saline(i).name;
DVARS_sal_tedcomp(:,i) = DVARSCalc(V0);
mean_DVARS_sal_tedcomp(i,1) = mean(DVARS_sal_tedcomp(:,i))
std_DVARS_sal_tedcomp(i,1) = std(DVARS_sal_tedcomp(:,i))

end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - acompcor only
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);

sub_capsaicin = dir('dswdsc_ts_OC_cap_*.nii');
sub_saline = dir('dswdsc_ts_OC_saline_*.nii');

for i = 1:length(sub_capsaicin);

V0 = sub_capsaicin(i).name;
DVARS_cap_comp(:,i) = DVARSCalc(V0);
mean_DVARS_cap_comp(i,1) = mean(DVARS_cap_comp(:,i))
std_DVARS_cap_comp(i,1) = std(DVARS_cap_comp(:,i))

end

for i = 1:length(sub_saline);

V0 = sub_saline(i).name;
DVARS_sal_comp(:,i) = DVARSCalc(V0);
mean_DVARS_sal_comp(i,1) = mean(DVARS_sal_comp(:,i))
std_DVARS_sal_comp(i,1) = std(DVARS_sal_comp(:,i))

end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - AROMA
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);

sub_capsaicin = dir('daroma_caps_*.nii');
sub_saline = dir('daroma_saline_*.nii');

for i = 1:length(sub_capsaicin);

V0 = sub_capsaicin(i).name;
DVARS_cap_aroma(:,i) = DVARSCalc(V0);
mean_DVARS_cap_aroma(i,1) = mean(DVARS_cap_aroma(:,i))
std_DVARS_cap_aroma(i,1) = std(DVARS_cap_aroma(:,i))

end

for i = 1:length(sub_saline);

V0 = sub_saline(i).name;
DVARS_sal_aroma(:,i) = DVARSCalc(V0);
mean_DVARS_sal_aroma(i,1) = mean(DVARS_sal_aroma(:,i))
std_DVARS_sal_aroma(i,1) = std(DVARS_sal_aroma(:,i))

end

% %-------------------------------------------------------------------------
% % %% summarizing data side-by-side
% %-------------------------------------------------------------------------

std_DVARS_all_uncleaned = [std_DVARS_sal_uncleaned, std_DVARS_cap_uncleaned];
mean_DVARS_all_uncleaned = [mean_DVARS_sal_uncleaned, mean_DVARS_cap_uncleaned];
std_DVARS_all_ted = [std_DVARS_sal_ted, std_DVARS_cap_ted];
mean_DVARS_all_ted = [mean_DVARS_sal_ted, mean_DVARS_cap_ted];
std_DVARS_all_tedcomp = [std_DVARS_sal_tedcomp, std_DVARS_cap_tedcomp];
mean_DVARS_all_tedcomp = [mean_DVARS_sal_tedcomp, mean_DVARS_cap_tedcomp];
std_DVARS_all_comp = [std_DVARS_sal_comp, std_DVARS_cap_comp];
mean_DVARS_all_comp = [mean_DVARS_sal_comp, mean_DVARS_cap_comp];
std_DVARS_all_aroma = [std_DVARS_sal_aroma, std_DVARS_cap_aroma];
mean_DVARS_all_aroma = [mean_DVARS_sal_aroma, mean_DVARS_cap_aroma];

mean_DVARS_ALL = [mean_DVARS_all_uncleaned, mean_DVARS_all_comp, mean_DVARS_all_ted, mean_DVARS_all_tedcomp, mean_DVARS_all_aroma];
std_DVARS_ALL = [std_DVARS_all_uncleaned, std_DVARS_all_comp, std_DVARS_all_ted, std_DVARS_all_tedcomp, std_DVARS_all_aroma];


%-------------------------------------------------------------------------
% % 
% % % load('DVARS_FD data.mat')
% % 
% % %%If you want to reinclude censored volumes by means of LOCF
% % Ind=find(DVARS_sal==0);
% % for k=Ind
% % DVARS_sal_reg(k)=DVARS_sal(k-1);
% % end
% % Ind=find(DVARS_cap_reg==0);
% % for k=Ind
% % DVARS_cap_reg(k)=DVARS_cap(k-1);
% % end
