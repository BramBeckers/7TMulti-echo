function Q = calc_tsnr_capsaicin(P)
% Calculate temporal signal to noise ratio for volumes in P
% FORMAT Q = calc_tsnr(P)
% INPUT
% P       - functional image filenames, either character array or cell array of strings

% OUTPUT
% Q       - Image(s) with voxel values mean / SD of input images
%
% Does not include any implicit masking

% P = spm_select(Inf,'image');
% calc_tsnr(P);

global sub_capsaicin 
global R

if ischar(P)
    [p n e] = spm_fileparts(P(1,:));
    x = fullfile(p,'tsnr_capsaicin_subj',sub_capsaicin(R).name(19:20),'.nii');
    filename = strrep(x,'\','')   
    Q = docalc(P,filename);
    
else
    error('Could not figure out input variable P')
end

function Q = docalc(P,filename)
V = spm_vol(P);
Vo = V(1);
Vo.fname = filename;
Vo = spm_imcalc(V,Vo,'mean(X) ./ std(X)',{1 0 0});
Q = Vo.fname;
end

end 