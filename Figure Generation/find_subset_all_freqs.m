%   Andrew Leader
%   Aug 22, 2013
%   Edited by Jamil Reja
%   ~June 2016
clc
clear all
%close all

home_dir = 'D:/JAMIL/Jamil/100K_Sims/output_dir';

%   This script plots the DC-shift (X-axis) vs. dB suppression (Y-axis) for
%   all motifs at a given frequency, specified HERE:
%f = 0.001; %other options: 0.01, 0.03, 0.1, 0.3, 1
motifs2process = [1:20];%[1:20];
%select for absolute DC shifts HIGHER than this:
DC_diff_lim = 0.1;
%select for dB suppression HIGHER than this:
dBsupp_lim = 20;
%select for a maximum response HIGHER than this:
max_resp_lim = 0.2;
% Simple osc, or step osc?
step_osc = false;
Total_sims = 100000; %Total number of simulations per motif



f_no = [1:7];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
ind_mat = zeros(Total_sims,motifs2process(end));
load([home_dir '/vitals_w_dB.mat']);
i = 0;

if step_osc ~= true

    for f = f_no;
        figure('Numbertitle', 'off' ,'Name', [num2str(all_freqs(f)) 'Hz - 2D Plot']);
        for motif = motifs2process;
            i = i+1;
            subplot(4,5,motif)
            title(['Motif ' num2str(motif)]);
            plot(vitals.motif(motif).freq(f).diff_fl,vitals.motif(motif).freq(f).dBsupp,'.','markersize',2);
            hold on;
            
            
        
            if motif == motifs2process(i);
                xlabel('sustained response');
                ylabel('dB oscillation');
                legend([num2str(all_freqs(f)) 'Hz']);
            end
        
        
        %find the simulation numbers (or INDiceS) that satisfy the
        %criteria specified at the top of the script.
            inds(:,motif) = (abs(vitals.motif(motif).freq(f).diff_fl) > DC_diff_lim)  & (vitals.motif(motif).freq(f).dBsupp' > dBsupp_lim);
            inds_1(:,motif) = (abs(vitals.motif(motif).freq(f).diff_fl) < DC_diff_lim) & (vitals.motif(motif).freq(f).dBsupp' > dBsupp_lim) & (abs(vitals.motif(motif).freq(f).max_resp') > max_resp_lim);
            
        
        %plot scatter plots, outlining the good regions.
            plot(vitals.motif(motif).freq(f).diff_fl(inds(:,motif)),vitals.motif(motif).freq(f).dBsupp(inds(:,motif)),'.','color','r','markersize',7);
            line([DC_diff_lim 1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
            line([DC_diff_lim DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
            line([-DC_diff_lim -1],[dBsupp_lim dBsupp_lim],'color','k','LineStyle','--');
            line([-DC_diff_lim -DC_diff_lim],[dBsupp_lim 100],'color','k','LineStyle','--');
        
            ylim([-10 100]);
            xlim([-1 1]);
            title(['Motif' num2str(motif)]);
            hold off;
        %save INDS for each motif.
        %ind_mat(:,motif) = inds;
           if i == length(motifs2process);
                i = 0;
           end
        end
    end


    

m = 0;
for f = f_no;
    
    figure('Numbertitle', 'off' ,'Name', [num2str(all_freqs(f)) 'Hz - 3D Plot']);
    for motif = motifs2process;
        
        inds(:,motif) = (abs(vitals.motif(motif).freq(f).diff_fl) > DC_diff_lim) & (vitals.motif(motif).freq(f).dBsupp' > dBsupp_lim);
        inds_1(:,motif) = (abs(vitals.motif(motif).freq(f).diff_fl) < DC_diff_lim) & (vitals.motif(motif).freq(f).dBsupp' > dBsupp_lim) & (abs(vitals.motif(motif).freq(f).max_resp') > max_resp_lim);
        index.motif(motif).freq(f).index = find(inds_1(:,motif));
        index_red.motif(motif).freq(f).index = find(inds(:,motif)); 
        counter.motif(motif).freq(f).dBandDC = inds(:,motif);
        counter.motif(motif).freq(f).dBandDCandMax = inds_1(:,motif);
        
        results = find(counter.motif(motif).freq(f).dBandDCandMax);
        if length(results) > 0;
            fprintf(['\n' num2str(length(results)) ' result(s) found at motif # ' num2str(motif) ' at frequency ' num2str(all_freqs(f)) ' Hz at index #s \n']) 
            if length(index.motif(motif).freq(f).index) > 0
                for index_length = 1:length(index.motif(motif).freq(f).index)
                    fprintf([num2str(index.motif(motif).freq(f).index(index_length)) ', ']);
                end
                
         
                
            
            end
            fprintf('\n');
        end
        
        m = m+1;
        
        subplot(4,5,motif)
        
        
        %Plots all points
        a = vitals.motif(motif).freq(f).diff_fl;
        b = vitals.motif(motif).freq(f).dBsupp;
        c = vitals.motif(motif).freq(f).max_resp;
        scatter3(a,b,c, 2,'.');
        hold on;
        
        %Plots points that meet DC and dB criteria

        x = vitals.motif(motif).freq(f).diff_fl(inds(:,motif));
        y = vitals.motif(motif).freq(f).dBsupp(inds(:,motif));
        z = vitals.motif(motif).freq(f).max_resp(inds(:,motif));
        scatter3(x,y,z,16, 'r', 'o' );
        
        hold on;
        
        %Plots points that meet DC, dB, and Max. Response criteria
        
        if length(find(inds_1)) > 0;
            i = vitals.motif(motif).freq(f).diff_fl(inds_1(:,motif));
            j = vitals.motif(motif).freq(f).dBsupp(inds_1(:,motif));
            k = vitals.motif(motif).freq(f).max_resp(inds_1(:,motif));
            scatter3(i,j,k,32,'g', '*');
        end
        
        
        title(['Motif ' num2str(motif)]);
        xlim([-1 1]); zlim([-1 1]); 
        if motif == motifs2process(1);
            legend([num2str(all_freqs(f)) 'Hz']);
            xlabel(['sustained response']); ylabel(['dB suppression']); zlabel(['Max Response']);
        end
        hold off;
        %}
        if m == length(motifs2process);
                m = 0;
        end
        
        
        
    end
end


save([home_dir '/counter.mat'],'counter');
save([home_dir '/index.mat'],'index');
save([home_dir '/index_red.mat'], 'index_red');
%Finds number of results

%Input/Output Plots
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
    end
end

  

%{
%Make a bar graph of normalized occurrence of satisfactory responses for
%each motif.
numgood = sum(ind_mat);
dlmwrite([home_dir '/sums_' num2str(Total_sims/1000) 'K_' num2str(f) 'Hz.txt'],numgood);
figure(3);
bar(numgood/Total_sims);
        %}