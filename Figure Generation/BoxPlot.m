clc
clear all
close all

%This script will produce a scatter plot of the parameters 

%% Green Dots %% 

%{
clc
clear all


%This script will produce a scatter plot of the parameters - %Green dots
%only 

home_dir = ('D:/JAMIL/Jamil/motif19_100K_param_sweep/output_dir');

load([home_dir '/index.mat']);

motifs2process = [19];
motif = motifs2process; 
f_no = [1:7];
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 5000; %Simulations per file
N = 100000; %Total number of simulations per motif 
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
        
        
        
        for i = 1:length(index.motif(motif).freq(f).index);
            if index.motif(motif).freq(f).index(i) > 0 && index.motif(motif).freq(f).index(i) <= 10000;
                
                plot_values.kcataf(:,a) = combined_params(index.motif(motif).freq(f).index(i)).kcataf(1);
                
                a = a +1;
            
            
            elseif index.motif(motif).freq(f).index(i) > 10000 && index.motif(motif).freq(f).index(i) <= 20000;
                
                plot_values.kcatbf(:,b) = combined_params(index.motif(motif).freq(f).index(i)).kcatbf(1);
                b = b +1;
                
                
                
            
            elseif index.motif(motif).freq(f).index(i) > 20000 && index.motif(motif).freq(f).index(i) <= 30000;
                
                plot_values.kcatcr(:,c) = combined_params(index.motif(motif).freq(f).index(i)).kcatcr(1);
                c = c +1;
                
           
           
            elseif index.motif(motif).freq(f).index(i) > 30000 && index.motif(motif).freq(f).index(i) <= 40000;
                
               
                plot_values.kcatdf(:,d) = combined_params(index.motif(motif).freq(f).index(i)).kcatdf(1);
                d = d + 1;
                
           
            elseif index.motif(motif).freq(f).index(i) > 40000 && index.motif(motif).freq(f).index(i) <= 50000;
                
                
                plot_values.kcatdr(:,e) = combined_params(index.motif(motif).freq(f).index(i)).kcatdr(1);
                e = e + 1;
                
            
            elseif index.motif(motif).freq(f).index(i) > 50000 && index.motif(motif).freq(f).index(i) <=60000;
                 
                 plot_values.Kmaf(:,g) = combined_params(index.motif(motif).freq(f).index(i)).Kmaf(1);
                 
                 g = g +1;
            elseif index.motif(motif).freq(f).index(i) > 60000 && index.motif(motif).freq(f).index(i) <= 70000;
                
                 plot_values.Kmbf(:,h) = combined_params(index.motif(motif).freq(f).index(i)).Kmbf(1);
                 h = h + 1;
            elseif index.motif(motif).freq(f).index(i) > 70000 && index.motif(motif).freq(f).index(i) <= 80000;
                 
                 plot_values.Kmcr(:,j) = combined_params(index.motif(motif).freq(f).index(i)).Kmcr(1);
                 j = j +1;
            elseif index.motif(motif).freq(f).index(i) >80000  && index.motif(motif).freq(f).index(i) <= 90000;
                
                 
                 plot_values.Kmdf(:,l) = combined_params(index.motif(motif).freq(f).index(i)).Kmdf(1);
                 l = l+1;   
            elseif index.motif(motif).freq(f).index(i) >90000  && index.motif(motif).freq(f).index(i) <= 100000;
                                
                 
                 plot_values.Kmdr(:,m) = combined_params(index.motif(motif).freq(f).index(i)).Kmdr(1);
                 m = m +1;
                 
            end
            
            
            
            
            
        end
    end
    
   
    if a > 1
        a = zeros(1,length(plot_values.kcataf));
        x_0 = [plot_values.kcataf];
        %scatter(a, x_0(1,:),'filled', 'g');
        %plot([-0.3 0.3], [0.4442 0.4442], 'k', 'LineWidth', 1); 
        %text(a(1) - 0.1 ,x_0(1) + 5*10^2, [num2str(length(plot_values.kcataf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if b > 1
        b = ones(1,length(plot_values.kcatbf));
        x_1 = [plot_values.kcatbf];
        %scatter(b, x_1(1,:),'filled','g');
        %plot([0.7 1.3], [0.4174 0.4174], 'k', 'LineWidth', 1); 
        %text(b(1) - 0.1 ,x_1(1) + 5*10^2, [num2str(length(plot_values.kcatbf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if c > 1
        c = 2*ones(1,length(plot_values.kcatcr));
        x_2 = [plot_values.kcatcr];
        %scatter(c, x_2(1,:),'filled','g');
        %plot([1.7 2.3], [14.2683 14.2683], 'k', 'LineWidth', 1); 
        %text(c(1) - 0.1 ,x_2(1) + 5*10^2, [num2str(length(plot_values.kcatcr))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on 
    end
    if d > 1
        d = 3*ones(1,length(plot_values.kcatdf));
        x_3 = [plot_values.kcatdf];
        %scatter(d, x_3(1,:),'filled','g');
        %plot([2.7 3.3], [17.3990 17.3990], 'k', 'LineWidth', 1); 
         %text(d(1) - 0.1 ,x_3(1) + 5*10^2, [num2str(length(plot_values.kcatdf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if e >1
        e =4*ones(1,length(plot_values.kcatdr));
        x_4 = [plot_values.kcatdr];
        %scatter(e, x_4(1,:),'filled','g');
        %plot([3.7 4.3], [24.8597 24.8597], 'k', 'LineWidth', 1); 
        %text(e(1) - 0.1 ,x_4(1) + 5*10^2, [num2str(length(plot_values.kcatdr))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on 
    end
    if g >1
        g = 5*ones(1,length(plot_values.Kmaf));
        x_5 = [plot_values.Kmaf];
        %scatter(g, x_5(1,:),'filled','g');
        %plot([4.7 5.3], [0.1211 0.1211], 'k', 'LineWidth', 1); 
        %text(g(1) - 0.1 ,x_5(1) + 5*10^3, [num2str(length(plot_values.Kmaf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if h >1
         h = 6*ones(1,length(plot_values.Kmbf));
         x_6 = [plot_values.Kmbf];
         %scatter(h, x_6(1,:),'filled','g');
         %plot([5.7 6.3], [0.9726 0.9726], 'k', 'LineWidth', 1); 
         %text(h(1) - 0.1 ,x_6(1) + 5*10^3, [num2str(length(plot_values.Kmbf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
         hold on
    end
    if j >1
         j = 7*ones(1,length(plot_values.Kmcr));
         x_7 = [plot_values.Kmcr];
         %scatter(j, x_7(1,:),'filled','g');
         %plot([6.7 7.3], [1.9610 1.9610], 'k', 'LineWidth', 1); 
         %text(j(1) - 0.1 ,x_7(1) + 5*10^3, [num2str(length(plot_values.Kmcr))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
         hold on
    end
    if l >1
        l = 8*ones(1,length(plot_values.Kmdf));
        x_8 = [plot_values.Kmdf];
        %scatter(l, x_8(1,:),'filled','g');
        %plot([7.7 8.3], [0.0151 0.0151], 'k', 'LineWidth', 1); 
        %text(l(1) - 0.1 ,x_8(1) + 5*10^3, [num2str(length(plot_values.Kmdf))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
        hold on
    end
    if m > 1
         m = 9*ones(1,length(plot_values.Kmdr));
         x_9 = [plot_values.Kmdr];
         
         %plot([8.7 9.3], [ 0.0195 0.0195], 'k', 'LineWidth', 1); 
         %text(m(1) - 0.1 ,x_9(1) + 5*10^3, [num2str(length(plot_values.Kmdr))], 'VerticalAlignment', 'top', 'FontSize' ,8); 
         hold on;
    end
    figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz']);
            b1(1) = min(x_0);
            b1(2) = max(x_0);
            b2(1) = min(x_1);
            b2(2) = max(x_1);
            b3(1) = 0;%min(x_2);
            b3(2) = 0;%max(x_2);
            b4(1) = 0;%min(x_3);
            b4(2) = 0;%max(x_3);
            b5(1) = 0;%min(x_4);
            b5(2) = 0;%max(x_4);
            b6(1) = 0;%min(x_5);
            b6(2) = 0;%max(x_5);
            b7(1) = 0;%min(x_6);
            b7(2) = 0;%max(x_6);
            b8(1) = min(x_7);
            b8(2) = max(x_7);
            b9(1) = 0;%min(x_8);
            b9(2) = 0;%max(x_8);
            b10(1) = min(x_9);
            b10(2) = max(x_9);
            B = ([b1, b2,b3, b4, b5, b6, b7, b8, b9, b10]); 
            labels = char('kcataf', 'kcataf','kcatbf', 'kcatbf', 'kcatcr', 'kcatcr', 'kcatdf','kcatdf',...
                'kcatdr', 'kcatdr', 'Kmaf', 'Kmaf', 'Kmbf', 'Kmbf', 'Kmcr', 'Kmcr', 'Kmdf', 'Kmdf', 'Kmdr','Kmdr');
            boxplot(B,labels)
            h = findobj(gca,'Tag','Box');
            for j=1:length(h)
                patch(get(h(j),'XData'),get(h(j),'YData'),'b','FaceAlpha',.5);
            end
            h = findobj(gca,'tag','Median');
            set(h,'Color',[1 1 1])
    ax = gca;
    ax.XTickLabel = {'kcataf', 'kcatbf', 'kcatcr', 'kcatdf', 'kcatdr', 'Kmaf', 'Kmbf', 'Kmcr', 'Kmdf', 'Kmdr'};
    xlim([-1 11]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
    xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
    title(['Motif' num2str(motif) ' - ' num2str(all_freqs(f_no)) ' Hz']); 
    
    
   
%}
%% BLUE DOTS%%% 
%{
clc
clear all
home_dir = (['D:/JAMIL/Jamil/100K_Sims/output_dir']);

load([home_dir '/index.mat']);
f_no = [1:7]; 
motifs2process = [19];

all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 5000; %Number of simulations per file 
N = 10000;
kmax = 20;


c = ([]);
plot_values = ([]);
for k = 1:kmax;
   params = load([home_dir '/motif_19/params/params_' num2str(k) '_' num2str(N_) '.mat']);
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
            
            
            a = zeros(1,n); 
            b = ones(1,n); c = 2*ones(1,n); d = 3*ones(1,n); e =4*ones(1,n); g = 5*ones(1,n); 
            h = 6*ones(1,n);
            j = 7*ones(1,n) ; l = 8*ones(1,n); m = 9*ones(1,n); 
            x_0 = [plot_values.kcataf];
            b1(1) = min(x_0);
            b1(2) = max(x_0);
            
            x_1 = [plot_values.kcatbf];
            b2(1) = min(x_0);
            b2(2) = max(x_0);
            x_2 = [plot_values.kcatcr];
            b3(1) = min(x_2);
            b3(2) = max(x_2);
           
            x_3 = [plot_values.kcatdf];
            x_4 = [plot_values.kcatdr];
            x_5 = [plot_values.Kmaf];
            x_6 = [plot_values.Kmbf];
            x_7 = [plot_values.Kmcr];
            x_8 = [plot_values.Kmdf];
            x_9 = [plot_values.Kmdr];
            b4(1) = min(x_3);
            b4(2) = max(x_3);
            b5(1) = min(x_4);
            b5(2) = max(x_4);
            b6(1) = min(x_5);
            b6(2) = max(x_5);
            b7(1) = min(x_6);
            b7(2) = max(x_6);
            b8(1) = min(x_7);
            b8(2) = max(x_7);
            b9(1) = min(x_8);
            b9(2) = max(x_8);
            b10(1) = min(x_9);
            b10(2) = max(x_9);
            
            C = ([b1, b2,b3, b4, b5, b6, b7, b8, b9, b10]); 
            hold on;
            labels = char('kcataf', 'kcataf','kcatbf', 'kcatbf', 'kcatcr', 'kcatcr', 'kcatdf','kcatdf',...
                'kcatdr', 'kcatdr', 'Kmaf', 'Kmaf', 'Kmbf', 'Kmbf', 'Kmcr', 'Kmcr', 'Kmdf', 'Kmdf', 'Kmdr','Kmdr');
            boxplot(C,labels)
            
            w = findobj(gca,'Tag','Box');
            for j=1:length(w)
                patch(get(w(j),'XData'),get(w(j),'YData'),'k','FaceAlpha',.5);
            end
            
            j = findobj(gca,'tag','Median');
            set(j,'Color',[1 1 1])
            hold on;
            %boxplot(2,x_1);
            %hold on
            %{
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
            
%}

            
        end

end
            
        
ax = gca;
    ax.XTickLabel = {'kcataf', 'kcatbf', 'kcatcr', 'kcatdf', 'kcatdr', 'Kmaf', 'Kmbf', 'Kmcr', 'Kmdf', 'Kmdr'};
    xlim([-1 11]); set(gca,'yscale', 'log'); ylim([10^-3 10^4])
    xlabel ('Parameter'); ylabel ('Paramter Value - Log Scale'); 
    title(['Motif' num2str(motif) ' - ' num2str(all_freqs(f_no)) ' Hz']); 
    %}
%% Red Dots %%

clear all
home_dir = (['D:/JAMIL/Jamil/100K_Sims/output_dir']);
load([home_dir '/index_red.mat']);

motifs2process = [19];
f_no = [2]; %pick frequency one at a time
all_freqs = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N_ = 5000;
N = 100000;
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
            if length(index_red.motif(motif).freq(f).index) > 0;
                for i = 1:length(index_red.motif(motif).freq(f).index);
                    plot_values.kcataf(:,a) = combined_params(index_red.motif(motif).freq(f).index(i)).kcataf(1);
                    a = a +1;
                    plot_values.kcatbf(:,b) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatbf(1);
                    b = b +1;
                    plot_values.kcatcr(:,c) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatcr(1);
                    c = c +1;
                    plot_values.kcatdf(:,d) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatdf(1);
                    d = d + 1;
                    plot_values.kcatdr(:,e) = combined_params(index_red.motif(motif).freq(f).index(i)).kcatdr(1);
                    e = e + 1;
                    plot_values.Kmaf(:,g) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmaf(1);
                    g = g +1;
                    plot_values.Kmbf(:,h) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmbf(1);
                    h = h + 1; 
                    plot_values.Kmdf(:,l) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmdf(1);
                    l = l+1;
                    plot_values.Kmcr(:,j) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmcr(1);
                    j = j +1; 
                    plot_values.Kmdr(:,m) = combined_params(index_red.motif(motif).freq(f).index(i)).Kmdr(1);
                    m = m +1;     
                

                        
                                    
                            
            end
        end
    end

    
end

   
   
   
    if length(index_red.motif(motif).freq(f).index) > 0;
    
        a = zeros(1,length(plot_values.kcataf)); b = 1*ones(1,length(plot_values.kcatbf));
        c = 2*ones(1,length(plot_values.kcatcr)); d = 3*ones(1,length(plot_values.kcatdf)); 
        e = 4*ones(1,length(plot_values.kcatdr)); g = 5*ones(1,length(plot_values.Kmaf)); h = 6*ones(1,length(plot_values.Kmbf));
        j = 7*ones(1,length(plot_values.Kmcr)) ; l = 8*ones(1,length(plot_values.Kmdf)); m = 9*ones(1,length(plot_values.Kmdr)); 
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
        
    else
        fprintf(['\nThere are no red dots at ' num2str(all_freqs(f)) ' Hz \n']);
    end
    

            b1(1) = min(x_0);
            b1(2) = max(x_0);
            b2(1) = min(x_1);
            b2(2) = max(x_1);
            b3(1) = min(x_2);
            b3(2) = max(x_2);
            b4(1) = min(x_3);
            b4(2) = max(x_3);
            b5(1) = min(x_4);
            b5(2) = max(x_4);
            b6(1) = min(x_5);
            b6(2) = max(x_5);
            b7(1) = min(x_6);
            b7(2) = max(x_6);
            b8(1) = min(x_7);
            b8(2) = max(x_7);
            b9(1) = min(x_8);
            b9(2) = max(x_8);
            b10(1) = min(x_9);
            b10(2) = max(x_9);
            B = ([b1, b2,b3, b4, b5, b6, b7, b8, b9, b10]); 
            labels = char('kcataf', 'kcataf','kcatbf', 'kcatbf', 'kcatcr', 'kcatcr', 'kcatdf','kcatdf',...
                'kcatdr', 'kcatdr', 'Kmaf', 'Kmaf', 'Kmbf', 'Kmbf', 'Kmcr', 'Kmcr', 'Kmdf', 'Kmdf', 'Kmdr','Kmdr');
            boxplot(B,labels)
            h = findobj(gca,'Tag','Box');
            for j=1:length(h)
                patch(get(h(j),'XData'),get(h(j),'YData'),'r','FaceAlpha',.5);
            end
            h = findobj(gca,'tag','Median');
            set(h,'Color',[1 1 1])
%}