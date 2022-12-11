clc
clear all
%close all

%This script will produce a scatter plot of the parameters 


% BLUE DOTS%%% 
home_dir = (['D:/Jamil/100K_Sims/output_dir']);

load([home_dir '/index.mat']);
f_no = [7]; 
motifs2process = [12];

all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 5000; %Number of simulations per file 
N = 10000;
kmax = 20;


c = ([]);
plot_values = ([]);
for k = 1:kmax;
   params = load([home_dir '/motif_' num2str(motifs2process) '/params/params_' num2str(k) '_' num2str(N_) '.mat']);
   c = [c, params];
   plot_values = [plot_values, c(k).params];  
  
end
%{
a = 1; b = 1; c = 1; d = 1; e = 1; g = 1; h = 1; j = 1;
l = 1; m = 1;

%}
n = 100000;

for f = f_no;
        for motif = motifs2process;
            
            figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']);
            a = zeros(1,n); 
            b = ones(1,n); c = 2*ones(1,n); d = 3*ones(1,n); e =4*ones(1,n); g = 5*ones(1,n); 
            h = 6*ones(1,n);
            j = 7*ones(1,n) ; l = 8*ones(1,n); m = 9*ones(1,n); 
            x_0 = [plot_values.kcatafx];
            x_1 = [plot_values.kcatafc];
            x_2 = [plot_values.kcatbf];
            x_3 = [plot_values.kcatcf];
            x_4 = [plot_values.kcatcr];
            x_5 = [plot_values.Kmafx];
            x_6 = [plot_values.Kmafc];
            x_7 = [plot_values.Kmbf];
            x_8 = [plot_values.Kmcf];
            x_9 = [plot_values.Kmcr];

            scatter(a, x_0(1,:),'b');
            hold on
            scatter(b, x_1(1,:),'b');
            hold on
            scatter(c, x_2(1,:),'b');
            hold on
            scatter(d, x_3(1,:),'b');
            hold on
            scatter(e, x_4(1,:),'b');
            hold on
            scatter(g, x_5(1,:),'b');
            hold on
            scatter(h, x_6(1,:),'b');
            hold on
            scatter(j, x_7(1,:),'b');
            hold on
            scatter(l, x_8(1,:),'b');
            hold on
            scatter(m, x_9(1,:),'b');
            hold on;
            


            
        end

