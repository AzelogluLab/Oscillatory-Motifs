%   Andrew Leader
%   August 2, 2014

%   Creates N*(k_max-k_min+1) random sets of parameters over a continuous neighborhood parameter space.
%   Based on the options you specify, applies a step up input (.5 to .9), a
%   step down (.5 to .1), a sinewave input (amplitude 0.4 centered at 0.5 -- this option is denoted simple_osc)
%   at the specified frequencies.  Also can equilibrate at 0.1 before
%   applying a sinewave of amplitude 0.4 centered at 0.4 -- this option is denoted step_osc_in.

clear all; close all; clc;

diary on; %keep a record of how the program runs.
% Saves to the file "diary" in the working directory.

%%  SOME PRELIMINARIES
%   In what directory should the output go?  Should saved parameter sets
%   also go here?
output_dir = 'D:/JAMIL/Jamil/Nov2019_100K/output_dir';

%%  WHAT WOULD YOU LIKE TO SIMULATE?

motifs_to_simulate = [19:20];%[1:20];
freqs_to_simulate = [0.001 0.003 0.01 0.03 0.1 0.3 1];
N = 5000; %The number of simulations saved per individual file
k_max = 20; %The number of total files full of simulations you will create
k_min = 1; %Changing this parameter allows you to restart a set of
%simulations where you left off if the program ended prematurely.

%Have you performed any simulations on this motif before?  
%If NEED_PARAMS == TRUE, then a new set of randomized parameters will be
%generated.
need_params = true;

%Do you want to generate step responses?
sim_steps = false;

%   Do you want to generate responses to
%   sinewaves at the specified frequencies in FREQS_TO_SIMULATE?
simple_osc = true;

%   Do you want to generate
%   responses to sinewaves at a changed DC offset at the specified
%   frequencies in FREQS_TO_SIMULATE?
step_osc_in = false;

