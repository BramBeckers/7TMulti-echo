% %-------------------------------------------------------------------------
% %% tSNR mapping
% % 
% %         Calculates temporal SNR maps on a subject level for cleaned and
% %         uncleaned data. Then calculates mean tSNR maps per preprocessing
% %         pipeline and tSNR ratio maps (showing improvement in tSNR with the
% %         respective cleaning method).
% %-------------------------------------------------------------------------

% %-------------------------------------------------------------------------
% % %% UNCLEANED DATA
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
cd(dataDir);

global sub_capsaicin
global sub_saline

sub_capsaicin = dir('dswdsc_ts_OC_cap_*.nii');
sub_saline = dir('dswdsc_ts_OC_saline_*.nii');

global T
global R

for R = 1:length(sub_capsaicin)

    file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);

    calc_tsnr_capsaicin_uncl(file_capsaicin); %% pay attention to tSNR file naming in these scripts

end

for T = 1:length(sub_saline)
    
        file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);

        calc_tsnr_saline_uncl(file_saline);
        
end


% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana without acompcor
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);

sub_capsaicin = dir('dswdscdn_ts_OC_subj*_capsaicin.nii');
sub_saline = dir('dswdscdn_ts_OC_subj*_saline.nii');

for R = 1:length(sub_capsaicin)

    file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);

    calc_tsnr_capsaicin_ted(file_capsaicin); %% pay attention to tSNR file naming in these scripts

end

for T = 1:length(sub_saline)
    
        file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);

        calc_tsnr_saline_ted(file_saline);
        
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana + acompcor
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);

sub_capsaicin = dir('dswdscdn_ts_OC_subj*_capsaicin.nii');
sub_saline = dir('dswdscdn_ts_OC_subj*_saline.nii');

for R = 1:length(sub_capsaicin)

    file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);

    calc_tsnr_capsaicin_tedcomp(file_capsaicin); %% pay attention to tSNR file naming in these scripts

end

for T = 1:length(sub_saline)
    
        file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);

        calc_tsnr_saline_tedcomp(file_saline);
        
end


% %-------------------------------------------------------------------------
% % %% CLEANED DATA - acompcor only
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);

sub_capsaicin = dir('dswdsc_ts_OC_cap_*.nii');
sub_saline = dir('dswdsc_ts_OC_saline_*.nii');


for R = 1:length(sub_capsaicin)

    file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);

    calc_tsnr_capsaicin_comp(file_capsaicin); %% pay attention to tSNR file naming in these scripts

end

for T = 1:length(sub_saline)
    
        file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);

        calc_tsnr_saline_comp(file_saline);
        
end


% %-------------------------------------------------------------------------
% % %% CLEANED DATA - AROMA
% %-------------------------------------------------------------------------
dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);

sub_capsaicin = dir('daroma_caps_*.nii');
sub_saline = dir('daroma_saline_*.nii');

for R = 1:length(sub_capsaicin)

    file_capsaicin = spm_select('Extlist', dataDir, sub_capsaicin(R).name,1:1350);

    calc_tsnr_capsaicin_aroma(file_capsaicin); %% pay attention to tSNR file naming in these scripts

end

for T = 1:length(sub_saline)
    
        file_saline = spm_select('Extlist', dataDir, sub_saline(T).name,1:1350);

        calc_tsnr_saline_aroma(file_saline);
        
end


%-------------------------------------------------------------------------
% %% allocate subfolders for subsequent tsnr map calculatios
%-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);
ted_cap_sub = dir('tsnr_capsaicin_ted_subj*.nii');
ted_sal_sub = dir('tsnr_saline_ted_subj*.nii');

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);
tedcomp_cap_sub = dir('tsnr_capsaicin_tedcomp_subj*.nii');
tedcomp_sal_sub = dir('tsnr_saline_tedcomp_subj*.nii');

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);
comp_cap_sub = dir('tsnr_capsaicin_comp_subj*.nii');
comp_sal_sub = dir('tsnr_saline_comp_subj*.nii');

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);
aroma_cap_sub = dir('tsnr_capsaicin_aroma_subj*.nii');
aroma_sal_sub = dir('tsnr_saline_aroma_subj*.nii');

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
cd(dataDir);
uncleaned_cap_sub = dir('tsnr_capsaicin_uncleaned_subj*.nii');
uncleaned_sal_sub = dir('tsnr_saline_uncleaned_subj*.nii');

