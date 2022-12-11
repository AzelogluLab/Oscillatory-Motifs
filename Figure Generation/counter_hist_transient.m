%Jamil Reja
%July 2016


%clc
clear all
%close all

%Counting green dots. Need to run /find_subset_all_freqs.m first. 

home_dir = 'D:/Jamil/100K_Sims/output_dir';

load([home_dir '/counter.mat']);

N = 100000; %Total number of simulations

all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];

motifs2process = [1:20]; % [1:20]

f_no = [1:7];
value = [];
Total_sims = 100000;



figure('Numbertitle', 'off' ,'Name',['Counter']);    
legend_cell = cell(length(f_no),1);




i = 0;
    red = [1 0 0]; orange = [1 0.5 0]; yellow = [1 1 0]; green= [0 1 0];
    blue = [0 0 1]; indigo =[0 0 0.8]; purple = [0.5 0 0.9];
    Colors = {'red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'purple'};
for motif = motifs2process;
    
   
    
    for f = f_no;
    value = [];
    legend_cell{f_no==f} = [num2str(all_freqs(f)) 'Hz'];
    
   
        
        i = i +1; 
        results = find(counter.motif(motif).freq(f).dBandDCandMax);
        number.motif(motif).freq(f).dBandDCandMax = length(results);
        
        if number.motif(motif).freq(f).dBandDCandMax > 0;
            value(:,i) = [number.motif(motif).freq(f).dBandDCandMax];
            h.bar(f) = bar(value/Total_sims, 'FaceColor', eval(Colors{f}));
            xlabel('Motif Number' ,'FontSize', 24, 'FontWeight', 'bold', 'Color', 'r');
            title('Transient Responders','FontSize', 24, 'FontWeight', 'bold', 'Color', 'r'); 
            ylabel('Occurrences per 100000 Events','FontSize', 24, 'FontWeight', 'bold', 'Color', 'r');
            

           
            hold on;

        end
        
    
    end
    label = [1:20];
    ax = gca;
    ax.XTick = [1:7:141];
    ax.XTickLabel = (label);
    ax.FontSize = 12;
    ylim([0 12*10^-5]);
    set(gca, 'YTickLabel', [0:2:12]);
    
    
         
        
      
        
        
end
dim = [.2 .5 .3 .3];
str = {'Sustained Response < 0.1','Decibel  > 20', 'Maximum Response > 0.2'};
annotation('textbox',dim,'String',str,'FitBoxToText','on', 'FontSize', 14);

legend(h.bar,legend_cell);
