clc
clear all
close all


home_dir = (['D:/Jamil/100K_Sims/output_dir']);
load([home_dir '/index_fft.mat']);

motifs2process = [2,11,12];

all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];

N_ = 5000; %Number of simulations per file 
N = 10000;
kmax = 20;


for motif = motifs2process
    figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif)]);
    c = ([]);
    plot_values = ([]);
    
    index_motif = index.motif(motif).freq.index;
    for k = 1:kmax;
       params = load([home_dir '/motif_' num2str(motif) '/params/params_' num2str(k) '_' num2str(N_) '.mat']);
       c = [c, params];
       plot_values = [plot_values, c(k).params];  
    end
    save([home_dir '/plot_values' num2str(motif) '.mat'], 'plot_values');

       for i = index_motif; %index_motif
            
            if motif == 2 
                
                a = zeros(1,length(plot_values(i).kcataf)); b = 1*ones(1,length(plot_values(i).kcatar));
                c = 2*ones(1,length(plot_values(i).kcatbf)); d = 3*ones(1,length(plot_values(i).kcatcf)); 
                g = 4*ones(1,length(plot_values(i).Kmaf)); h = 5*ones(1,length(plot_values(i).Kmar));
                j = 6*ones(1,length(plot_values(i).Kmbf)) ; l = 7*ones(1,length(plot_values(i).Kmcf));


                x_0 = [plot_values(i).kcataf];
                x_1 = [plot_values(i).kcatar];
                x_2 = [plot_values(i).kcatbf];
                x_3 = [plot_values(i).kcatcf];

                x_4 = [plot_values(i).Kmaf];
                x_5 = [plot_values(i).Kmar];
                x_6 = [plot_values(i).Kmbf];
                x_7 = [plot_values(i).Kmcf];


                scatter(a, x_0(1,:),50,'g');
                hold on
                scatter(b, x_1(1,:),50,'g');
                hold on
                scatter(c, x_2(1,:),50,'g');
                hold on
                scatter(d, x_3(1,:),50, 'g');
                hold on
                scatter(g, x_4(1,:),50, 'g');
                hold on
                scatter(h, x_5(1,:),50, 'g');
                hold on
                scatter(j, x_6(1,:),50, 'g');
                hold on
                scatter(l, x_7(1,:),50, 'g');
                hold on

                ax = gca;
                ax.XTickLabel = {' ', 'kcataf', 'kcatar', 'kcatbf', 'kcatcf', 'Kmaf', 'Kmar', 'Kmbf', 'Kmcf', ' ' , ' ' };
                xlim([-1 8]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
                xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
                title(['Motif ' num2str(motif)]); 
                dim = [.2 .5 .3 .3];
                str = {num2str(length(index_motif))};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                
                
            elseif motif == 11
                 
                 a = zeros(1,length(plot_values(i).kcataf)); b = 1*ones(1,length(plot_values(i).kcatar));
                 c = 2*ones(1,length(plot_values(i).kcatbf)); d = 3*ones(1,length(plot_values(i).kcatcfa)); 
                 e = 4*ones(1,length(plot_values(i).kcatcfb)); g = 5*ones(1,length(plot_values(i).Kmaf)); h = 6*ones(1,length(plot_values(i).Kmar));
                 j = 7*ones(1,length(plot_values(i).Kmbf)) ; l = 8*ones(1,length(plot_values(i).Kmcfa)); m = 9*ones(1,length(plot_values(i).Kmcfb)); 

                x_0 = [plot_values(i).kcataf];
                x_1 = [plot_values(i).kcatar];
                x_2 = [plot_values(i).kcatbf];
                x_3 = [plot_values(i).kcatcfa];

                x_4 = [plot_values(i).kcatcfb];
                x_5 = [plot_values(i).Kmaf];
                x_6 = [plot_values(i).Kmar];
                x_7 = [plot_values(i).Kmbf];
                x_8 = [plot_values(i).Kmcfa];
                x_9 = [plot_values(i).Kmcfb];


                scatter(a, x_0(1,:),50, 'g');
                hold on
                scatter(b, x_1(1,:),50, 'g');
                hold on
                scatter(c, x_2(1,:),50, 'g');
                hold on
                scatter(d, x_3(1,:),50, 'g');
                hold on
                scatter(e, x_4(1,:),50, 'g');
                hold on
                scatter(g, x_5(1,:),50, 'g');
                hold on
                scatter(h, x_6(1,:),50, 'g');
                hold on
                scatter(j, x_7(1,:),50, 'g');
                hold on
                scatter(l, x_8(1,:),50, 'g');
                hold on
                scatter(m, x_9(1,:),50, 'g');
                hold on

                ax = gca;
                ax.XTickLabel = {' ', 'kcataf', 'kcatar', 'kcatbf', 'kcatcfa','kcatcfb', 'Kmaf', 'Kmar', 'Kmbf', 'Kmcfa', 'Kmcfb' , ' ' };
                xlim([-1 10]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
                xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
                title(['Motif ' num2str(motif)]); 
                dim = [.2 .5 .3 .3];
                str = {num2str(length(index_motif))};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                
            
            
            elseif motif == 12
                 
                 a = zeros(1,length(plot_values(i).kcatafx)); b = 1*ones(1,length(plot_values(i).kcatafc));
                 c = 2*ones(1,length(plot_values(i).kcatbf)); d = 3*ones(1,length(plot_values(i).kcatcf)); 
                 e = 4*ones(1,length(plot_values(i).kcatcr)); g = 5*ones(1,length(plot_values(i).Kmafx)); h = 6*ones(1,length(plot_values(i).Kmafc));
                 j = 7*ones(1,length(plot_values(i).Kmbf)) ; l = 8*ones(1,length(plot_values(i).Kmcf)); m = 9*ones(1,length(plot_values(i).Kmcr)); 

                x_0 = [plot_values(i).kcatafx];
                x_1 = [plot_values(i).kcatafc];
                x_2 = [plot_values(i).kcatbf];
                x_3 = [plot_values(i).kcatcf];

                x_4 = [plot_values(i).kcatcr];
                x_5 = [plot_values(i).Kmafx];
                x_6 = [plot_values(i).Kmafc];
                x_7 = [plot_values(i).Kmbf];
                x_8 = [plot_values(i).Kmcf];
                x_9 = [plot_values(i).Kmcr];


                scatter(a, x_0(1,:),50,'g');
                hold on
                scatter(b, x_1(1,:),50, 'g');
                hold on
                scatter(c, x_2(1,:),50, 'g');
                hold on
                scatter(d, x_3(1,:),50, 'g');
                hold on
                scatter(e, x_4(1,:),50, 'g');
                hold on
                scatter(g, x_5(1,:),50, 'g');
                hold on
                scatter(h, x_6(1,:),50, 'g');
                hold on
                scatter(j, x_7(1,:),50, 'g');
                hold on
                scatter(l, x_8(1,:),50, 'g');
                hold on
                scatter(m, x_9(1,:),50, 'g');
                hold on

                ax = gca;
                ax.XTickLabel = {' ', 'kcatafx', 'kcatafc', 'kcatbf', 'kcatcf','kcatcr', 'Kmafx', 'Kmafc', 'Kmbf', 'Kmcf', 'Kmcr' , ' ' };
                xlim([-1 10]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
                xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
                title(['Motif ' num2str(motif)]);
                dim = [.2 .5 .3 .3];
                str = { num2str(length(index_motif))};
                annotation('textbox',dim,'String',str,'FitBoxToText','on');
                
            end
       end
end

       
       


                

