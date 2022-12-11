 function [ params ] = get_params(k, N, motif)
%GET_PARAMS Summary of this function goes here
%   Detailed explanation goes here

%   Define ranges of parameters.
kcat_range = [-1 2]; %These are powers of 10
Km_range = [-2 3]; %These are powers of 10

%   Functions for generating the random params
kcat_gen = @(kcat_range) 10.^(kcat_range(1)+(-kcat_range(1)+kcat_range(2))*rand());
Km_gen = @(Km_range) 10^(Km_range(1)+(-Km_range(1)+Km_range(2))*rand());

%   Constant params
basal_conc = .5; %conc of non-random enzymes
const_kcat = 10^mean(kcat_range);
const_Km = 10^mean(Km_range);

params = struct;

if motif==1
    %3-node positive feedback loop
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatafc = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmafc = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
    end
    
elseif motif==2
    %3-node negative feedback loop
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatar  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmar  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
    %{
    
    home_dir = (['D:/Jamil/100K_Sims/output_dir']);
    motif2 = load([home_dir '/motif2param.txt']);
   
    
    for ii = 1:N;
        kcataf = plot_values(index.motif(motif).freq.index(ii)).kcataf;
        kcatar = plot_values(index.motif(motif).freq.index(ii)).kcatar;
        kcatbf = plot_values(index.motif(motif).freq.index(ii)).kcatbf;
        kcatcf = plot_values(index.motif(motif).freq.index(ii)).kcatcf;
        Kmaf = plot_values(index.motif(motif).freq.index(ii)).Kmaf;
        Kmar  = plot_values(index.motif(motif).freq.index(ii)).Kmar; 
        Kmbf  = plot_values(index.motif(motif).freq.index(ii)).Kmbf;
        Kmcf  = plot_values(index.motif(motif).freq.index(ii)).Kmcf;
       
    
   parfor ii = 1:N 
        
            
        %variable kcat
        params(ii).kcataf  = motif2(ii,1); %plot_values(index.motif(motif).freq.index(ii)).kcataf;% (kcat_gen(kcat_range);
        params(ii).kcatar  = motif2(ii,2); %plot_values(index.motif(motif).freq.index(ii)).kcatar; %kcat_gen(kcat_range);
        params(ii).kcatbf  = motif2(ii,3); %plot_values(index.motif(motif).freq.index(ii)).kcatbf; %kcat_gen(kcat_range);
        params(ii).kcatcf  = motif2(ii,4); %plot_values(index.motif(motif).freq.index(ii)).kcatcf; %kcat_gen(kcat_range);
      
        %const kcat
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = motif2(ii,5); %plot_values(index.motif(motif).freq.index(ii)).Kmaf; %Km_gen(Km_range);
        params(ii).Kmar  = motif2(ii,6); %plot_values(index.motif(motif).freq.index(ii)).Kmar; %Km_gen(Km_range);
        params(ii).Kmbf  = motif2(ii,7); %plot_values(index.motif(motif).freq.index(ii)).Kmbf;%Km_gen(Km_range);
        params(ii).Kmcf  = motif2(ii,8); %plot_values(index.motif(motif).freq.index(ii)).Kmbf; %Km_gen(Km_range);
        
        %const Km
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
      %}
    end
    

    
    
    elseif motif==3
    %incoherent feed parforward loop
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcra  = kcat_gen(kcat_range);
        params(ii).kcatcrb  = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcf = const_kcat;
        
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcra  = Km_gen(Km_range);
        params(ii).Kmcrb  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcf = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Ec = basal_conc;
        
    end
    
elseif motif==4
    %Coherent feed-parforward
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb  = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
    end
    
elseif motif==5
    %incoherent feed parforward loop
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        
    end
    
elseif motif==6
    %A<=>B<=>C
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcatafx  = kcat_gen(kcat_range);
        params(ii).kcatafb  = kcat_gen(kcat_range);
        params(ii).kcatbfa  = kcat_gen(kcat_range);
        params(ii).kcatbfc  = kcat_gen(kcat_range);
        params(ii).kcatcf   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmafx  = Km_gen(Km_range);
        params(ii).Kmafb  = Km_gen(Km_range);
        params(ii).Kmbfa  = Km_gen(Km_range);
        params(ii).Kmbfc  = Km_gen(Km_range);
        params(ii).Kmcf   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        
    end
    
elseif motif==7
    %A|=>B<=|C
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatar  = kcat_gen(kcat_range);
        params(ii).kcatbfa  = kcat_gen(kcat_range);
        params(ii).kcatbfc  = kcat_gen(kcat_range);
        params(ii).kcatcr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcf = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmar  = Km_gen(Km_range);
        params(ii).Kmbfa  = Km_gen(Km_range);
        params(ii).Kmbfc  = Km_gen(Km_range);
        params(ii).Kmcr   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmbr = const_Km;
        params(ii).Kmcf = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fb = basal_conc;
        params(ii).Ec = basal_conc;
        
    end
    
elseif motif==8
    %A<=>B|=>C
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcatafx  = kcat_gen(kcat_range);
        params(ii).kcatafb  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatbr  = kcat_gen(kcat_range);
        params(ii).kcatcf   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmafx  = Km_gen(Km_range);
        params(ii).Kmafb  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmbr  = Km_gen(Km_range);
        params(ii).Kmcf   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fc = basal_conc;
        
    end
    
elseif motif==9
    %positive feedback loop with A<=>C
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcatafx  = kcat_gen(kcat_range);
        params(ii).kcatafc  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmafx  = Km_gen(Km_range);
        params(ii).Kmafc  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        
        
    end
    
elseif motif==10
    %a=>b=|c<=|a
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatar  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatcr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatbr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmar  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmcr   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmbr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fb = basal_conc;
        
    end
    
elseif motif==11
    %a=>b=>c<=|a
       parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatar  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmar  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
    %{
    home_dir = (['D:/Jamil/100K_Sims/output_dir']);
    motif11= load([home_dir '/motif11param.txt']);
    
    for ii = 1:N;
        kcataf = plot_values(index.motif(motif).freq.index(ii)).kcataf;
        kcatar = plot_values(index.motif(motif).freq.index(ii)).kcatar;
        kcatbf = plot_values(index.motif(motif).freq.index(ii)).kcatbf;
        kcatcfa = plot_values(index.motif(motif).freq.index(ii)).kcatcf;
        kcatcfb = plot_values(index.motif(motif).freq.index(ii)).kcatcfb;
        Kmaf = plot_values(index.motif(motif).freq.index(ii)).Kmaf;
        Kmar  = plot_values(index.motif(motif).freq.index(ii)).Kmar; 
        Kmbf  = plot_values(index.motif(motif).freq.index(ii)).Kmbf;
        Kmcfa  = plot_values(index.motif(motif).freq.index(ii)).Kmbf;
        Kmcfa  = plot_values(index.motif(motif).freq.index(ii)).Kmbf;
    end
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = motif11(ii,1);%kcat_gen(kcat_range);
        params(ii).kcatar  = motif11(ii,2);%kcat_gen(kcat_range);
        params(ii).kcatbf  = motif11(ii,3);%kcat_gen(kcat_range);
        params(ii).kcatcfa  = motif11(ii,4);%kcat_gen(kcat_range);
        params(ii).kcatcfb   = motif11(ii,5);%kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = motif11(ii,6); %Km_gen(Km_range);
        params(ii).Kmar  = motif11(ii,7); %Km_gen(Km_range);
        params(ii).Kmbf  = motif11(ii,8); %Km_gen(Km_range);
        params(ii).Kmcfa  = motif11(ii,9); %Km_gen(Km_range);
        params(ii).Kmcfb   = motif11(ii,10); %Km_gen(Km_range);
        
        %const Km
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        %}
       end
       
    
elseif motif==12
    %a=>b=|c<=>a
        
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcatafx  = kcat_gen(kcat_range);
        params(ii).kcatafc  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatcr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        
        %variable Km
        params(ii).Kmafx  = Km_gen(Km_range);
        params(ii).Kmafc  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmcr   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
    %{
    home_dir = (['D:/Jamil/100K_Sims/output_dir']);
    motif12= load([home_dir '/motif12param.txt']);
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcatafx  = 13.1611; %motif12(ii,1);% 5.8400; %0.1449; %kcat_gen(kcat_range);
        params(ii).kcatafc  = 0.4377; %motif12(ii,2);%4.7140; %5.9143; %kcat_gen(kcat_range);
        params(ii).kcatbf  = 0.5248; %motif12(ii,3);%0.3010; %0.3003; %kcat_gen(kcat_range);
        params(ii).kcatcf  =  41.3288; %motif12(ii,4);%32.4196; %3.0991; %kcat_gen(kcat_range);
        params(ii).kcatcr   = 51.3482; %motif12(ii,5);%86.5704; %9.1742; %kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        
        %variable Km
        params(ii).Kmafx  = 195.1249; %motif12(ii,6);%285.7806; %313.0915; %Km_gen(Km_range);
        params(ii).Kmafc  = 0.0103; %motif12(ii,7);%0.0533; %0.0192; %Km_gen(Km_range);
        params(ii).Kmbf  = 0.0417; %motif12(ii,8);%0.0356; %0.2245; %Km_gen(Km_range);
        params(ii).Kmcf  = 0.0908; %motif12(ii,9);%0.2211; %0.1875; %Km_gen(Km_range);
        params(ii).Kmcr   = 0.2190; %motif12(ii,10);%0.0436; %0.0231; %Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        %}
    end
    
    
elseif motif==13
    %a=>b|=>c<=a
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatbr  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmbr  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb   = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fc = basal_conc;
        
    end
    
    
elseif motif==14
    %a=>b|=>c<=a
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcatafx  = kcat_gen(kcat_range);
        params(ii).kcatafc  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatbr  = kcat_gen(kcat_range);
        params(ii).kcatcf   = kcat_gen(kcat_range);
        params(ii).kcatcr   = kcat_gen(kcat_range);
        
        
        %const kcat
        params(ii).kcatar = const_kcat;
        
        %variable Km
        params(ii).Kmafx  = Km_gen(Km_range);
        params(ii).Kmafc  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmbr  = Km_gen(Km_range);
        params(ii).Kmcf   = Km_gen(Km_range);
        params(ii).Kmcr   = Km_gen(Km_range);
        
        
        %const Km
        params(ii).Kmar = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        
    end
    
elseif motif==15
    %4-node coherent feed parforward loop
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatdfb  = kcat_gen(kcat_range);
        params(ii).kcatdfc   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        params(ii).kcatdr = const_kcat;
        
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmdfb  = Km_gen(Km_range);
        params(ii).Kmdfc  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        params(ii).Kmdr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        params(ii).Fd = basal_conc;
        
        
    end
    
elseif motif==16
    %a=>b=>d  a=>c=|d
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatdf  = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        
    end
    
    elseif motif==17
    %a=>b=>d  a=|c=>d
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdfb  = kcat_gen(kcat_range);
        params(ii).kcatdfc   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcf = const_kcat;
        params(ii).kcatdr = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        params(ii).Kmdfb  = Km_gen(Km_range);
        params(ii).Kmdfc  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcf = const_Km;
        params(ii).Kmdr = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Ec = basal_conc;
        params(ii).Fd = basal_conc;
        
    end
    
elseif motif==18
    %a=>b=|d  a=|c=>d
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdf  = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcf = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcf = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Ec = basal_conc;
        
    end
    
elseif motif==19
    %a=>b=>d  a=|c=|d
      parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdf  = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcf = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcf = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Ec = basal_conc;
    %{
    parfor ii = 1:N
        
        
        %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
        
        
        if k ==1 || k == 2;
            %variable kcat
            params(ii).kcataf  = kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;

        elseif k == 3 || k == 4;
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 5 || k == 6;
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        
        elseif k == 7 || k == 8;
            
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 9 || k == 10;
            
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 11 || k == 12;
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 13 || k == 14;
            
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 15 || k == 16;
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 17 || k == 18;
            
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = Km_gen(Km_range);
            params(ii).Kmdr  = 0.019518; %Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        elseif k == 19 || k ==20;
            
            %variable kcat
            params(ii).kcataf  = 0.444247; %kcat_gen(kcat_range);
            params(ii).kcatbf  = 0.41739; %kcat_gen(kcat_range);
            params(ii).kcatcr  = 14.26833; %kcat_gen(kcat_range);
            params(ii).kcatdf  = 17.39895; %kcat_gen(kcat_range);
            params(ii).kcatdr   = 24.85965; %kcat_gen(kcat_range);


            %variable Km
            params(ii).Kmaf  = 0.121055; %Km_gen(Km_range);
            params(ii).Kmbf  = 0.972554; %Km_gen(Km_range);
            params(ii).Kmcr  = 1.961046; %Km_gen(Km_range);
            params(ii).Kmdf  = 0.015063; %Km_gen(Km_range);
            params(ii).Kmdr  = Km_gen(Km_range);
            
            %const Km
            params(ii).Kmar = 3.162278; %const_Km;
            params(ii).Kmbr = 3.162278; %const_Km;
            params(ii).Kmcf = 3.162278; %const_Km;


            %const kcat
            params(ii).kcatar = 3.162278; %const_kcat;
            params(ii).kcatbr = 3.162278; %const_kcat;
            params(ii).kcatcf = 3.162278; %const_kcat;

            %Constant enyme conc.
            params(ii).Fa = basal_conc;
            params(ii).Fb = basal_conc;
            params(ii).Ec = basal_conc;
            
        
        end
    %}
      end
     

    
elseif motif==20
    %a=>b=|d  a=>c=|d
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatdrb  = kcat_gen(kcat_range);
        params(ii).kcatdrc   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        params(ii).kcatdf = const_kcat;
        
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmdrb  = Km_gen(Km_range);
        params(ii).Kmdrc  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        params(ii).Kmdf = const_Km;
        
        
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        params(ii).Ed = basal_conc;
        
        
    end
    
elseif motif==21
    %bifan perceptron all positive
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb  = kcat_gen(kcat_range);
        params(ii).kcatdfa   = kcat_gen(kcat_range);
        params(ii).kcatdfb   = kcat_gen(kcat_range);
        params(ii).kcatefc   = kcat_gen(kcat_range);
        params(ii).kcatefd   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        params(ii).kcatdr = const_kcat;
        params(ii).kcater = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb  = Km_gen(Km_range);
        params(ii).Kmdfa  = Km_gen(Km_range);
        params(ii).Kmdfb  = Km_gen(Km_range);
        params(ii).Kmefc  = Km_gen(Km_range);
        params(ii).Kmefd  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        params(ii).Kmdr = const_Km;
        params(ii).Kmer = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        params(ii).Fd = basal_conc;
        params(ii).Fe = basal_conc;
        
    end
    
elseif motif==22
    %bifan perceptron incoherent feedparforward with coherent feedparforward
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb  = kcat_gen(kcat_range);
        params(ii).kcatdf   = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        params(ii).kcatefc   = kcat_gen(kcat_range);
        params(ii).kcatefd   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcr = const_kcat;
        params(ii).kcater = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb  = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        params(ii).Kmefc  = Km_gen(Km_range);
        params(ii).Kmefd  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcr = const_Km;
        params(ii).Kmer = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fc = basal_conc;
        params(ii).Fe = basal_conc;
        
    end
    
elseif motif==23
    %bifan perceptron, 2 incoherent feedparforward loops
    
    parfor ii = 1:N
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdf   = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        params(ii).kcatefc   = kcat_gen(kcat_range);
        params(ii).kcatefd   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcater = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        params(ii).Kmefc  = Km_gen(Km_range);
        params(ii).Kmefd  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmer = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Fe = basal_conc;
        
    end
    
elseif motif == 24
        
    parfor ii = 1:N
        %variable kcat
        
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatbr  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdfa   = kcat_gen(kcat_range);
        params(ii).kcatdfb   = kcat_gen(kcat_range);
        params(ii).kcatefc   = kcat_gen(kcat_range);
        params(ii).kcatefd   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatdr = const_kcat;
 
        params(ii).kcater = const_kcat;
        
        %variable Km
        
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmbr  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        params(ii).Kmdfa  = Km_gen(Km_range);
        params(ii).Kmdfb  = Km_gen(Km_range);
        params(ii).Kmefc  = Km_gen(Km_range);
        params(ii).Kmefd  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmdr = const_Km;
        
        params(ii).Kmer = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fd = basal_conc;
        
        params(ii).Fe = basal_conc;
        
    end
elseif motif == 25
    
    parfor ii = 1:N
        
        %variable kcat
        
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatbr  = kcat_gen(kcat_range);
        params(ii).kcatcfa  = kcat_gen(kcat_range);
        params(ii).kcatcfb  = kcat_gen(kcat_range);
        params(ii).kcatdf   = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        params(ii).kcatefc   = kcat_gen(kcat_range);
        params(ii).kcatefd   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatcr = const_kcat;
 
        params(ii).kcater = const_kcat;
        
        %variable Km
        
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmbr  = Km_gen(Km_range);
        params(ii).Kmcfa  = Km_gen(Km_range);
        params(ii).Kmcfb = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        params(ii).Kmefc  = Km_gen(Km_range);
        params(ii).Kmefd  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmcr = const_Km;
        
        params(ii).Kmer = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fc = basal_conc;
        
        params(ii).Fe = basal_conc;
    end
    
elseif motif == 26
    
    parfor ii = 1:N
         %variable kcat
        
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatbr  = kcat_gen(kcat_range);
        params(ii).kcatcf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdf   = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        params(ii).kcatefc   = kcat_gen(kcat_range);
        params(ii).kcatefd   = kcat_gen(kcat_range);
        
        %const kcat
        
        params(ii).kcater = const_kcat;
        
        %variable Km
        
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmbr  = Km_gen(Km_range);
        params(ii).Kmcf  = Km_gen(Km_range);
        params(ii).Kmcr = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        params(ii).Kmefc  = Km_gen(Km_range);
        params(ii).Kmefd  = Km_gen(Km_range);
        
        %const Km
        
        
        params(ii).Kmer = const_Km;
        
        %   Constant enyme conc.
        
        
        params(ii).Fe = basal_conc;
    end
        
    
    elseif motif==1819 %Compound network motif, motif 18 feeding into motif 19
    
    parfor ii = 1:N
        
        % for motif 18
        
        %variable kcat
        params(ii).kcataf  = kcat_gen(kcat_range);
        params(ii).kcatbf  = kcat_gen(kcat_range);
        params(ii).kcatcr  = kcat_gen(kcat_range);
        params(ii).kcatdf  = kcat_gen(kcat_range);
        params(ii).kcatdr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcatar = const_kcat;
        params(ii).kcatbr = const_kcat;
        params(ii).kcatcf = const_kcat;
        
        %variable Km
        params(ii).Kmaf  = Km_gen(Km_range);
        params(ii).Kmbf  = Km_gen(Km_range);
        params(ii).Kmcr  = Km_gen(Km_range);
        params(ii).Kmdf  = Km_gen(Km_range);
        params(ii).Kmdr  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmar = const_Km;
        params(ii).Kmbr = const_Km;
        params(ii).Kmcf = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fa = basal_conc;
        params(ii).Fb = basal_conc;
        params(ii).Ec = basal_conc;
        
        %for motif 19
        
        %variable kcat
        params(ii).kcatef  = kcat_gen(kcat_range);
        params(ii).kcatff  = kcat_gen(kcat_range);
        params(ii).kcatgr  = kcat_gen(kcat_range);
        params(ii).kcathf  = kcat_gen(kcat_range);
        params(ii).kcathr   = kcat_gen(kcat_range);
        
        %const kcat
        params(ii).kcater = const_kcat;
        params(ii).kcatfr = const_kcat;
        params(ii).kcatgf = const_kcat;
        
        %variable Km
        params(ii).Kmef  = Km_gen(Km_range);
        params(ii).Kmff  = Km_gen(Km_range);
        params(ii).Kmgr  = Km_gen(Km_range);
        params(ii).Kmhf  = Km_gen(Km_range);
        params(ii).Kmhr  = Km_gen(Km_range);
        
        %const Km
        params(ii).Kmer = const_Km;
        params(ii).Kmfr = const_Km;
        params(ii).Kmgf = const_Km;
        
        %   Constant enyme conc.
        params(ii).Fe = basal_conc;
        params(ii).Ff = basal_conc;
        params(ii).Eg = basal_conc;
        
    
    end
    
end

end
