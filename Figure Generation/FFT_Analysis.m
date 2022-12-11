%clc
clear all
%close all


motifs2process = [1:20];%Which motif?
%ind_r = [1]; %Which index would you like to plot?
%N = 1;  %HERE, N IS THE TOTAL NUMBER OF SIMULATIONS PER MOTIF

all_freqs =  [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no = [1]; %Select more than one frequency
compare = true; %select to compare motif at all freqs at specific index value
n = 100000; %Total number of simulations
home_dir = 'D:/Jamil/Motif12_1Sim_t0.1#4s/output_dir';
i = 0;
j = 0;

for f = f_no
    
    for motif = motifs2process
        
        y = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(all_freqs(f)) 'Hz.txt'])';
        for i = 1:n;
            Y = abs(fft(y(i,1:100)));
            pks_fft = findpeaks(Y);
            %if isempty(pks_fft)
             %   FFT.motif(motif).freq(f).fft(i) = 0;
            %else
            if isempty(pks_fft)
                a = 1;
            else
                M = max(pks_fft);
            
                if M > 10e-3
                    j = j + 1;
                    %k = find(Y==M);
                    %fs = 20*all_freqs(f);
                    %N = length(y(i,1:100));
                    %fbin = (0:N-1)*(fs/N);
                    %FFT.motif(motif).freq(f).fft(i) = fbin(k(1));
                    index.motif(motif).freq(f).index(j) = i; 
                end
            end
            %{
            if fbin(k(1)) > (0.1*(all_freqs(f))+ all_freqs(f)) || fbin(k(1)) < (0.9*(all_freqs(f)))
                j = j +1;
            	index.motif(motif).freq(f).fft(:,j) = i;
            end
            %}
        %end
               
        end
    j = 0;
    end
                
        end
   
save([home_dir '/index_fft.mat'], 'index');