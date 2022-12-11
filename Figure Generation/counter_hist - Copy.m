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
figure(1)
Total_sims = 100000;

figure('Numbertitle', 'off' ,'Name',['Counter']);    
for f = f_no;
    value = [];
    
    xlabel([num2str(all_freqs(f)) ' Hz']);
    ax = gca;
    ax.XTick = [0:5:20];
    
    if f == f_no(1);
        ylabel('Occurrences');
    end
    
    red = [1 0 0]; orange = [1 0.5 0]; yellow = [1 1 0]; green= [0 1 0];
    blue = [0 0 1]; indigo =[0 0 0.8]; purple = [0.5 0 0.9];
    Colors = {'red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'purple'};
    
    for motif = motifs2process;
        
       
        results = find(counter.motif(motif).freq(f).dBandDCandMax);
        number.motif(motif).freq(f).dBandDCandMax = length(results);
        if number.motif(motif).freq(f).dBandDCandMax > 0;
            value(:,motif) = [number.motif(motif).freq(f).dBandDCandMax];
            bar(value/Total_sims, 'FaceColor', eval(Colors{f}));
            xlabel([num2str(all_freqs(f)) ' Hz']);
            ax = gca;
            ax.XTick = [0:5:20];
            ylim([0 12*10^-5]);
            hold on;
            
        end
        
            
        
    
    end
    
    
   
        
        
         
end


