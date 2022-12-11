%   Andrew Leader
%   Aug 23, 2013
%   Edited By Jamil Reja
%   ~July 2016 

%   Creates a bar graph for each motif of the median amount of dB
%   suppression at each frequency.  The down errorbar shows the lowest
%   quartile.

clc
clear all
close all

home_dir = 'D:/Jamil/100K_Sims/output_dir';

motifs2process = [1:20];
freqs2process = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no_to_process = 1:7;
N = 100000; %Total number of simulations per motif

%This will be the x-axis
Names = {'.001','.003','.01','.03','.1','.3','1'};

feature_mat = NaN(N,length(f_no_to_process)); %Change the first nu
load([home_dir '/vitals_w_dB.mat']);

i = 0;
figure('Numbertitle', 'off' ,'Name',['dB Bar Graphs']);
for motif = motifs2process
    i = i +1;
        
        
        subplot(4,5,motif);
        
        legend_cell = cell(length(f_no_to_process),1);
        for fno = f_no_to_process;
            feature_mat(:,fno) = vitals.motif(motif).freq(fno).dBsupp;
            legend_cell{f_no_to_process==fno} = [num2str(freqs2process(fno)) 'Hz'];
        end
        med_feature = median(feature_mat);
        q1_feature = quantile(feature_mat,.25);
        q3_feature = quantile(feature_mat,.75);
        for j = 1:length(med_feature)
            
            if j == 1;
                bar(j, med_feature(j), 'FaceColor', [1 0 0]);
                set(gca,'xticklabel', ' ');
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
            elseif j == 2;
                bar(j, med_feature(j), 'FaceColor', [1 0.5 0]);
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
            elseif j == 3;
                bar(j, med_feature(j), 'FaceColor', [1 1 0]);
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
            elseif j ==4;
                bar(j, med_feature(j), 'FaceColor', [0 1 0]);
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
            elseif j == 5;
                bar(j, med_feature(j), 'FaceColor', [0 0 1]);
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
            elseif j == 6;
                bar(j, med_feature(j), 'FaceColor', [0 0 0.8]);
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
            elseif j == 7;
                bar(j, med_feature(j), 'FaceColor', [0.5 0 0.9]);
                text(j - 0.2, q3_feature(j) + med_feature(j), [num2str(round(med_feature(j)))], 'VerticalAlignment', 'top', 'FontSize' ,8, 'Color', [1 1 1]); 
                hold on;
                
            end
           
        end            
        
            %   SET THE X-AXIS TO THE CELL ARRAY 'NAMES'
            errorbar(1:7,med_feature,q1_feature,'xk');%q3_feature,'xw');
           
            ylim([0 300])
            set(gca, 'Color', [1 1 1]); 
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
            elseif motif == 17
                title({['Motif ' num2str(motif)]; 'Incoherent feedforward'});
            elseif motif == 18
                title({['Motif ' num2str(motif)]; 'Negative Coherent Feedforward'});
            elseif motif == 19
                title({['Motif ' num2str(motif)]; 'Coherent Feedforward'});
            elseif motif == 20
                title({['Motif ' num2str(motif)]; 'Negative Coherent Feedforward'});
                
            
            end
            
            if motif == motifs2process(16)
                xlabel('Input frequency (Hz)', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r');
                y = ylabel('Median Oscillatory Suppression (dB)', 'FontSize', 16, 'FontWeight', 'bold', 'Color', 'r');
                
                set(y, 'Units', 'Normalized', 'Position', [-0.3, 1, 0]);
                legend(legend_cell, 'TextColor', 'k');
            end
           
        
        end
        
        
        



