close all;
clear all;
folder = 'C:\Users\ab.beckers\Desktop\Phys logs\';
cd(folder);
files = dir(strcat(folder, '*.resp'));

Fs = 1000; 
Order = 1;  %first order
Fc = [0.1 1];  %should be 3dB down at the cutoff
[but,a] = butter(Order,Fc/(Fs/2),'bandpass'); 

MinRESPePD = 2000;
MinRESPePH = 90; %max(RESPeraw)/div;

%errors:
minVP = 500;
maxVP = 10000;
minEXPdu = 500;
maxRESPIntdiff = 1000;
maxRESPInterval = 8000;
maxpksdiff = -90;
maxampldiff = -90;

forward = 1000;
backward = 1000;

sum_criteria_t = 5;

movW = 15;
movT = 350;

for filenr = 1:36;

fname = strcat(folder, files(filenr).name);

fid=fopen(fname);

rawdata(filenr,:) = textscan(fid,'%s');


for n = 1:size(rawdata{filenr},1)
   if strcmp(rawdata{filenr}(n),'RESP_SAMPLES_PER_SECOND')
       RESP_SAMPLES_PER_SECOND = rawdata{filenr}(n+2);
   end
   if strcmp(rawdata{filenr}(n),'RESP_SAMPLE_INTERVAL')
       RESP_SAMPLE_INTERVAL = rawdata{filenr}(n+2);
   end
   if strcmp(rawdata{filenr}(n),'LogStartMDHTime:')
       LogStartMDHTime = rawdata{filenr}(n+1);
   end
   if strcmp(rawdata{filenr}(n),'LogStopMDHTime:')
       LogStopMDHTime = rawdata{filenr}(n+1);
   end
   if strcmp(rawdata{filenr}(n),'LogStartMPCUTime:')
       LogStartMPCUTime = rawdata{filenr}(n+1);
   end
   if strcmp(rawdata{filenr}(n),'LogStopMPCUTime:')
       LogStopMPCUTime = rawdata{filenr}(n+1);
   end   
   if strcmp(rawdata{filenr}(n),'RESP_SAMPLE_INTERVAL')
       startsignal = n+3;
   end
   if strcmp(rawdata{filenr}(n),'ACQ')
       endsignal = n-1;
   end
  
end

signal = rawdata{filenr}(startsignal:endsignal);
signalnr{filenr} = str2double(signal);
disp('performed one loop')
% time(filenr,:) = 1:1000/50:length(signalnr(:,filenr))*1000/50;
% time(filenr,:) = time(filenr,:)';
end

RESPsignal = signalnr';


for i = 1:36;
[resp] = RESPsignal{i}; 
resp(resp == 5000) = [];
X = resp;
Z = zscore(X);
[yupper,ylower] = envelope(Z);
SD_upper(i,:) = std(yupper);
SD_lower(i,:) = std(ylower);
end
