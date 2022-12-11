%clc
clear all
%close all

f = 0.03; %Which frequency in Hz?
motifs2process = [12];%Which motif?
ind_r = [22350]; %Which index would you like to plot?


all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no = [1:7]; 
compare = false; %select to compare motif at all freqs at specific index value

home_dir = 'D:/JAMIL/Jamil/100K_Sims/output_dir';



if compare == true;
    
    for f = f_no
        t = [-100:-1 0:1/(20*all_freqs(f)):20/all_freqs(f)];
        x = .4*sin(2*pi*all_freqs(f)*t)+.5;
        for motif = motifs2process
            output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(all_freqs(f)) 'Hz.txt'])';
            for ind = ind_r
                figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']);
                subplot(2,1,1)
                plot(t,x, 'r');
                title('Input'); xlabel('Time (secs)'); ylabel('Amplitude');
                subplot(2,1,2)
                plot(t,output(ind,:));
                title('Output'); xlabel('Time (secs)'); ylabel('Amplitude');
            end
        end
    end
    
    
else
    t = [-100:-1 0:1/(20*f):20/f];
    x = .4*sin(2*pi*f*t)+.5;
    for motif = motifs2process
        
        output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(f) 'Hz.txt'])';
        for ind = ind_r
            figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(f) ' Hz']);
            subplot(2,1,1)
            plot(t,x, 'r');
            title('Input'); xlabel('Time (secs)'); ylabel('Amplitude');
            subplot(2,1,2)
            plot(t,output(ind,:));
            title('Output'); xlabel('Time (secs)'); ylabel('Amplitude');
        end
    end
    


end
