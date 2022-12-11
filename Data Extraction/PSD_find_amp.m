%   Andrew Leader
%   Aug 22, 2013

%   This script also doesn't tend to be particularly amenable to
%   parallelization for the same reasons as those in EXTRACT_OUTPUT.m.
% local = parcluster('local');
% local.NumWorkers = 11;
% matlabpool local;

sig_types = {''};%{'','step_osc_in_'};
motifs2process = [1:20];%[1:20];
freqs_to_process = [0.001 0.003 0.01 0.03 0.1 0.3 1];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N = 100; %Number of simulations per individual file
k_max = 20;

home_dir = 'D:/JAMIL/Jamil/May2018_FirstTest/output_dir';
extract_dir = 'D:/JAMIL/Jamil/May2018_FirstTest/output_dir';
load([home_dir '/motif_vitals_simple_osc/vitals.mat']);

Progress = 0;
h = waitbar(Progress,'Extracting Information. Approximately Inf left');
tic
for motif = motifs2process
    for freq = freqs_to_process
        t = [-100:-1 0:1/(20*freq):20/freq]; %t = [-100:-1 0:0.1:2000]; %t = [-100:-1 0:1/(20*freq):20/freq]; 
        
        L = length(t(t>=0));
        NFFT = L;%2^nextpow2(L);
        PSD = NaN(NFFT,k_max*N);
        PSD_piece = NaN(NFFT,N);
        f = linspace(0,1/2/(t(end)-t(end-1)),ceil(L/2));
        for type_no = 1:length(sig_types)
            output = importdata([extract_dir '/output_motif_osc_' num2str(motif) '/' sig_types{type_no} num2str(freq) 'Hz.txt']);
            for k = 1:k_max
                for ii = 1:N %parfor ii = 1:N
                    PSD_piece(:,ii) = abs(fft(output(t>=0,(k-1)*N+ii),NFFT,1)/L/0.2);
                end
                PSD(:,(k-1)*N+(1:N)) = PSD_piece;
                
                Progress = (((k/k_max+type_no-1)/length(sig_types) + find(freqs_to_process==freq)-1)/length(freqs_to_process) + find(motifs2process==motif)-1)/length(motifs2process);
                waitbar(Progress,h,['Extracting output.  About ' datestr(toc*(1-Progress)/Progress/24/60/60, 'DD:HH:MM:SS.FFF') ' left.']);
            end
            ind = find(abs(f-freq)==min(abs(f-freq)));
            feature = -mag2db(PSD(ind,:));
            
            if strcmp(sig_types{type_no},'')
                vitals.motif(motif).freq(all_freqs==freq).dBsupp = feature;
            elseif strcmp(sig_types{type_no},'step_osc_in_')
                vitals.motif(motif).step_osc.freq(all_freqs==freq).dBsupp = feature;
            end
            
        end
        
        
    end
    save([home_dir '/vitals_w_dB.mat'],'vitals');
    
end

close(h);
% matlabpool close;