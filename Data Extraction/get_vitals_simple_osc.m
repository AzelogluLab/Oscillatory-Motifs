%   Andrew Leader
%   Aug. 22, 2013
%   Edited by Jamil Reja
%   ~June 2016 

%Takes some of the most important statistics of the output signals and
%assigns them to different fields of the struct VITALS.
clc
clear all 
close all

motifs2process = [1:20];%[1:20];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
fno2process = [1:7]; %INDEXING INTO ALL_FREQS.  Alter this vector to get statistics from simulations of different frequencies.
N = 100;  %HERE, N IS THE TOTAL NUMBER OF SIMULATIONS PER MOTIF

home_dir = 'D:/JAMIL/Jamil/May2018_FirstTest/output_dir';

try
    % Maybe some of the vital information has already been extracted?
    load([home_dir '/motif_osc/vitals.mat']);
catch
    % start the vitals structure from scratch
    vitals = struct;
end

Progress = 0;
h = waitbar(Progress,'Getting vitals.  Approx time left: Inf');
tic
mkdir([home_dir '/motif_vitals_simple_osc']);
for motif = motifs2process
    for fno = fno2process
        
        f = all_freqs(fno);
        t = [-100:-1 0:1/(20*f):20/f]; %t = [-100:-1 0:0.1:2000];%[-100:-1 0:1/(20*f):20/f];
        
        output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(f) 'Hz.txt'])';
    


        

        first_val = output(:,1);
        last_val = mean(output(:,(t>(t(end)-3/f))),2); %take the last 3 periods of oscillation
        diff_fl = last_val-first_val;
        
        %Maximum Response 
        for i = 1:N;
            k = output(i,:);
                    max_val(i) = max(k);
                    min_val(i) = min(k);
                    max_max_resp(i) = max_val(i) - output(i,1);
                    max_min_resp(i) = min_val(i) - output(i,1);
                if abs(max_max_resp(i)) > abs(max_min_resp(i));
                    max_resp(i) = max_max_resp(i);
                else
                    max_resp(i) = max_min_resp(i);
                end
        
        
        


        vitals.motif(motif).freq(fno).first_val = first_val;
       
        vitals.motif(motif).freq(fno).last_val = last_val;
        vitals.motif(motif).freq(fno).diff_fl = diff_fl;
        vitals.motif(motif).freq(fno).max_resp = max_resp; 

        
        Progress = (find(fno2process == fno)/length(fno2process) + find(motifs2process==motif)-1)/length(motifs2process);
        waitbar(Progress,h,['Getting vitals.  About ' datestr(toc*(1-Progress)/Progress/24/60/60, 'DD:HH:MM:SS.FFF') ' left.']);
        
    end
    
    
    save([home_dir '/motif_vitals_simple_osc/vitals.mat'],'vitals');

       

    end
end
close(h)
%}