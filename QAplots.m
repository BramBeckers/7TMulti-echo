%% Plots for QAmanuscript

%% create tSNR violin plots

load tSNR_complete

figure(1)
title('Brainstem tSNR per denoising method');
violinplot([tSNR_brainstem_ALL]);
hold on
xticklabels({'ME-uncleaned','ME-aCompCor','ME-ICA-focal','ME-ICA-global','ME-AROMA'});
ylabel('tSNR');

figure(2)
title('whole-brain tSNR per denoising method');
violinplot([tSNR_ALL]);
hold on
xticklabels({'ME-uncleaned','ME-aCompCor','ME-ICA-focal','ME-ICA-global','ME-AROMA'});
ylabel('tSNR');


%% create DVARS timecourse plots

load DVARS_FD_complete

%% Low motion subject
figure(3)
subplot(5,2,1)
plot(FD_capsaicin(:,13))
ylim([0 0.5]);
xlim([0 1349]);
ylabel('FD(mm)')
xlabel('timepoints (#scans)')
title('Low motion subject')
subplot(5,2,3)
plot(DVARS_cap_uncleaned(:,13))
hold on
plot(DVARS_cap_comp(:,13))
ylim([0 2]);
xlim([0 1349]);
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-aCompCor (vs uncleaned)');
subplot(5,2,5)
plot(DVARS_cap_uncleaned(:,13))
hold on
plot(DVARS_cap_ted(:,13))
ylim([0 2]);
xlim([0 1349]);
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-ICA-focal (vs uncleaned)');
subplot(5,2,7)
plot(DVARS_cap_uncleaned(:,13))
hold on
plot(DVARS_cap_tedcomp(:,13))
ylim([0 2]);
xlim([0 1349]);
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-ICA-global (vs uncleaned)');
subplot(5,2,9)
plot(DVARS_cap_uncleaned(:,13))
hold on
plot(DVARS_cap_aroma(:,13))
ylim([0 2]);
xlim([0 1349]);
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-AROMA (vs uncleaned)');

%% High motion subject
subplot(5,2,2)
plot(FD_capsaicin(:,10))
ylim([0 1]);
xlim([0 1349]);
ylabel('FD(mm)')
xlabel('timepoints (#scans)')
title('High motion subject')
subplot(5,2,4)
plot(DVARS_cap_uncleaned(:,10))
hold on
plot(DVARS_cap_comp(:,10))
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-aCompCor (vs uncleaned)');
ylim([0 3]);
xlim([0 1349]);
subplot(5,2,6)
plot(DVARS_cap_uncleaned(:,10))
hold on
plot(DVARS_cap_ted(:,10))
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-ICA-focal (vs uncleaned)');
ylim([0 3]);
xlim([0 1349]);
subplot(5,2,8)
plot(DVARS_cap_uncleaned(:,10))
hold on
plot(DVARS_cap_tedcomp(:,10))
ylim([0 3]);
xlim([0 1349]);
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-ICA-global (vs uncleaned)');
subplot(5,2,10)
plot(DVARS_cap_uncleaned(:,10))
hold on
plot(DVARS_cap_aroma(:,10))
ylim([0 3]);
xlim([0 1349]);
ylabel('DVARS')
xlabel('timepoints (#scans)')
title('ME-AROMA (vs uncleaned)');



% %% Medium motion subject
% figure(4)
% subplot(5,1,1)
% plot(FD_capsaicin(:,5))
% ylim([0 0.6]);
% xlim([0 1349]);
% ylabel('FD(mm)')
% xlabel('timepoints (#scans)')
% title('Medium motion subject')
% subplot(5,1,2)
% plot(DVARS_cap_uncleaned(:,5))
% hold on
% plot(DVARS_cap_comp(:,5))
% ylim([0 2]);
% xlim([0 1349]);
% ylabel('DVARS')
% xlabel('timepoints (#scans)')
% title('ME-aCompCor (vs uncleaned)');
% subplot(5,1,3)
% plot(DVARS_cap_uncleaned(:,5))
% hold on
% plot(DVARS_cap_ted(:,5))
% ylim([0 2]);
% xlim([0 1349]);
% ylabel('DVARS')
% xlabel('timepoints (#scans)')
% title('ME-ICA-focal (vs uncleaned)');
% subplot(5,1,4)
% plot(DVARS_cap_uncleaned(:,5))
% hold on
% plot(DVARS_cap_tedcomp(:,5))
% ylim([0 2]);
% xlim([0 1349]);
% ylabel('DVARS')
% xlabel('timepoints (#scans)')
% title('ME-ICA-global (vs uncleaned)');
% subplot(5,1,5)
% plot(DVARS_cap_uncleaned(:,5))
% hold on
% plot(DVARS_cap_aroma(:,5))
% ylim([0 2]);
% xlim([0 1349]);
% ylabel('DVARS')
% xlabel('timepoints (#scans)')
% title('ME-AROMA (vs uncleaned)');

