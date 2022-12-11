%   Andrew Leader
%   8/5/13
%   takes the output from each saved simulation and compiles it in a matrix
clear all; close all; clc;

tic

%Specify directory from which to get simulation output
path_dir = 'D:/JAMIL/Jamil/May2018_FirstTest/output_dir';
%Specify directory destination for extracted output:
extract_dir = 'D:/JAMIL/Jamil/May2018_FirstTest/output_dir';

N = 100; %Number of simulations per individual file. Not total simulations.
kmax = 20;
motifs_to_process = [1:20];

sig_types = {''};%{'','step_osc_in_'};
freqs2process = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no_to_process = [1:7];%[6 7]; %frequencies to process 

Progress = 0;
h = waitbar(Progress,'Extracting output.');
for motif = motifs_to_process
    output_dir = [extract_dir '/output_motif_osc_' num2str(motif)];
    mkdir(output_dir);
    for f_no = f_no_to_process;
        f = freqs2process(f_no);
        t = [-100:-1 0:1/(20*f):20/f]; %t = [-100:-10 -9:0.1:2000]; %[-100:-1 0:1/(20*f):20/f];
        output_piece = NaN(length(t),N);
        output = NaN(length(t),N*kmax);
        
        for type_no = 1:length(sig_types)
            for k = 1:kmax;
                output_piece = importdata([path_dir '/motif_' num2str(motif) '/' sig_types{type_no} num2str(freqs2process(f_no)) 'Hz/' num2str(freqs2process(f_no)) 'Hz_' num2str(k) '_' num2str(N) '.txt']);
                output(:,(k-1)*N+(1:N)) = output_piece;
                Progress = (((k/kmax + type_no-1)/length(sig_types) + find(f_no_to_process==f_no)-1)/length(f_no_to_process) + find(motifs_to_process==motif)-1)/length(motifs_to_process);
                waitbar(Progress,h,['Extracting output.  About ' datestr(toc*(1-Progress)/Progress/24/60/60, 'DD:HH:MM:SS.FFF') ' left.']);
            end
            dlmwrite([output_dir '/' sig_types{type_no} num2str(freqs2process(f_no)) 'Hz.txt'], output,'precision',16);
        end
    end
end
close(h);