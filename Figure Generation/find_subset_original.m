%   Original find_subset script by Andrew Leader
%   Aug 22, 2013
clc
clear all
close all

home_dir = 'D:/Jamil/output_dir';

%   This script plots the DC-shift (X-axis) vs. dB suppression (Y-axis) for
%   all motifs at a given frequency, specified HERE:
f = 0.3; %other options: 0.01, 0.03, 0.1, 0.3, 1
motifs2process = [1:20];%[1:20];
%select for absolute DC shifts HIGHER than this:
DC_diff_lim = .1;
%select for dB suppression HIGHER than this:
dBsupp_lim = 10;
% Simple osc, or step osc?
step_osc = false;
Total_sims = 10000; %Total number of simulations per motif


all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
ind_mat = zeros(Total_sims,motifs2process(end));
load([home_dir '/vitals_w_dB.mat']);
%i = 0;


if step_osc ~= true
    for motif = motifs2process;
        %i = i+1;
        figure(1);
        subplot(4,5,motif)
        title(['Motif ' num2str(motif)]);
        plot(vitals.motif(motif).freq(all_freqs==f).diff_fl,vitals.motif(motif).freq(all_freqs==f).dBsupp,'.','markersize',2);
        hold on;
        
        if motif == 18
            xlabel('sustained response');
            ylabel('dB oscillation');
            legend([num2str(f) 'Hz']);
        end
        
        %find the simulation numbers (or INDiceS) that satisfy the
        %criteria specified at the top of the script.
        inds = (abs(vitals.motif(motif).freq(all_freqs==f).diff_fl) > DC_diff_lim) & (vitals.motif(motif).freq(all_freqs==f).dBsupp' > dBsupp_lim);
        
        %plot scatter plots, outlining the good regions.
        plot(vitals.motif(motif).freq(all_freqs==f).diff_fl(inds),vitals.motif(motif).freq(all_freqs==f).dBsupp(inds),'.','color','r','markersize',7);
        line([DC_diff_lim 1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
        line([DC_diff_lim DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        line([-DC_diff_lim -1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
        line([-DC_diff_lim -DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        
        ylim([-10 100]);
        xlim([-1 1]);
        title(['Motif ' num2str(motif)]);
        
        %save INDS for each motif.
        ind_mat(:,motif) = inds;
        b = 0;
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
        ind_mat(:,motif) = inds;
        
        a = 0;
    end
    
end

%Make a bar graph of normalized occurrence of satisfactory responses for
%each motif.
numgood = sum(ind_mat);
figure(2);
bar(numgood/Total_sims);