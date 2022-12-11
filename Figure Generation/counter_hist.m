%Jamil Reja
%July 2016


%clc
clear all
close all

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
for j = 1:141;
    
    label(:,j) = i;
    if i~= 0 && rem(i,20) == 0;
        label(:,j) = 20;
        i = 0;
    end
    i = i +5;
end
i = 0;
    
for f = f_no;
    value = [];
    legend_cell{f_no==f} = [num2str(all_freqs(f)) 'Hz'];
    xlabel([num2str(all_freqs(f)) ' Hz']);
   
    
    
    red = [1 0 0]; orange = [1 0.5 0]; yellow = [1 1 0]; green= [0 1 0];
    blue = [0 0 1]; indigo =[0 0 0.8]; purple = [0.5 0 0.9];
    Colors = {'red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'purple'};
    
    for motif = motifs2process;
        
        
        i = i +1; 
        results = find(counter.motif(motif).freq(f).dBandDCandMax);
        number.motif(motif).freq(f).dBandDCandMax = length(results);
        
        if number.motif(motif).freq(f).dBandDCandMax > 0;
            value(:,i) = [number.motif(motif).freq(f).dBandDCandMax];
            h.bar(f) = bar(value/Total_sims, 'FaceColor', eval(Colors{f}));
            xlabel('Motif #');
            title('Outlier Counter'); 
            ylabel('Occurrences');
            

           
            hold on;

        end
        
    
    end
     
    ax = gca;
    ax.XTick = [1:5:141];
    ax.XTickLabel = label;
    ylim([0 12*10^-5]); 
    
         
        
      
        
        
end
legend(h.bar,legend_cell);
