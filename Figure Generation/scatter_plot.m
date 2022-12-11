%clc
clear all
close all

%This script will produce a scatter plot of the parameters - %Green dots
%only 

home_dir = (['D:/Jamil/motif19_param_sweep_10K/output_dir']);

load([home_dir '/index.mat']);

motifs2process = [19];
f_no = [7];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 500;
N = 10000;
kmax = 20;

c = ([]);
combined_params = ([]);
for k = 1:kmax;
   params = load([home_dir '/motif_19/params/params_' num2str(k) '_' num2str(N_) '.mat']);
   c = [c, params];
   combined_params = [combined_params, c(k).params];  
  
end
a = 1; b = 1; c = 1; d = 1; e = 1; g = 1; h = 1; j = 1;
l = 1; m = 1;


    
    for f = f_no
        
        for motif = motifs2process;
        
        for i = 1:length(index.motif(motif).freq(f).index);
            if index.motif(motif).freq(f).index(i) > 0 && index.motif(motif).freq(f).index(i) <= 1000;
                
                plot_values.kcataf(:,a) = combined_params(index.motif(motif).freq(f).index(i)).kcataf(1);
                a = a +1;
            
            
            elseif index.motif(motif).freq(f).index(i) > 1000 && index.motif(motif).freq(f).index(i) <= 2000;
                
                plot_values.kcatbf(:,b) = combined_params(index.motif(motif).freq(f).index(i)).kcatbf(1);
                b = b +1;
                
                
                
            
            elseif index.motif(motif).freq(f).index(i) > 2000 && index.motif(motif).freq(f).index(i) <= 3000;
                
                plot_values.kcatcr(:,c) = combined_params(index.motif(motif).freq(f).index(i)).kcatcr(1);
                c = c +1;
                
           
           
            elseif index.motif(motif).freq(f).index(i) > 3000 && index.motif(motif).freq(f).index(i) <= 4000;
                
               
                plot_values.kcatdf(:,d) = combined_params(index.motif(motif).freq(f).index(i)).kcatdf(1);
                d = d + 1;
                
           
            elseif index.motif(motif).freq(f).index(i) > 4000 && index.motif(motif).freq(f).index(i) <= 5000;
                
                
                plot_values.kcatdr(:,e) = combined_params(index.motif(motif).freq(f).index(i)).kcatdr(1);
                e = e + 1;
                
            
            elseif index.motif(motif).freq(f).index(i) > 5000 && index.motif(motif).freq(f).index(i) <=6000;
                 
                 plot_values.Kmaf(:,g) = combined_params(index.motif(motif).freq(f).index(i)).Kmaf(1);
                 
                 g = g +1;
            elseif index.motif(motif).freq(f).index(i) > 6000 && index.motif(motif).freq(f).index(i) <= 7000;
                
                 plot_values.Kmbf(:,h) = combined_params(index.motif(motif).freq(f).index(i)).Kmbf(1);
                 h = h + 1;
            elseif index.motif(motif).freq(f).index(i) > 7000 && index.motif(motif).freq(f).index(i) <= 8000;
                 
                 plot_values.Kmcr(:,j) = combined_params(index.motif(motif).freq(f).index(i)).Kmcr(1);
                 j = j +1;
            elseif index.motif(motif).freq(f).index(i) >8000  && index.motif(motif).freq(f).index(i) <= 9000;
                
                 
                 plot_values.Kmdf(:,l) = combined_params(index.motif(motif).freq(f).index(i)).Kmdf(1);
                 l = l+1;   
            elseif index.motif(motif).freq(f).index(i) >9000  && index.motif(motif).freq(f).index(i) <= 10000;
                                
                 
                 plot_values.Kmdr(:,m) = combined_params(index.motif(motif).freq(f).index(i)).Kmdr(1);
                 m = m +1;
                 
            end
            
            
            
            
            
        end
    end
    end
    %{
    figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']);
    plot = [plot_values.kcataf plot_values.kcatbf plot_values.kcatcr plot_values.kcatdf plot_values.kcatdr plot_values.Kmaf plot_values.Kmbf plot_values.Kmcr plot_values.Kmdf plot_values.Kmdr]; 
    group = [zeros(1,5), ones(1,5), 2*ones(1,10), 3*ones(1,length(plot_values.kcatdf)), 4*ones(1,length(plot_values.kcatdr)), 5*ones(1,length(plot_values.Kmaf)), 6*ones(1,length(plot_values.Kmbf)), 7*ones(1,length(plot_values.Kmcr)), 8*ones(1,length(plot_values.Kmdf)), 9*ones(1,length(plot_values.Kmdr))];
    scatter(plot,group ,'Labels', {'kcataf', 'kcatbf', 'kcatcr', 'kcatdf', 'kcatdr', 'Kmaf', 'Kmbf', 'Kmcr', 'Kmdf', 'Kmdr'});
    set(gca,'yscale', 'log'); ylim([10^-3 10^2])               
    set(plot(1:4:end), 'markerfacecolor', [0.4, 1, 0.4], 'color', [0 0.4, 0]);    
    %}
    figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']);
    a = zeros(1,length(plot_values.kcataf));  b = ones(1,length(plot_values.kcatbf)); c = 2*ones(1,length(plot_values.kcatcr));
    d = 3*ones(1,length(plot_values.kcatdf)); e =4*ones(1,length(plot_values.kcatdr)); g = 5*ones(1,length(plot_values.Kmaf)); 
    h = 6*ones(1,length(plot_values.Kmbf));
    j = 7*ones(1,length(plot_values.Kmcr)) ; l = 8*ones(1,length(plot_values.Kmdf)); m = 9*ones(1,length(plot_values.Kmdr)); b = ones(1,5);
    x_0 = [plot_values.kcataf];
    x_1 = [plot_values.kcatbf];
    x_2 = [plot_values.kcatcr];
    x_3 = [plot_values.kcatdf];
    x_4 = [plot_values.kcatdr];
    x_5 = [plot_values.Kmaf];
    x_6 = [plot_values.Kmbf];
    x_7 = [plot_values.Kmcr];
    x_8 = [plot_values.Kmdf];
    x_9 = [plot_values.Kmdr];
         
    scatter(a, x_0(1,:));
    hold on
    scatter(b, x_1(1,:));
    hold on
    scatter(c, x_2(1,:));
    hold on
    scatter(d, x_3(1,:));
    hold on
    scatter(e, x_4(1,:));
    hold on
    scatter(g, x_5(1,:));
    hold on
    scatter(h, x_6(1,:));
    hold on
    scatter(j, x_7(1,:));
    hold on
    scatter(l, x_8(1,:));
    hold on
    scatter(m, x_9(1,:)),
    hold off; 
    
    
    ax = gca;
    ax.XTickLabel = {' ', 'kcataf', 'kcatbf', 'kcatcr', 'kcatdf', 'kcatdr', 'Kmaf', 'Kmbf', 'Kmcr', 'Kmdf', 'Kmdr', ' '};
    xlim([-1 10]); set(gca,'yscale', 'log'); ylim([10^-3 10^2])
    xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
    title('Motif 19 - 1 Hz'); 
    %}