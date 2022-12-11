%   Andrew Leader
%   Aug. 22, 2013

home_dir = 'D:/Jamil/100K_Sims/output_dir';
load([home_dir '/vitals_w_dB.mat']);

sig_types = {''};%{'','step_osc_in_'};
motifs2process = 1:20;%1:20;
all_freqsprocess = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no_to_process = [1:7];
Total_sims = 100000;

legend_cell = cell(length(f_no_to_process),1);
for fno = f_no_to_process
    legend_cell{f_no_to_process==fno} = [num2str(all_freqsprocess(fno)) 'Hz'];
end


feature_mat = NaN(Total_sims,length(f_no_to_process));
titles = {'Positive Feedback', 'Negative Feedback'};
for type_no = 1:length(sig_types)
    for motif = motifs2process
        if type_no == 1
            for fno = f_no_to_process
                feature_mat(:,f_no_to_process==fno) = vitals.motif(motif).freq(fno).diff_fl';
            end
            figure(1);
            subplot(4,5,motif);
            [x,bins] = hist(feature_mat,50);
            stairs(bins,log10(x/Total_sims));
            
            xlim([-.5 .5]);
            ylim([-3 0.1]);
           
            
            if motif == 1
                title({['Motif ' num2str(motif)]; 'Positive Feedback'});
                legend(legend_cell);
            elseif motif == 2
                title({['Motif ' num2str(motif)]; 'Negative Feedback'});
            end
            %}
            for fno = f_no_to_process
                feature_mat(:,f_no_to_process==fno) = vitals.motif(motif).freq(fno).dBsupp;
            end
            figure(2);
            subplot(4,5,motif);
            [x,bins] = hist(feature_mat,0:4:400);
            stairs(bins,x/Total_sims);
            title(['Motif ' num2str(motif)]);
            %ylim([0 .1])
            xlim([-50 400])
            ylim([0 0.1])
            if motif == 1
                title({['Motif ' num2str(motif)]; 'Positive Feedback'});
                legend(legend_cell);
            elseif motif == 2
                title({['Motif ' num2str(motif)]; 'Negative Feedback'});
            elseif motif == 3
                title({['Motif ' num2str(motif)]; 'Negative Coherent Feedforward'});
            elseif motif == 4
                title({['Motif ' num2str(motif)]; 'Coherent Feedforward'});
            elseif motif == 5
                title({['Motif ' num2str(motif)]; 'Incoherent Feedforward'});
            elseif motif == 6
                title({['Motif ' num2str(motif)]; 'Positive-Positive'});
            elseif motif == 7
                title({['Motif ' num2str(motif)]; 'Negative-Negative'});
            elseif motif == 8
                title({['Motif ' num2str(motif)]; 'Positive-Negative'});
            elseif motif == 9
                title({['Motif ' num2str(motif)]; 'Coherent Feedforward'});
            elseif motif == 10
                title({['Motif ' num2str(motif)]; '2xN Positive Feedback'});
            elseif motif == 11
                title({['Motif ' num2str(motif)]; 'Negative feedback/coherent feedforward'});
            elseif motif == 12
                title({['Motif ' num2str(motif)]; 'Negative feedback/incoherent feedforward'});
            elseif motif == 13
                title({['Motif ' num2str(motif)]; 'Negative feedback/coherent feedforward'});
            elseif motif == 14
                title({['Motif ' num2str(motif)]; '2x Negative feedback'});
            elseif motif == 15
                title({['Motif ' num2str(motif)]; 'Coherent feedforward'});
            elseif motif == 16
                title({['Motif ' num2str(motif)]; 'Incoherent feedforward'});
                xlabel('Oscillatory Suppression (dB)', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r');
                y = ylabel(' Occurrence Probability', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r');
                set(y, 'Units', 'Normalized', 'Position', [-0.3, 1, 0]);
                
            elseif motif == 17
                title({['Motif ' num2str(motif)]; 'Incoherent feedforward'});
            elseif motif == 18
                title({['Motif ' num2str(motif)]; 'Negative Coherent Feedforward'});
            elseif motif == 19
                title({['Motif ' num2str(motif)]; 'Coherent Feedforward'});
            elseif motif == 20
                title({['Motif ' num2str(motif)]; 'Negative Coherent Feedforward'});
                
            
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