%% create DVARS violin plots
% 
% mean_DVARS_uncleaned = vertcat(mean_DVARS_cap_uncleaned,mean_DVARS_sal_uncleaned);
% mean_DVARS_comp = vertcat(mean_DVARS_cap_comp,mean_DVARS_sal_comp);
% mean_DVARS_ted = vertcat(mean_DVARS_cap_ted,mean_DVARS_sal_ted);
% mean_DVARS_tedcomp = vertcat(mean_DVARS_cap_tedcomp,mean_DVARS_sal_tedcomp);
% mean_DVARS_aroma = vertcat(mean_DVARS_cap_aroma,mean_DVARS_sal_aroma);
% DVARS_cap_ALL = [mean_DVARS_uncleaned, mean_DVARS_comp, mean_DVARS_ted, mean_DVARS_tedcomp, mean_DVARS_aroma];

std_DVARS_uncleaned = vertcat(std_DVARS_cap_uncleaned,std_DVARS_sal_uncleaned);
std_DVARS_comp = vertcat(std_DVARS_cap_comp,std_DVARS_sal_comp);
std_DVARS_ted = vertcat(std_DVARS_cap_ted,std_DVARS_sal_ted);
std_DVARS_tedcomp = vertcat(std_DVARS_cap_tedcomp,std_DVARS_sal_tedcomp);
std_DVARS_aroma = vertcat(std_DVARS_cap_aroma,std_DVARS_sal_aroma);
DVARS_ALL = [std_DVARS_uncleaned, std_DVARS_comp, std_DVARS_ted, std_DVARS_tedcomp, std_DVARS_aroma];

figure(4)
title('DVARS standard deviation per denoising method');
violinplot([DVARS_ALL]);
hold on
xticklabels({'ME-uncleaned','ME-aCompCor','ME-ICA-focal','ME-ICA-global','ME-AROMA'});
ylabel('DVARS');

%% create plots for powerspectra

   Fs = 0.625;                 % samples per second
   T = 1/Fs;                   % seconds per sample
   L = 1350;                   % signal length (number of samples)
   t = (0:L-1)*T;              % Time vector
     
load DVARS_plot_data

% % First plot PSD for capsaicin run
     for R = 1:36;
y = signal_uncleaned(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(y, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
     figure(5)
      a = plot(mean(f,2));
      hold on
      a.LineWidth = 1.5;
     str = '#0072BD';
      color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
      a.Color = color;
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.1 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
   
     for R = 1:36;
w = signal_comp(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(w, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      s = plot(mean(f,2));
      s.LineWidth = 1.5;
           str = '#D95319';
      color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
      s.Color = color;
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.1 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
          for R = 1:36;
q = signal_ted(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(q, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      d = plot(mean(f,2));
      d.LineWidth = 1.5;
      str = '#EDB120';
      color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
      d.Color = color;
      xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.1 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     for R = 1:36;
u = signal_tedcomp(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(u, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
end
       g = plot(mean(f,2));
       g.LineWidth = 1.5;
      str = '#7E2F8E';
      color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
      g.Color = color;
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.1 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
     
     for R = 1:36;
t = signal_aroma(R,:);
[x(R,:),b,a] = bst_bandpass_filtfilt(t, 0.625, 0.008, 0, 0, 'fir');
f(:,R) = pmtm(x(R,:),12,L,Fs);
     end
      h =  plot(mean(f,2));
      h.LineWidth = 1.5;
      str = '#77AC30';
      color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
      h.Color = color;
     xlim([0 540.8]); %676 values
%      ylim([0 12]);
     xticks(0:(540.8/10):540.8);
     set(gca,'XTickLabel',[0 0.025 0.05 0.075 0.1 0.125 0.15 0.175 0.2 0.225 0.25] ); %careful here, this overwrites x-axis values (otherwhise specified in mHz)     
   
      l =  legend('ME-uncleaned','ME-aCompCor','ME-ICA-focal','ME-ICA-global','ME-AROMA');   
    % l.Fontsize = 10;
    title('Power spectral density per denoising method');
    xlabel('Frequency (Hz)');
    ylabel('arbitrary units (a.u.)');
    
    

