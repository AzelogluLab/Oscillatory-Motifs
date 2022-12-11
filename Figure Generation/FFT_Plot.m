clc
clear all
close all


motifs2process = [12];%Which motif?
ind_r = [77046];%,77046,84601,91203,91366,95849,98847]; %Which index would you like to plot?


all_freqs =  [0.001 0.003 0.01 0.03 0.1 0.3 1];
freqs =  {'001' ,'003','01', '03', '1/10', '3/10', '1'};
f_no = [1]; %Select more than one frequency
compare = true; %select to compare motif at all freqs at specific index value

home_dir = 'D:/JAMIL/Jamil/Time_Test_HighRes/output_dir';
if compare == true;
   i = 0;
    for f = f_no
        %t = [-100:-1 0:1/(20*all_freqs(f)):20/all_freqs(f)];%%%%%%%Time Vector
        t = [-100:-10 -9:0.1:2000]; 
        input = .4*sin(2*pi*all_freqs(f)*t)+.5; %Input Oscillatory Wave
        for motif = motifs2process
          
            output = importdata([home_dir '/output_motif_osc_' num2str(motif) '/' num2str(all_freqs(f)) 'Hz.txt'])';
            for ind = ind_r
                i = i +1;
                h = figure('Numbertitle', 'off' ,'Name', ['Motif - ' num2str(motif) ' - ' num2str(all_freqs(f)) ' Hz' ' # ' num2str(ind) ]);
                subplot(3,1,1)
                in = 0.5*ones(1,91);
                plot(t(t<=-10), in,'r');
                hold on;
                plot(t(t>=-10),input(:,91:20182), 'r'); %Plots input
                title(['Input - ' num2str(all_freqs(f)) ' Hz']); xlabel('Time (secs)'); ylabel('Amplitude');
                hold off; 
                subplot(3,1,2)
                plot(t,output(ind,:),'b');
                title('Output'); xlabel('Time (secs)'); ylabel('Amplitude');
                hold off;
                fs = 10; %20*all_freqs(f); %Sampling Frequency
               
                y = output(ind,90:20182); %output signal
                
                N = length(y); %length of FFT
                Y = abs((fft(y))); %Magnitude of FFT
               
                %dB = pow2db(Y); %Converts Power to dB
                fbin = (0:N-1)*(fs/N); %Frequency Vector
                subplot(3,1,3)
                plot(fbin,Y,'k'); xlim([0 fs/2]); 
                hold on;
                title('FFT of Output Signal t > 0'); xlabel('Frequency (Hz)'); ylabel('Power'); 
                
               [pks_out, index] = findpeaks(y); % Finds peaks of output for t>0
                pks_fft = findpeaks(Y); %Finds peaks of FFT output
                M = max(pks_fft); %Finds maximum peak of FFT output
                ylim([0 M+50]);
                if M > 10e-6
                    k = find(Y==M);  %Finds index value for maximum peak of FFT output 
                    Time = 20/all_freqs(f); %Total Time 
                    Est_Freq(:,i) = length(pks_out)/Time;
                    fprintf(['\n Estimated Frequency of Output Signal #' num2str(ind) ' is ' num2str(Est_Freq(:,i)) ' Hz \n']);
                    FFT_Freq(:,i) = fbin(k(1));
                    fprintf(['\n Maximum Peak of FFT of Signal #' num2str(ind) ' occurs at ' num2str(FFT_Freq(:,i)) ' Hz \n']); 
                    scatter(fbin(k(1)), Y(k(1)), '*', 'r');
                    text(FFT_Freq(:,i),Y(k(1)) + 5, [num2str(round(FFT_Freq(:,i),4)) ' Hz'], 'VerticalAlignment', 'top', 'FontSize' ,10, 'Color', 'red');
                end
                hold off;
            end
        end
        
    %saveas(h, ['Motif ' num2str(motif) ' - ' num2str(f) ' Hz at index #' num2str(ind)], 'fig'); 
    end
    
end

