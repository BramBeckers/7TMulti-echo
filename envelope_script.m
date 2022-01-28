%% CALCULATE ENVELOPE

load RESPsignal

for i = 1:36;
[resp] = RESPsignal{i}; 
resp(resp == 5000) = [];
X = resp(:,1);
Z = zscore(X);
[yupper,ylower] = envelope(Z,125,'peak');
SD_upper(i,:) = std(yupper);
SD_lower(i,:) = std(ylower);
end

%% RECODE INTO SEPARATE CAP AND SAL VALUES
Cap(1,:) = SD_lower(1,:);
Sal(1,:) = SD_lower(2,:);
Sal(2,:) = SD_lower(3,:);
Cap(2,:) = SD_lower(4,:);
Sal(3,:) = SD_lower(5,:);
Cap(3,:) = SD_lower(6,:);
Cap(4,:) = SD_lower(7,:);
Sal(4,:) = SD_lower(8,:);
Cap(5,:) = SD_lower(9,:);
Sal(5,:) = SD_lower(10,:);
Sal(6,:) = SD_lower(11,:);
Cap(6,:) = SD_lower(12,:);
Sal(7,:) = SD_lower(13,:);
Cap(7,:) = SD_lower(14,:);
Sal(8,:) = SD_lower(15,:);
Cap(8,:) = SD_lower(16,:);
Cap(9,:) = SD_lower(17,:);
Sal(9,:) = SD_lower(18,:);
Cap(10,:) = SD_lower(19,:);
Sal(10,:) = SD_lower(20,:);
Sal(11,:) = SD_lower(21,:);
Cap(11,:) = SD_lower(22,:);
Cap(12,:) = SD_lower(23,:);
Sal(12,:) = SD_lower(24,:);
Cap(13,:) = SD_lower(25,:);
Sal(13,:) = SD_lower(26,:);
Sal(14,:) = SD_lower(27,:);
Cap(14,:) = SD_lower(28,:);
Sal(15,:) = SD_lower(29,:);
Cap(15,:) = SD_lower(30,:);
Cap(16,:) = SD_lower(31,:);
Sal(16,:) = SD_lower(32,:);
Sal(17,:) = SD_lower(33,:);
Cap(17,:) = SD_lower(34,:);
Sal(18,:) = SD_lower(35,:);
Cap(18,:) = SD_lower(36,:);

%% CALCULATE SD OF GLOBAL SIGNAL

load PowerSpect_complete.mat signal_capsaicin_uncleaned signal_capsaicin_comp signal_capsaicin_ted signal_capsaicin_tedcomp signal_capsaicin_aroma
load PowerSpect_complete.mat signal_saline_uncleaned signal_saline_comp signal_saline_ted signal_saline_tedcomp signal_saline_aroma

for i = 1:18;
SD_uncleaned_cap(i,:) = std(signal_capsaicin_uncleaned(i,:));
SD_comp_cap(i,:) = std(signal_capsaicin_comp(i,:));
SD_ted_cap(i,:) = std(signal_capsaicin_ted(i,:));
SD_tedcomp_cap(i,:) = std(signal_capsaicin_tedcomp(i,:));
SD_aroma_cap(i,:) = std(signal_capsaicin_aroma(i,:));
end

for i = 1:18;
SD_uncleaned_sal(i,:) = std(signal_saline_uncleaned(i,:));
SD_comp_sal(i,:) = std(signal_saline_comp(i,:));
SD_ted_sal(i,:) = std(signal_saline_ted(i,:));
SD_tedcomp_sal(i,:) = std(signal_saline_tedcomp(i,:));
SD_aroma_sal(i,:) = std(signal_saline_aroma(i,:));
end

%% REMOVE INVALID RESP
Cap(4) = [];
Cap(8) = [];
Sal(12) = [];

SD_aroma_cap(4) = [];
SD_aroma_cap(8) = [];
SD_aroma_sal(12) = [];

SD_uncleaned_cap(4) = [];
SD_uncleaned_cap(8) = [];
SD_uncleaned_sal(12) = [];

SD_ted_cap(4) = [];
SD_ted_cap(8) = [];
SD_ted_sal(12) = [];

SD_tedcomp_cap(4) = [];
SD_tedcomp_cap(8) = [];
SD_tedcomp_sal(12) = [];

SD_comp_cap(4) = [];
SD_comp_cap(8) = [];
SD_comp_sal(12) = [];

%% CALCULATE CORRELATION COEFF

% [R1,P1] = corrcoef(Cap,SD_uncleaned_cap);
% [R2,P2] = corrcoef(Cap,SD_comp_cap);
% [R3,P3] = corrcoef(Cap,SD_ted_cap);
% [R4,P4] = corrcoef(Cap,SD_tedcomp_cap);
% [R5,P5] = corrcoef(Cap,SD_aroma_cap);

[T1, O1] = corrcoef(Sal,SD_uncleaned_sal);
[T2, O2] = corrcoef(Sal,SD_comp_sal);
[T3, O3] = corrcoef(Sal,SD_ted_sal);
[T4, O4] = corrcoef(Sal,SD_tedcomp_sal);
[T5, O5] = corrcoef(Sal,SD_aroma_sal);
% 