%%   SET UP PARALLEL COMPUTING
local = parcluster('local');
%   Here, specify the number of workers you want to use.
%   Workers ~= cores, but the program will run more smoothely if Workers <=
%   cores (or 2x # cores if dualcores).  12 is the max that matlab will
%   allow.
local.NumWorkers = 12;
%If you want to learn about batch processing or partitioning your computer
%to run 2 multi-core processes at once, look up BATCH.
%parpool local;
%%  PERFORM SIMULATIONS   

for motif = motifs_to_simulate
    tic
    motif_dir = [output_dir '/motif_' num2str(motif)];
    params_dir = [motif_dir '/params'];
    equil_dir = [motif_dir '/equil'];
    mkdir(equil_dir)
    
    %%   MAKE DIRECTORIES FOR YOUR OUTPUT
    %   NOTE: THIS BLOCK OF CODE MAY CAUSE WARNINGS IF YOU START AND STOP
    %   THE SCRIPT.  DON'T WORRY ABOUT THEM.
    %   To suppress warnings:
    
    if need_params == true
        mkdir(params_dir);
    end
    if sim_steps == true
        step_directions = {'up','down'};
        for mm = 1:2
            resps_dir = [motif_dir '/step_' step_directions{mm}];
            mkdir(resps_dir);
        end
    end
    %make new directories for oscillatory simulations
    for f = freqs_to_simulate
        if simple_osc == true
            resps_dir = [motif_dir '/' num2str(f) 'Hz'];
            mkdir(resps_dir);
        end
        if step_osc_in == true
            resps_dir = [motif_dir '/step_osc_in_' num2str(f) 'Hz'];
            mkdir(resps_dir);
        end
    end
    
    %%  PERFORM AND SAVE THE SIMULATIONS
    for k = k_min:k_max
        
        %   Generate parameters
        if need_params == true
            params = get_params(k, N, motif);
            save([params_dir '/params_' num2str(k) '_' num2str(N) '.mat'],'params');
        end
        
        %Next, determine equilibrium points -- these will be saved and
        %reused for simulations of each parameter set for different inputs.
        %N.B. Step input & simple osc. input have same initial value,
        %whereas step_osc_in has a different one.  Therefore, we have to
        %look at the two cases separately (hence the two loops below).
        t = [-100:0];
        if (simple_osc == true) || (sim_steps == true)  
            if need_params == false
                load([equil_dir '/equil_simple_osc_' num2str(k) '_' num2str(N)]);
            else %Simulate to determine the equilibrium point
                equil_simple_osc = cell(1,N); %preallocate
                parfor ii = 1:N
                    resp = get_equil(t,motif,params(ii),'init'); 
                    equil_simple_osc{ii} = resp(:,end-99:end);
                end
                save([equil_dir '/equil_simple_osc_' num2str(k) '_' num2str(N)],'equil_simple_osc');
            end
        elseif step_osc_in == true
            if need_params == false
                load([equil_dir '/equil_step_osc_' num2str(k) '_' num2str(N)]);
            else %Simulate to determine the equilibrium point
                equil_step_osc = cell(1,N);                
                parfor ii = 1:N
                    resp = get_equil(t,motif,params(ii),'init_steposc');   
                    equil_step_osc{ii} = resp(:,end-99:end);
                end
                save([equil_dir '/equil_step_osc_' num2str(k) '_' num2str(N)],'equil_step_osc');
            end
        end
         
        %   Simulate the step-responses
        if sim_steps==true % to generate parameter set and simulate step responses
            
            t = -100:1:1200; %The time vector over which you will simulate each step-response.  length(t(t<0)) must be 100.
            % generate step responses
            for mm = 1:2
                sd = step_directions{mm};
                resps_dir = [motif_dir '/step_' sd];
                resp = NaN(length(t),N);
                resp_cell = cell(1,N);
                parfor ii = 1:N
                    resp_cell{ii} = get_response(t,motif,params(ii),sd,[],equil_simple_osc{ii});
                end
                parfor ii = 1:N
                    resp(:,ii) = resp_cell{ii}(end,:);
                end
                dlmwrite([resps_dir '/step_' step_directions{mm} '_' num2str(k) '_' num2str(N) '.txt'],resp,'precision',16);
            end
            fprintf('\nMotif %i, Generated %i percent of params and steps at %f hrs\n',motif, round(k*100/k_max),toc/60/60);
            
        else % you've already made the parameters from a previous run
            load([params_dir '/params_' num2str(k) '_' num2str(N) '.mat']);
        end
        
        for f = freqs_to_simulate %For each batch of N parameter sets, run through each frequency
            
            %   Define the time points you want to simulate over.
            %   NOTE: Changing time resolution significantly impacts the
            %   size of the output data.
            
             t = [-100:-1 0:1/(20*f):20/f]; % t = [-100:-1 0:0.1:1000]; 
            
            if simple_osc == true
                
            %   simple oscillatory input -- no change in DC offset
                resps_dir = [motif_dir '/' num2str(f) 'Hz'];
                resp = NaN(length(t),N);
                resp_cell = cell(1,N);
                parfor ii = 1:N
                    resp_cell{ii} = get_response(t,motif,params(ii),'osc',f,equil_simple_osc{ii}(:,t<0));
                end
                parfor ii = 1:N
                    resp(:,ii) = resp_cell{ii}(end,:);
                end
                
           
             
                dlmwrite([resps_dir '/' num2str(f) 'Hz_' num2str(k) '_' num2str(N) '.txt'],resp,'precision',16);
                fprintf('\nMotif %i, simple osc input, generated %i percent of freq %f at %f hrs\n',motif, round(k*100/k_max),f,toc/60/60);
                
            end
            
            %   oscillatory input -- a step up in the DC offset
            if step_osc_in == true

                resps_dir = [motif_dir '/step_osc_in_' num2str(f) 'Hz'];
                resp = NaN(length(t),N);
                resp_cell = cell(1,N); 
                parfor ii = 1:N
                    resp_cell{ii} = get_response(t,motif,params(ii),'steposc',f,equil_step_osc{ii}(:,t<1000));
                end
                parfor ii = 1:N  
                    resp(:,ii) = resp_cell{ii}(end,:);
                end
                dlmwrite([resps_dir '/' num2str(f) 'Hz_' num2str(k) '_' num2str(N) '.txt'],resp,'precision',16);
                fprintf('\nMotif %i, step osc, generated %i percent of freq %f at %f hrs\n',motif, round(k*100/k_max),f,toc/60/60);
                
            end
            
        end
 
    end
    Time_out(:,motif) = toc;
end

%clear all;
%parpool close;
diary off;