ted_cap_files = strvcat(ted_cap_sub.name);
ted_sal_files = strvcat(ted_cap_sub.name);
tedcomp_cap_files = strvcat(tedcomp_cap_sub.name);
tedcomp_sal_files = strvcat(tedcomp_cap_sub.name);
comp_cap_files = strvcat(comp_cap_sub.name);
comp_sal_files = strvcat(comp_cap_sub.name);
aroma_cap_files = strvcat(aroma_cap_sub.name);
aroma_sal_files = strvcat(aroma_cap_sub.name);
uncleaned_cap_files = strvcat(uncleaned_cap_sub.name);
uncleaned_sal_files = strvcat(uncleaned_cap_sub.name);


% %-------------------------------------------------------------------------
% % %% calculate mean tsnr maps and save as single nifti files
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);
Vi = {ted_cap_files};
Vo = 'tsnr_capsaicin_ted_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
flags.dmtx = 0;
flags.mask = 0;
flags.interp = 1;
flags.dtype = 4;
spm_imcalc(Vi,Vo,f,flags)

Vi = {ted_sal_files};
Vo = 'tsnr_saline_ted_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);
Vi = {tedcomp_cap_files};
Vo = 'tsnr_capsaicin_tedcomp_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

Vi = {tedcomp_sal_files};
Vo = 'tsnr_saline_tedcomp_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);
Vi = {comp_cap_files};
Vo = 'tsnr_capsaicin_comp_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

Vi = {comp_sal_files};
Vo = 'tsnr_saline_comp_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);
Vi = {aroma_cap_files};
Vo = 'tsnr_capsaicin_aroma_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

Vi = {aroma_sal_files};
Vo = 'tsnr_saline_aroma_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
cd(dataDir);
Vi = {uncleaned_cap_files};
Vo = 'tsnr_capsaicin_uncleaned_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)

Vi = {uncleaned_sal_files};
Vo = 'tsnr_saline_uncleaned_mean.nii';
f = '(i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18)/18';
spm_imcalc(Vi,Vo,f,flags)


%-------------------------------------------------------------------------
% % Calculate tSNR ratio maps (showing regions that benefit the most from
% % each cleaning method)
%-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);
Vi = {'tsnr_capsaicin_ted_mean.nii'
    'tsnr_capsaicin_uncleaned_mean.nii'};
Vo = 'tsnr_capsaicin_ted_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)

Vi = {'tsnr_saline_ted_mean.nii'
    'tsnr_saline_uncleaned_mean.nii'};
Vo = 'tsnr_saline_ted_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)


dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);
Vi = {'tsnr_capsaicin_tedcomp_mean.nii'
    'tsnr_capsaicin_uncleaned_mean.nii'};
Vo = 'tsnr_capsaicin_tedcomp_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)

Vi = {'tsnr_saline_tedcomp_mean.nii'
    'tsnr_saline_uncleaned_mean.nii'};
Vo = 'tsnr_saline_tedcomp_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)



dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);
Vi = {'tsnr_capsaicin_comp_mean.nii'
    'tsnr_capsaicin_uncleaned_mean.nii'};
Vo = 'tsnr_capsaicin_comp_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)

Vi = {'tsnr_saline_comp_mean.nii'
    'tsnr_saline_uncleaned_mean.nii'};
Vo = 'tsnr_saline_comp_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)



dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);
Vi = {'tsnr_capsaicin_aroma_mean.nii'
    'tsnr_capsaicin_uncleaned_mean.nii'};
Vo = 'tsnr_capsaicin_aroma_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)

Vi = {'tsnr_saline_aroma_mean.nii'
    'tsnr_saline_uncleaned_mean.nii'};
Vo = 'tsnr_saline_aroma_ratio.nii';
f = 'i1./i2';
spm_imcalc(Vi,Vo,f,flags)


%-------------------------------------------------------------------------
% Extract mean tSNR from tSNR maps and store value (whole brain calculation [see mask file])
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
% %% UNCLEANED DATA
%-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
cd(dataDir);

% for R = 1:18;
%     input = strvcat(uncleaned_cap_sub(R).name);   
%     tSNR_capsaicin_uncleaned(R,1) = extract_voxel_values('mask.nii',input);
%     
% end


for R = 1:18;
    input = strvcat(uncleaned_sal_sub(R).name);   
    tSNR_saline_uncleaned(R,1) = extract_voxel_values('mask.nii',input);
end

%-------------------------------------------------------------------------
% %% CLEANED DATA - tedana without acompcor
%-------------------------------------------------------------------------


dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);

for R = 1:length(ted_cap_sub);
    input = (strvcat(ted_cap_sub(R).name));
    tSNR_capsaicin_ted(R,1) = extract_voxel_values('mask.nii',input);
    
end

for R = 1:length(ted_sal_sub);
    input = (strvcat(ted_sal_sub(R).name));  
    tSNR_saline_ted(R,1) = extract_voxel_values('mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana + acompcor
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);