str1 = '#0072BD';
Color1 = sscanf(str1(2:end),'%2x%2x%2x',[1 3])/255;
str2 = '#D95319';
Color2 = sscanf(str2(2:end),'%2x%2x%2x',[1 3])/255;
str3 = '#EDB120';
Color3 = sscanf(str3(2:end),'%2x%2x%2x',[1 3])/255;
str4 = '#7E2F8E';
Color4 = sscanf(str4(2:end),'%2x%2x%2x',[1 3])/255;
str5 = '#77AC30';
Color5 = sscanf(str5(2:end),'%2x%2x%2x',[1 3])/255;

subplot(1,5,1)
q1 = scatter(Sal,SD_uncleaned_sal);
y1 = lsline
ylim([0.3 1]);
set(gca,'XTick',[], 'YTick', [])
ylabel('SD of global signal');
xlabel({'SD of';'respiratory envelope'})
subplot(1,5,2)
q2 = scatter(Sal,SD_comp_sal);
y2 = lsline
ylim([0.1 0.5]);
set(gca,'XTick',[], 'YTick', [])
ylabel('SD of global signal');
xlabel({'SD of';'respiratory envelope'})
subplot(1,5,3)
q3 = scatter(Sal,SD_ted_sal);
y3 = lsline
ylim([0.2 0.8]);
set(gca,'XTick',[], 'YTick', [])
ylabel('SD of global signal');
xlabel({'SD of';'respiratory envelope'})
subplot(1,5,4)
q4 = scatter(Sal,SD_tedcomp_sal);
y4 = lsline
ylim([0 0.2]);
set(gca,'XTick',[], 'YTick', [])
ylabel('SD of global signal');
xlabel({'SD of';'respiratory envelope'})
subplot(1,5,5)
q5 = scatter(Sal,SD_aroma_sal);
y5 = lsline
ylim([0 0.15]);
set(gca,'XTick',[], 'YTick', [])
ylabel('SD of global signal');
xlabel({'SD of';'respiratory envelope'})
q1.MarkerEdgeColor = Color1;
q2.MarkerEdgeColor = Color2;
q3.MarkerEdgeColor = Color3;
q4.MarkerEdgeColor = Color4;
q5.MarkerEdgeColor = Color5;
q1.MarkerFaceColor = Color1;
q2.MarkerFaceColor = Color2;
q3.MarkerFaceColor = Color3;
q4.MarkerFaceColor = Color4;
q5.MarkerFaceColor = Color5;
y1.Color = Color1
y2.Color = Color2
y3.Color = Color3
y4.Color = Color4
y5.Color = Color5
legendlines = [q1(1) q2(1) q3(1) q4(1) q5(1)];
legend(legendlines,'ME-uncleaned','ME-aCompCor','ME-ICA-focal','ME-ICA-global','ME-AROMA');  




% q1 = scatter(Sal,SD_uncleaned_sal);
% hold on
% q2 = scatter(Sal,SD_comp_sal);
% q3 = scatter(Sal,SD_ted_sal);
% q4 = scatter(Sal,SD_tedcomp_sal);
% q5 = scatter(Sal,SD_aroma_sal);
% 
% q1.MarkerEdgeColor = Color1;
% q2.MarkerEdgeColor = Color2;
% q3.MarkerEdgeColor = Color3;
% q4.MarkerEdgeColor = Color4;
% q5.MarkerEdgeColor = Color5;
% q1.MarkerFaceColor = Color1;
% q2.MarkerFaceColor = Color2;
% q3.MarkerFaceColor = Color3;
% q4.MarkerFaceColor = Color4;
% q5.MarkerFaceColor = Color5;
% y = lsline
% ylim([0.1 0.6])
% y(1,1).Color = Color5
% y(1,2).Color = Color4
% y(1,3).Color = Color3
% y(1,4).Color = Color2
% y(1,5).Color = Color1
% y(1,1).LineWidth = 1.5;
% y(1,2).LineWidth = 1.5;
% y(1,3).LineWidth = 1.5;
% y(1,4).LineWidth = 1.5;
% y(1,5).LineWidth = 1.5;
% legendlines = [q1(1) q2(1) q3(1) q4(1) q5(1)];
% legend(legendlines,'ME-uncleaned','ME-aCompCor','ME-ICA-focal','ME-ICA-global','ME-AROMA');   
% ylabel('Standard deviation of global signal');
% xlabel('Standard deviation of respiratory envelope');
% set(gca,'XTick',[], 'YTick', [])
% 


% Envelope_both = [Cap;Sal];
% SD_uncleaned_both = [SD_uncleaned_cap;SD_uncleaned_sal];
% SD_comp_both = [SD_comp_cap;SD_comp_sal];
% SD_ted_both = [SD_ted_cap;SD_ted_sal];
% SD_tedcomp_both = [SD_tedcomp_cap;SD_tedcomp_sal];
% SD_aroma_both = [SD_aroma_cap;SD_aroma_sal];
% 
% corr_1 = corrcoef(Envelope_both,SD_uncleaned_both);
% corr_2 = corrcoef(Envelope_both,SD_comp_both);
% corr_3 = corrcoef(Envelope_both,SD_ted_both);
% corr_4 = corrcoef(Envelope_both,SD_tedcomp_both);
% corr_5 = corrcoef(Envelope_both,SD_aroma_both);
% 



