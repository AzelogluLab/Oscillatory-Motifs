%   Andrew Leader
%   Aug. 22, 2013

clc
clear all
close all

home_dir = 'D:/Jamil/100K_Sims/output_dir';
load([home_dir '/vitals_w_dB.mat']);

sig_types = {''};%{'','step_osc_in_'};
motifs2process = [1:20];%1:20;
all_freqsprocess = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no_to_process = [1:7];
Total_sims = 100000; %Total # of simulations per motif. Should be much greater than the number on each file.

legend_cell = cell(length(f_no_to_process),1);
for fno = f_no_to_process
    legend_cell{f_no_to_process==fno} = [num2str(all_freqsprocess(fno)) 'Hz'];
end
red = [1 0 0]; orange = [1 0.5 0]; yellow = [1 1 0]; green= [0 1 0];
    blue = [0 0 1]; indigo =[0 0 0.8]; purple = [0.5 0 0.9];
    Colors = {'red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'purple'};

feature_mat = NaN(Total_sims,length(f_no_to_process));
i = 0;
for type_no = 1:length(sig_types)
    for motif = motifs2process
        if type_no == 1
            for fno = f_no_to_process
                feature_mat(:,f_no_to_process==fno) = vitals.motif(motif).freq(fno).diff_fl';
            end
            i = i + 1;
            figure(1);
            
            subplot(4,5,i);
            [x,bins] = hist(feature_mat,50);
            stairs(bins,log10(x/Total_sims));
            title(['Motif ' num2str(motif)]);
            xlim([-.5 .5]);
            ylim([-3 0]);
            if motif == motifs2process(1) %change this number to add the axis, title, and legend labels
                xlabel('sustained response');
                ylabel('log_{10}(occurrence)');
                legend(legend_cell);
                
            end
            
            for fno = f_no_to_process
                feature_mat(:,f_no_to_process==fno) = vitals.motif(motif).freq(fno).dBsupp;
               
            end
            figure(2);
             subplot(4,5,i);
                [x,bins] = hist(feature_mat,0:4:400);
                stairs(bins,x/Total_sims, 'Color', red, 'Color', orange, 'Color', yellow, 'Color', green, 'Color', blue, 'Color', indigo, 'Color', purple);
                title(['Motif ' num2str(motif)]);
                ylim([0 .1])
                xlim([-50 400])
            
            if motif == motifs2process(1) %change this number to add the axis, title, and legend labels
                xlabel('dB suppression');
                ylabel('occurrence');
                legend(legend_cell);
                
            end
            
%             
%             
%         elseif type_no == 2
%             
%             for fno = f_no_to_process
%                 feature_mat(:,f_no_to_process==fno) = vitals.motif(motif).step_osc.freq(fno).diff_fl;
%             end
%             figure(3);
%             subplot(4,5,motif);
%             [x,bins] = hist(feature_mat,50);
%             stairs(bins,log10(x/Total_sims));
%             title(['Motif ' num2str(motif)]);
%             xlim([-.5 .5]);
%             ylim([-3 0]);
%             if motif == 1
%                 xlabel('sustained response');
%                 ylabel('log_{10}(occurrence)');
%                 legend(legend_cell);
%                 
%             end
%             
%             
%             
%             for fno = f_no_to_process
%                 feature_mat(:,f_no_to_process==fno) = vitals.motif(motif).step_osc.freq(fno).dBsupp;
%             end
%             figure(4);
%             subplot(4,5,motif);
%             [x,bins] = hist(feature_mat,0:4:400);
%             stairs(bins,x/Total_sims);
%             title(['Motif ' num2str(motif)]);
%             ylim([0 .15])
%             xlim([0 400])
%             if motif == 1
%                 xlabel('dB oscillations');
%                 ylabel('occurrence');
%                 legend(legend_cell);
%                 
%             end
%             
            
        end
    end
 end
