%   Andrew Leader
%   Aug. 22, 2013

%Takes some of the most important statistics of the output signals and
%assigns them to different fields of the struct VITALS.

motifs2process = 1;%[1:20];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
fno2process = [1:7];
N = 1000;

home_dir = 'D:\Jamil\Test\';

try
    load vitals;
catch
    vitals = struct;
end

Progress = 0;
h = waitbar(Progress,'Getting vitals.  Approx time left: Inf');
tic
mkdir([home_dir '/motif_vitals_step_osc']);
for motif = motifs2process
    for fno = fno2process
        
       f = all_freqs(fno);
        t = [-100:-1 0:1/(20*f):20/f];
        
        
        
        output = load([home_dir '/output_dir/output_motif_step_osc_' num2str(motif) '/step_osc_in_' num2str(all_freqs(fno)) 'Hz.txt']);
        first_val = mean(output(:,t<0),2);
        last_val = mean(output(:,(t>(t(end)-3/all_freqs(fno)))),2); %take the last 3 periods of oscillation
        diff_fl = last_val-first_val;

        vitals.motif(motif).step_osc.freq(fno).first_val = first_val;
        vitals.motif(motif).step_osc.freq(fno).last_val = last_val;
        vitals.motif(motif).step_osc.freq(fno).diff_fl = diff_fl;
        
        Progress = (find(fno2process == fno)/length(fno2process) + find(motifs2process==motif)-1)/length(motifs2process);
        waitbar(Progress,h,['Getting vitals.  About ' datestr(toc*(1-Progress)/Progress/24/60/60, 'DD:HH:MM:SS.FFF') ' left.']);
        
    end
end

save([home_dir '/motif_vitals_step_osc/vitals.mat'],'vitals');
close(h);