end
ax = gca;
    ax.XTickLabel = {' ', 'kcataf', 'kcatbf', 'kcatcr', 'kcatdf', 'kcatdr', 'Kmaf', 'Kmbf', 'Kmcr', 'Kmdf', 'Kmdr', ' '};
    xlim([-1 10]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
    xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
    title(['Motif' num2str(motif) ' - ' num2str(all_freqs(f_no)) ' Hz']); 
%% Red Dots %%
%{
clear all
home_dir = (['D:/Jamil/100K_Sims/output_dir']);
load([home_dir '/index_red.mat']);

motifs2process = [12];
f_no = [7];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 5000;
N = 100000;
kmax = 20;

c = ([]);
combined_params = ([]);
for k = 1:kmax;
   params = load([home_dir '/motif_' num2str(motifs2process) '/params/params_' num2str(k) '_' num2str(N_) '.mat']);
   c = [c, params];
   combined_params = [combined_params, c(k).params];  
  
end
a = 1; b = 1; c = 1; d = 1; e = 1; g = 1; h = 1; j = 1;
l = 1; m = 1;



    
             
    for f = f_no
        for motif = motifs2process;
            if length(index_red.motif(motif).freq(f).index) > 0;
                for i = 1:length(index_red.motif(motif).freq(f).index);
                    plot_values.kcatafx(:,a) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatafx(1);
                    a = a +1;
                    plot_values.kcatafc(:,b) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatafc(1);
                    b = b +1;
                    plot_values.kcatbf(:,c) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatbf(1);
                    c = c +1;
                    plot_values.kcatcf(:,d) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatcf(1);
                    d = d + 1;
                    plot_values.kcatcr(:,e) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatcr(1);
                    e = e + 1;
                    plot_values.Kmafx(:,g) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmafx(1);
                    g = g +1;
                    plot_values.Kmafc(:,h) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmafc(1);
                    h = h + 1; 
                    plot_values.Kmbf(:,l) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmbf(1);
                   
                    j = j +1; 
                    plot_values.Kmcf(:,j) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmcf(1);
                    l = l+1;
                    plot_values.Kmcr(:,m) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmcr(1);
                    m = m +1;     
                

                        
                                    
                            
            end
        end
    end

    
end

   
   
   
    if length(index_red.motif(motif).freq(f).index) > 0;
    
        a = zeros(1,length(plot_values.kcatafx)); b = 1*ones(1,length(plot_values.kcatafc));
        c = 2*ones(1,length(plot_values.kcatbf)); d = 3*ones(1,length(plot_values.kcatcf)); 
        e = 4*ones(1,length(plot_values.kcatcr)); g = 5*ones(1,length(plot_values.Kmafx)); h = 6*ones(1,length(plot_values.Kmafc));
        j = 7*ones(1,length(plot_values.Kmbf)) ; l = 8*ones(1,length(plot_values.Kmcf)); m = 9*ones(1,length(plot_values.Kmcr)); 
        x_0 = [plot_values.kcatafx];
        x_1 = [plot_values.kcatafc];
        x_2 = [plot_values.kcatbf];
        x_3 = [plot_values.kcatcf];
        x_4 = [plot_values.kcatcr];
        x_5 = [plot_values.Kmafx];
        x_6 = [plot_values.Kmafc];
        x_7 = [plot_values.Kmbf];
        x_8 = [plot_values.Kmcf];
        x_9 = [plot_values.Kmcr];
        scatter(a, x_0(1,:),'r');
        hold on
        scatter(b, x_1(1,:),'r');
        hold on
        scatter(c, x_2(1,:),'r');
        hold on
        scatter(d, x_3(1,:),'r');
        hold on
        scatter(e, x_4(1,:),'r');
        hold on
        scatter(g, x_5(1,:),'r');
        hold on
        scatter(h, x_6(1,:),'r');
        hold on
        scatter(j, x_7(1,:),'r');
        hold on
        scatter(l, x_8(1,:),'r');
        hold on
        scatter(m, x_9(1,:),'r');
        hold on
    else
        fprintf(['\nThere are no red dots at ' num2str(all_freqs(f)) ' Hz \n']);
    end
    
%}

%% Green Dots %% 

clear all


%This script will produce a scatter plot of the parameters - %Green dots
%only 

home_dir = (['D:/Jamil/100K_Sims/output_dir']);

load([home_dir '/index.mat']);

motifs2process = [12];
f_no = [1];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 5000;
N = 100000;
kmax = 20;

c = ([]);
combined_params = ([]);
for k = 1:kmax;
   params = load([home_dir '/motif_' num2str(motifs2process) '/params/params_' num2str(k) '_' num2str(N_) '.mat']);
   c = [c, params];
   combined_params = [combined_params, c(k).params];  
  
end
a = 1; b = 1; c = 1; d = 1; e = 1; g = 1; h = 1; j = 1;
l = 1; m = 1;


    
     for f = f_no
        for motif = motifs2process;
            if length(index.motif(motif).freq(f).index) > 0;
                for i = 1:length(index.motif(motif).freq(f).index);
                    plot_values.kcatafx(:,a) = combined_params(index.motif(motif).freq(f).index(i)).kcatafx(1);
                    a = a +1;
                    plot_values.kcatafc(:,b) = combined_params(index.motif(motif).freq(f).index(i)).kcatafc(1);
                    b = b +1;
                    plot_values.kcatbf(:,c) = combined_params(index.motif(motif).freq(f).index(i)).kcatbf(1);
                    c = c +1;
                    plot_values.kcatcf(:,d) = combined_params(index.motif(motif).freq(f).index(i)).kcatcf(1);
                    d = d + 1;
                    plot_values.kcatcr(:,e) = combined_params(index.motif(motif).freq(f).index(i)).kcatcr(1);
                    e = e + 1;
                    plot_values.Kmafx(:,g) = combined_params(index.motif(motif).freq(f).index(i)).Kmafx(1);
                    g = g +1;
                    plot_values.Kmafc(:,h) = combined_params(index.motif(motif).freq(f).index(i)).Kmafc(1);
                    h = h + 1; 
                    plot_values.Kmbf(:,j) = combined_params(index.motif(motif).freq(f).index(i)).Kmbf(1);
                    j = j +1; 
                    plot_values.Kmcf(:,l) = combined_params(index.motif(motif).freq(f).index(i)).Kmcf(1);
                 
                    l = l+1;
                    plot_values.Kmcr(:,m) = combined_params(index.motif(motif).freq(f).index(i)).Kmcr(1);
                    m = m +1;     
                

                        
                                    
                            
            end
        end
    end

    
end

   
   
   
    if length(index.motif(motif).freq(f).index) > 0;
    

        x_0 = [plot_values.kcatafx];
        x_1 = [plot_values.kcatafc];
        x_2 = [plot_values.kcatbf];
        x_3 = [plot_values.kcatcf];
        x_4 = [plot_values.kcatcr];
        x_5 = [plot_values.Kmafx];
        x_6 = [plot_values.Kmafc];
        x_7 = [plot_values.Kmbf];
        x_8 = [plot_values.Kmcf];
        x_9 = [plot_values.Kmcr];
       
    else
        fprintf(['\nThere are no green dots at ' num2str(all_freqs(f)) ' Hz \n']);
    end
    
   
    if a > 1
        a = zeros(1,length(plot_values.kcatafx));
        x_0 = [plot_values.kcatafx];
        scatter(a, x_0(1,:),'filled', 'g');
        plot([-0.3 0.3], [0.4442 0.4442], 'k', 'LineWidth', 1); 
        text(a(1) - 0.1 ,x_0(1) + 5*10^2, [num2str(length(plot_values.kcatafx))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if b > 1
        b = ones(1,length(plot_values.kcatafc));
        x_1 = [plot_values.kcatafc];
        scatter(b, x_1(1,:),'filled','g');
        plot([0.7 1.3], [0.4174 0.4174], 'k', 'LineWidth', 1); 
        text(b(1) - 0.1 ,x_1(1) + 5*10^2, [num2str(length(plot_values.kcatafc))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if c > 1
        c = 2*ones(1,length(plot_values.kcatbf));
        x_2 = [plot_values.kcatbf];
        scatter(c, x_2(1,:),'filled','g');
        plot([1.7 2.3], [14.2683 14.2683], 'k', 'LineWidth', 1); 
        text(c(1) - 0.1 ,x_2(1) + 5*10^2, [num2str(length(plot_values.kcatbf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on 
    end
    if d > 1
        d = 3*ones(1,length(plot_values.kcatcf));
        x_3 = [plot_values.kcatcf];
        scatter(d, x_3(1,:),'filled','g');
        plot([2.7 3.3], [17.3990 17.3990], 'k', 'LineWidth', 1); 
         text(d(1) - 0.1 ,x_3(1) + 5*10^2, [num2str(length(plot_values.kcatcf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if e >1
        e =4*ones(1,length(plot_values.kcatcr));
        x_4 = [plot_values.kcatcr];
        scatter(e, x_4(1,:),'filled','g');
        plot([3.7 4.3], [24.8597 24.8597], 'k', 'LineWidth', 1); 
        text(e(1) - 0.1 ,x_4(1) + 5*10^2, [num2str(length(plot_values.kcatcr))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on 
    end
    if g >1
        g = 5*ones(1,length(plot_values.Kmafx));
        x_5 = [plot_values.Kmafx];
        scatter(g, x_5(1,:),'filled','g');
        plot([4.7 5.3], [0.1211 0.1211], 'k', 'LineWidth', 1); 
        text(g(1) - 0.1 ,x_5(1) + 5*10^3, [num2str(length(plot_values.Kmafx))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if h >1
         h = 6*ones(1,length(plot_values.Kmafc));
         x_6 = [plot_values.Kmafc];
         scatter(h, x_6(1,:),'filled','g');
         plot([5.7 6.3], [0.9726 0.9726], 'k', 'LineWidth', 1); 
         text(h(1) - 0.1 ,x_6(1) + 5*10^3, [num2str(length(plot_values.Kmafc))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
         hold on
    end
    if j >1
         j = 7*ones(1,length(plot_values.Kmbf));
         x_7 = [plot_values.Kmbf];
         scatter(j, x_7(1,:),'filled','g');
         plot([6.7 7.3], [1.9610 1.9610], 'k', 'LineWidth', 1); 
         text(j(1) - 0.1 ,x_7(1) + 5*10^3, [num2str(length(plot_values.Kmbf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
         hold on
    end
    if l >1
        l = 8*ones(1,length(plot_values.Kmcf));
        x_8 = [plot_values.Kmcf];
        scatter(l, x_8(1,:),'filled','g');
        plot([7.7 8.3], [0.0151 0.0151], 'k', 'LineWidth', 1); 
        text(l(1) - 0.1 ,x_8(1) + 5*10^3, [num2str(length(plot_values.Kmcf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if m > 1
         m = 9*ones(1,length(plot_values.Kmcr));
         x_9 = [plot_values.Kmcr];
         scatter(m, x_9(1,:),'filled','g');
         plot([8.7 9.3], [ 0.0195 0.0195], 'k', 'LineWidth', 1); 
          text(m(1) - 0.1 ,x_9(1) + 5*10^3, [num2str(length(plot_values.Kmcr))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
         hold off; 
    end
 
    
    ax = gca;
    ax.XTickLabel = {' ', 'kcatafx', 'kcatafc', 'kcatbf', 'kcatcf', 'kcatcr', 'Kmafx', 'Kmafc', 'Kmbf', 'Kmcf', 'Kmcr', ' '};
    xlim([-1 10]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
    xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
    title(['Motif' num2str(motif) ' - ' num2str(all_freqs(f_no)) ' Hz']); 
   
    