%   Andrew Leader
%   Aug. 22, 2013

%Takes some of the most important statistics of the output signals and
%assigns them to different fields of the struct VITALS.

clc
clear all
close all

motifs2process = 12;%[1:20];
N = 1;
t = [-100:-1 0:0.1:2000];%-100:1:1200; %the time vector at which the step responses were simulated
step_directions ={'up','down'};

home_dir = 'D:/Jamil/Motif12_1Sim_t0.1/output_dir';
try
    load vitals;
catch
    vitals = struct;
end

mkdir ([home_dir '/motif_vitals_step']);
for motif = motifs2process
    for step_dir = [1:2]
        
        load([home_dir '/output_motif_steps_' num2str(motif) '/step_' step_directions{step_dir} '.mat']);
        
        first_val = output(:,1);
        last_val = output(:,end);
        diff_fl = last_val-first_val;
        sens = max(max(output,[],2)-first_val,first_val-min(output,[],2));
        
        vitals.motif(motif).(step_directions{step_dir}).first_val = first_val;
        vitals.motif(motif).(step_directions{step_dir}).last_val = last_val;
        vitals.motif(motif).(step_directions{step_dir}).sens = sens;
        vitals.motif(motif).(step_directions{step_dir}).diff_fl = diff_fl;
            
    end
    h = waitbar((motif-1)/length(motifs2process));
end

save([home_dir '/motif_vitals_step/vitals_step.mat']);
close(h);