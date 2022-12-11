%   Andrew Leader
%   8/5/13
%   takes the output from each saved simulation and compiles it in a matrix
clear all; close all; clc;

tic

% local = parcluster('local');
% local.NumWorkers = ;
% matlabpool local 4;

%Specify directory from which to get simulation output
path_dir = 'D:/Jamil/Motif12_1Sim_t0.1#2/output_dir';
%Specify directory destination for extracted output:
extract_dir = 'D:/Jamil/Motif12_1Sim_t0.1#2/output_dir';

N = 1;
kmax = 1;
motifs_to_process = 12;%[1:20];

sig_types = {'step_up','step_down'};
t = [-100:-1 0:0.1:2000];

Progress = 0;
h = waitbar(Progress,'Extracting output.');
for motif = motifs_to_process
    output_dir = [extract_dir '/output_motif_steps_' num2str(motif)];
    mkdir(output_dir);
    
    
    output_piece = NaN(N,length(t));
    output = NaN(N*kmax,length(t));
    
    for type_no = 1:length(sig_types)
        for k = 1:kmax
            
            output = load([path_dir '/motif_' num2str(motif) '/' sig_types{type_no} '/' sig_types{type_no} '_' num2str(k) '_' num2str(N) '.txt']);
            output_piece = output((k-1)*N+(1:N),:);
            Progress = ((k/kmax + type_no-1)/length(sig_types) + find(motifs_to_process==motif)-1)/length(motifs_to_process);
            waitbar(Progress,h,['Extracting output.  About ' datestr(toc*(1-Progress)/Progress/24/60/60, 'DD:HH:MM:SS.FFF') ' left.']);
        end
        save([output_dir '/' sig_types{type_no} '.mat'],'output','-v7.3');
    end
    
end
close(h);
%matlabpool close;