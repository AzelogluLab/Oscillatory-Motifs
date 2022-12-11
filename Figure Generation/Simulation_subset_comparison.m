clc
clear all
close all

home_dir = 'D:/Jamil';

motifs2process = [2,11,18,19];
freqs2process = [0.001 0.003 0.01 0.03 0.1 0.3 1];
f_no_to_process = 1:7;
A = 0;
N = [10000, 50000]; %Total number of simulations per motif
output = [];
figure
for freq = freqs2process;
     
    for i = N;
        A = A+1;
        output(A,:) = load([home_dir '/sums_' num2str(i/1000) 'K_' num2str(freq) 'Hz.txt']);
        
   end
end
dlmwrite([home_dir '/Sumsofall.txt'],output);

for i = motifs2process;
    y = [];
    y = [y;output(:,i)];
    hist(y)
    figure
    
end


        
    