clc
clear all
close all

 home_dir = (['D:/JAMIL/Jamil/100K_Sims/output_dir']);
 p2 = load([home_dir '/plot_values2.mat']);
 p11 = load([home_dir '/plot_values11.mat']);
 p12 = load([home_dir '/plot_values12.mat']);
 load([home_dir '/index_fft.mat']);
 
 N = 38;
 
 motif = 2;

 for i = 1:N
     
     motif2(i,1) = p2.plot_values(index.motif(motif).freq.index(i)).kcataf;
     motif2(i,2) = p2.plot_values(index.motif(motif).freq.index(i)).kcatar;
     motif2(i,3) = p2.plot_values(index.motif(motif).freq.index(i)).kcatbf;
     motif2(i,4) = p2.plot_values(index.motif(motif).freq.index(i)).kcatcf;
     motif2(i,5) = p2.plot_values(index.motif(motif).freq.index(i)).Kmaf;
     motif2(i,6) = p2.plot_values(index.motif(motif).freq.index(i)).Kmar;
     motif2(i,7) = p2.plot_values(index.motif(motif).freq.index(i)).Kmbf;
     motif2(i,8) = p2.plot_values(index.motif(motif).freq.index(i)).Kmcf;
          
 end
 
dlmwrite([home_dir '/motif2param.txt'], motif2,'precision',16);  

motif = 11;
N = 4;

 for i = 1:N
     
     motif11(i,1) = p11.plot_values(index.motif(motif).freq.index(i)).kcataf;
     motif11(i,2) = p11.plot_values(index.motif(motif).freq.index(i)).kcatar;
     motif11(i,3) = p11.plot_values(index.motif(motif).freq.index(i)).kcatbf;
     motif11(i,4) = p11.plot_values(index.motif(motif).freq.index(i)).kcatcfa;
     motif11(i,5) = p11.plot_values(index.motif(motif).freq.index(i)).kcatcfb;
     motif11(i,6) = p11.plot_values(index.motif(motif).freq.index(i)).Kmaf;
     motif11(i,7) = p11.plot_values(index.motif(motif).freq.index(i)).Kmar;
     motif11(i,8) = p11.plot_values(index.motif(motif).freq.index(i)).Kmbf;
     motif11(i,9) = p11.plot_values(index.motif(motif).freq.index(i)).Kmcfa;
     motif11(i,10) = p11.plot_values(index.motif(motif).freq.index(i)).Kmcfb;
          
 end
 
 dlmwrite([home_dir '/motif11param.txt'], motif11,'precision',16);  
 
motif = 12;
N = 29;

 for i = 1:N
     
     motif12(i,1) = p12.plot_values(index.motif(motif).freq.index(i)).kcatafx;
     motif12(i,2) = p12.plot_values(index.motif(motif).freq.index(i)).kcatafc;
     motif12(i,3) = p12.plot_values(index.motif(motif).freq.index(i)).kcatbf;
     motif12(i,4) = p12.plot_values(index.motif(motif).freq.index(i)).kcatcf;
     motif12(i,5) = p12.plot_values(index.motif(motif).freq.index(i)).kcatcr;
     motif12(i,6) = p12.plot_values(index.motif(motif).freq.index(i)).Kmafx;
     motif12(i,7) = p12.plot_values(index.motif(motif).freq.index(i)).Kmafc;
     motif12(i,8) = p12.plot_values(index.motif(motif).freq.index(i)).Kmbf;
     motif12(i,9) = p12.plot_values(index.motif(motif).freq.index(i)).Kmcf;
     motif12(i,10) = p12.plot_values(index.motif(motif).freq.index(i)).Kmcr;
          
 end
 
 dlmwrite([home_dir '/motif12param.txt'], motif12,'precision',16);  


