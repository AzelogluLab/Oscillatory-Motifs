%   Andrew Leader
%   Aug 22, 2013
%   Edited by Jamil Reja
%   ~June 2016
%clc
clear all
close all

home_dir = 'D:/JAMIL/Jamil/100K_Sims/output_dir';

%   This script plots the DC-shift (X-axis) vs. dB suppression (Y-axis) for
%   all motifs at a given frequency, specified HERE:
f = 1; %other options: 0.01, 0.03, 0.1, 0.3, 1
f_no = 1; %for input/output plots;
motifs2process = [12];%[1:20];
%select for absolute DC shifts HIGHER than this:
DC_diff_lim = 0.1;
%select for dB suppression HIGHER than this:
dBsupp_lim = 20;
%select for a maximum response HIGHER than this:
max_resp_lim = 0.2;
% Simple osc, or step osc?
step_osc = false;
Total_sims = 100000; %Total number of simulations per motif


all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
ind_mat = zeros(Total_sims,motifs2process(end));
load([home_dir '/vitals_w_dB.mat']);
i = 0;
if step_osc ~= true
    for motif = motifs2process;
        i = i+1;
        figure('Numbertitle', 'off' ,'Name', [num2str(f) 'Hz - 2D Plot']);
        %subplot(1,2,i)
        title(['Motif ' num2str(motif)]);
        plot(vitals.motif(motif).freq(all_freqs==f).diff_fl,vitals.motif(motif).freq(all_freqs==f).dBsupp,'.','markersize',10);
        hold on;
        
        if motif == motifs2process(1);
            xlabel('sustained response');
            ylabel('dB oscillation');
            legend([num2str(f) 'Hz']);
        end
        
        %find the simulation numbers (or INDiceS) that satisfy the
        %criteria specified at the top of the script.
        inds = (abs(vitals.motif(motif).freq(all_freqs==f).diff_fl) > DC_diff_lim) & (vitals.motif(motif).freq(all_freqs==f).dBsupp' > dBsupp_lim);
        inds_1 = (abs(vitals.motif(motif).freq(all_freqs==f).diff_fl) < DC_diff_lim) & (vitals.motif(motif).freq(all_freqs==f).dBsupp' > dBsupp_lim) & (abs(vitals.motif(motif).freq(all_freqs==f).max_resp') > max_resp_lim);
        load([home_dir '/index.mat']);
        load([home_dir '/counter.mat']);
        results = find(counter.motif(motif).freq(all_freqs==f).dBandDCandMax);
        if length(results) > 0;
            fprintf(['\n' num2str(length(results)) ' result(s) found at motif # ' num2str(motif) ' at frequency ' num2str(f) ' Hz at index #s \n']) 
            if length(index.motif(motif).freq(all_freqs==f).index) > 0
                for index_length = 1:length(index.motif(motif).freq(all_freqs==f).index)
                    fprintf([num2str(index.motif(motif).freq(all_freqs==f).index(index_length)) ', ']);
                end
                    fprintf('\n');
            
            end
        end
        
        %plot scatter plots, outlining the good regions.
        plot(vitals.motif(motif).freq(all_freqs==f).diff_fl(inds),vitals.motif(motif).freq(all_freqs==f).dBsupp(inds),'.','color','r','markersize',7);
        line([DC_diff_lim 1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
        line([DC_diff_lim DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        line([-DC_diff_lim -1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
        line([-DC_diff_lim -DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        
        ylim([-10 100]);
        xlim([-1 1]);
        title('Negative Feedback/Incoherent Feedforward');
        hold off;
        
        figure('Numbertitle', 'off' ,'Name', [num2str(f) 'Hz - 3D Plot']);
        %subplot (1,2,i)
        %Plots all points
        a = vitals.motif(motif).freq(all_freqs==f).diff_fl;
        b = vitals.motif(motif).freq(all_freqs==f).dBsupp;
        c = vitals.motif(motif).freq(all_freqs==f).max_resp;
        scatter3(a,b,c, 100,'.');
        hold on;
        
        %Plots points that meet DC and dB criteria

        x = vitals.motif(motif).freq(all_freqs==f).diff_fl(inds);
        y = vitals.motif(motif).freq(all_freqs==f).dBsupp(inds);
        z = vitals.motif(motif).freq(all_freqs==f).max_resp(inds);
        scatter3(x,y,z,100, 'r', 'o', 'filled');
        
        hold on;
        
        %Plots points that meet DC, dB, and Max. Response criteria
        if length(find(inds_1)) > 0;
            i = vitals.motif(motif).freq(all_freqs==f).diff_fl(inds_1);
            j = vitals.motif(motif).freq(all_freqs==f).dBsupp(inds_1);
            k = vitals.motif(motif).freq(all_freqs==f).max_resp(inds_1);
            scatter3(i,j,k,100,'g', '*');
        end
        
        
        hold off;
        
        title('Negative Feedback/Incoherent Feedforward');
        
        if motif == motifs2process(1);
            legend([num2str(f) 'Hz'])
            xlabel('Sustained Response', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r'); 
            ylabel('Oscillatory Suppression (dB)', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r');
            zlabel('Maxiumum Response', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r');
        end
        

        %save INDS for each motif.
        %ind_mat(:,motif) = inds;
        
    end
   
    
else
    for motif = motifs2process;
        figure(1);
        subplot(4,5,motif)
        title(['Motif ' num2str(motif)]);
        plot(vitals.motif(motif).step_osc.freq(all_freqs==f).diff_fl,vitals.motif(motif).step_osc.freq(all_freqs==f).dBsupp,'.','markersize',2);
        hold on;
        xlabel('Amplified response');
        ylabel('dB Suppression');
        
        %find the simulation numbers (or INDiceS) that satisfy the
        %criteria specified at the top of the script.
        inds = (vitals.motif(motif).step_osc.freq(all_freqs==f).diff_fl > DC_diff_lim) & (vitals.motif(motif).step_osc.freq(all_freqs==f).dBsupp > dBsupp_lim);
        
        %plot scatter plots, outlining the good regions.
        plot(vitals.motif(motif).step_osc.freq(all_freqs==f).diff_fl(inds),vitals.motif(motif).step_osc.freq(all_freqs==f).dBsupp(inds),'.','color','r','markersize',7);
        line([DC_diff_lim 1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
        line([DC_diff_lim DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        line([-DC_diff_lim -1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
        line([-DC_diff_lim -DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        
        ylim([0 100]);
        xlim([-1 1]);
        
        %save INDS for each motif.
        %ind_mat(:,motif) = inds;
    end
end
%{
    for f = f_no;
    t = [-100:-1 0:1/(20*all_freqs(f)):(20/(all_freqs(f)))];
    input = .4*sin(2*pi*all_freqs(f)*t)+.5;
    
    for motif = motifs2process;
        if index.motif(motif).freq(f).index>0;
            for p = 1:length(index.motif(motif).freq(f).index)
                
                output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(all_freqs(f)) 'Hz.txt'])';
                figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']); %at index #' num2str(index.motif(motif).freq(f).index)]);
                subplot(2,1,1)
                plot(t,input, 'r');
                title('Input'); xlabel('Time (secs)'); ylabel('Amplitude');
                subplot(2,1,2)
                plot(t,output(index.motif(motif).freq(f).index(p),:));
                title('Output'); xlabel('Time (secs)'); ylabel('Amplitude');
            end
        end
    end

    
end
%}

%{

%Make a bar graph of normalized occurrence of satisfactory responses for
%each motif.
numgood = sum(ind_mat);
dlmwrite([home_dir '/sums_' num2str(Total_sims/1000) 'K_' num2str(f) 'Hz.txt'],numgood);
figure(3);
bar(numgood/Total_sims);
%}