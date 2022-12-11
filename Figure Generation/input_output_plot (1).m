%clc
clear all
close all

f = 1; %Which frequency?
motifs2process = [19];%Which motif?
ind_r = [9972]; %Which index would you like to plot?
N = 10000;  %HERE, N IS THE TOTAL NUMBER OF SIMULATIONS PER MOTIF

all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no = [7]; 
compare = false; %select to compare motif at all freqs at specific index value

home_dir = 'D:/Jamil/motif19_10k_t0.1/output_dir';



if compare == true;
    
    for f = f_no
        t = [-100:-1 0:0.1:2000]; 
        %t = [-100:-1 0:1/(20*all_freqs(f)):20/all_freqs(f)];
        x = .4*sin(2*pi*all_freqs(f)*t)+.5;
        for motif = motifs2process
            output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(all_freqs(f)) 'Hz.txt'])';
            for ind = ind_r
                figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']);
                subplot(2,1,1)
                in = 0.5*ones(1,101);
                plot(t(t<=0), in,'r');
                hold on;
                plot(t(t>=0),x(:,101:20101), 'r'); %Plots input
                hold off;
           
                title('Input'); xlabel('Time (secs)'); ylabel('Amplitude');
                
                subplot(2,1,2)
                out = 0.0587*ones(1,101);
                plot(t(t<=0), out, 'k', 'LineWidth',1.5);
                hold on;
                plot(t(t>=0),output(ind,101:20101),'k', 'LineWidth', 1.5);
                hold off;
                title('Output'); xlabel('Time (secs)'); ylabel('Amplitude');
                ylim([0 0.2]); xlim([-200 2000]); 
            end
        end
    end
    
    
else
    t = [-100:-1 0:0.1:2000]; 
    %t = [-100:-1 0:1/(20*f):20/f]; %[-100:-1 0:0.1:2000]; %
    x = .4*sin(2*pi*f*t)+.5;
    for motif = motifs2process
        
        output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(f) 'Hz.txt'])';
        for ind = ind_r
            figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(f) ' Hz']);
            subplot(2,1,1)
            in = 0.5*ones(1,101);
            plot(t(t<=0), in,'r');
            hold on;
            plot(t(t>=0),x(:,101:20101), 'r'); %Plots input
            hold off;
            xlim([-10 500]); 
            title('Input'); xlabel('Time (secs)'); ylabel('Amplitude');
            ylim([0 1]);
            
            subplot(2,1,2)
            t = [-100:-1 0:0.1:2000]; 
            plot(t,output(ind,:));
            title('Output'); xlabel('Time (secs)'); ylabel('Amplitude');
            xlim([-10 500]); 
        end
    end
end

    %{
f = 1;
fs = 1/(20*f);
t = [-100:-1 0:1/(20*f):20/f];
x = output(ind,:);
N = length(x);
y = fft(x);
fbin = (0:N-1)*(fs/N);
figure
plot((fbin-fs/2),fftshift(y)); xlim([0 fs/2]);
end
%}