for R = 1:length(tedcomp_cap_sub);
    input = (strvcat(tedcomp_cap_sub(R).name));
    tSNR_capsaicin_tedcomp(R,1) = extract_voxel_values('mask.nii',input);
    
end

for R = 1:length(tedcomp_sal_sub);
    input = (strvcat(tedcomp_sal_sub(R).name));
    tSNR_saline_tedcomp(R,1) = extract_voxel_values('mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - acompcor only
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);

for R = 1:length(comp_cap_sub);
    input = (strvcat(comp_cap_sub(R).name));
    tSNR_capsaicin_comp(R,1) = extract_voxel_values('mask.nii',input);
    
end

for R = 1:length(comp_sal_sub);
    input = (strvcat(comp_sal_sub(R).name));
    tSNR_saline_comp(R,1) = extract_voxel_values('mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - AROMA
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);

for R = 1:length(aroma_cap_sub);
    input = (strvcat(aroma_cap_sub(R).name));
    tSNR_capsaicin_aroma(R,1) = extract_voxel_values('mask.nii',input);
    
end

for R = 1:length(aroma_sal_sub);
    input = (strvcat(aroma_sal_sub(R).name));
    tSNR_saline_aroma(R,1) = extract_voxel_values('mask.nii',input);
    
end


% %-------------------------------------------------------------------------
%% Extract mean tSNR from tSNR maps and store value (brainstem calculation [see mask file])
% %-------------------------------------------------------------------------

% %-------------------------------------------------------------------------
% % %% UNCLEANED DATA
% %-------------------------------------------------------------------------


dataDir = 'D:\Capsaicin preprocessing\Quality comparison\ME-uncleaned\';
cd(dataDir);

for R = 1:18;
    input = strvcat(uncleaned_cap_sub(R).name);
    tSNR_brainstem_capsaicin_uncleaned(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

for R = 1:18;
    input = (uncleaned_sal_sub(R).name);
    tSNR_brainstem_saline_uncleaned(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana without acompcor
% %-------------------------------------------------------------------------


dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana\';
cd(dataDir);

for R = 1:length(ted_cap_sub);
    input = (strvcat(ted_cap_sub(R).name));
    tSNR_brainstem_capsaicin_ted(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

for R = 1:length(ted_sal_sub);
    input = (strvcat(ted_sal_sub(R).name));
    tSNR_brainstem_saline_ted(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - tedana + acompcor
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\Tedana - aCompCor\';
cd(dataDir);

for R = 1:length(tedcomp_cap_sub);
    input = (strvcat(tedcomp_cap_sub(R).name));
    tSNR_brainstem_capsaicin_tedcomp(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

for R = 1:length(tedcomp_sal_sub);
    input = (strvcat(tedcomp_sal_sub(R).name));
    tSNR_brainstem_saline_tedcomp(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - acompcor only
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\aCompCor\';
cd(dataDir);

for R = 1:length(comp_cap_sub);
    input = (strvcat(comp_cap_sub(R).name));
    tSNR_brainstem_capsaicin_comp(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

for R = 1:length(comp_sal_sub);
    input = (strvcat(comp_sal_sub(R).name));
    tSNR_brainstem_saline_comp(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

% %-------------------------------------------------------------------------
% % %% CLEANED DATA - AROMA
% %-------------------------------------------------------------------------

dataDir = 'D:\Capsaicin preprocessing\Quality comparison\AROMA\';
cd(dataDir);

for R = 1:length(aroma_cap_sub);
    input = (strvcat(aroma_cap_sub(R).name));
    tSNR_brainstem_capsaicin_aroma(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

for R = 1:length(aroma_sal_sub);
    input = (strvcat(aroma_sal_sub(R).name));
    tSNR_brainstem_saline_aroma(R,1) = extract_voxel_values('brainstem_mask.nii',input);
    
end

tSNR_brainstem_capsaicin_ALL = [tSNR_brainstem_capsaicin_uncleaned, tSNR_brainstem_capsaicin_comp, tSNR_brainstem_capsaicin_ted, tSNR_brainstem_capsaicin_tedcomp, tSNR_brainstem_capsaicin_aroma];
tSNR_brainstem_saline_ALL = [tSNR_brainstem_saline_uncleaned, tSNR_brainstem_saline_comp, tSNR_brainstem_saline_ted, tSNR_brainstem_saline_tedcomp, tSNR_brainstem_saline_aroma];
tSNR_capsaicin_ALL = [tSNR_capsaicin_uncleaned, tSNR_capsaicin_comp, tSNR_capsaicin_ted, tSNR_capsaicin_tedcomp, tSNR_capsaicin_aroma];
tSNR_saline_ALL = [tSNR_saline_uncleaned, tSNR_saline_comp, tSNR_saline_ted, tSNR_saline_tedcomp, tSNR_saline_aroma];
