function [ X] = retrieve_params( motif )
%RETRIEVE_PARAMS returns a (N*kmax) by (num_params(motif)) matrix where N*kmax is the
%number of total simulations per motif per frequency and num_params(motif) is the number of
%VARIABLE parameters.  Parameters kept constant between simulations are
%excluded.  Parameters are returned in the order in which they are listed
%below, which is the same order in which they are defined in the
%GET_PARAMS.m function.

%   Andrew Leader
%   Aug 23, 2013

kmax = 20;
N = 500;

%List the number of VARIABLE parameters that each motif has assigned to it
num_params = [8 8 8 8 8 10 10 10 10 10 10 10 10 12 10 10 10 10 10 10];

%preallocate the parameters matrix
X = NaN(kmax*N,num_params(motif));

for k = 1:kmax
    load(['motif_' num2str(motif) '/params/params_' num2str(k) '_' num2str(N) '.mat']);
    for ii = 1:N
        
        if motif == 1
            X((k-1)*N+ii,:) = ...
                [params(ii).kcatafx;
                params(ii).kcatafc;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).Kmafx;
                params(ii).Kmafc;
                params(ii).Kmbf;
                params(ii).Kmcf];
            
        elseif motif == 2
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatar;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).Kmaf;
                params(ii).Kmar;
                params(ii).Kmbf;
                params(ii).Kmcf];
            
        elseif motif == 3
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcra;
                params(ii).kcatcrb;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcra;
                params(ii).Kmcrb];
            
            
        elseif motif == 4
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcfa;
                params(ii).kcatcfb;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcfa;
                params(ii).Kmcfb];
        elseif motif == 5
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).kcatcr;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcf;
                params(ii).Kmcr];
        elseif motif == 6
            X((k-1)*N+ii,:) = ...
                [params(ii).kcatafx;
                params(ii).kcatafb;
                params(ii).kcatbfa;
                params(ii).kcatbfc;
                params(ii).kcatcf;
                params(ii).Kmafx;
                params(ii).Kmafb;
                params(ii).Kmbfa;
                params(ii).Kmbfc;
                params(ii).Kmcf];
        elseif motif == 7
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatar;
                params(ii).kcatbfa;
                params(ii).kcatbfc;
                params(ii).kcatcr;
                params(ii).Kmaf;
                params(ii).Kmar;
                params(ii).Kmbfa;
                params(ii).Kmbfc;
                params(ii).Kmcr];
        elseif motif == 8
            X((k-1)*N+ii,:) = ...
                [params(ii).kcatafx;
                params(ii).kcatafb;
                params(ii).kcatbf;
                params(ii).kcatbr;
                params(ii).kcatcf;
                params(ii).Kmafx;
                params(ii).Kmafb;
                params(ii).Kmbf;
                params(ii).Kmbr;
                params(ii).Kmcf];
        elseif motif == 9
            X((k-1)*N+ii,:) = ...
                [params(ii).kcatafx;
                params(ii).kcatafc;
                params(ii).kcatbf;
                params(ii).kcatcfa;
                params(ii).kcatcfb;
                params(ii).Kmafx;
                params(ii).Kmafc;
                params(ii).Kmbf;
                params(ii).Kmcfa;
                params(ii).Kmcfb];
        elseif motif == 10
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatar;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).kcatcr;
                params(ii).Kmaf;
                params(ii).Kmar;
                params(ii).Kmbf;
                params(ii).Kmcf;
                params(ii).Kmcr];
        elseif motif == 11
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatar;
                params(ii).kcatbf;
                params(ii).kcatcfa;
                params(ii).kcatcfb;
                params(ii).Kmaf;
                params(ii).Kmar;
                params(ii).Kmbf;
                params(ii).Kmcfa;
                params(ii).Kmcfb];
        elseif motif == 12
            X((k-1)*N+ii,:) = ...
                [params(ii).kcatafx;
                params(ii).kcatafc;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).kcatcr;
                params(ii).Kmaf;
                params(ii).Kmar;
                params(ii).Kmbf;
                params(ii).Kmcf;
                params(ii).Kmcr];
        elseif motif == 13
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatbr;
                params(ii).kcatcfa;
                params(ii).kcatcfb;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmbr;
                params(ii).Kmcfa;
                params(ii).Kmcfb];
            
        elseif motif == 14
            X((k-1)*N+ii,:) = ...
                [params(ii).kcatafx;
                params(ii).kcatafc;
                params(ii).kcatbf;
                params(ii).kcatbr;
                params(ii).kcatcf;
                params(ii).kcatcr;
                params(ii).Kmafx;
                params(ii).Kmafc;
                params(ii).Kmbf;
                params(ii).Kmbr;
                params(ii).Kmcf;
                params(ii).Kmcr];
            
        elseif motif == 15
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).kcatdfb;
                params(ii).kcatdfc;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcf;
                params(ii).Kmdfb;
                params(ii).Kmdfc];
            
        elseif motif == 16
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).kcatdf;
                params(ii).kcatdr;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcf;
                params(ii).Kmdf;
                params(ii).Kmdr];
            
        elseif motif == 17
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcr;
                params(ii).kcatdfb;
                params(ii).kcatdfc;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcr;
                params(ii).Kmdfb;
                params(ii).Kmdfc];
            
        elseif motif == 18
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcr;
                params(ii).kcatdf;
                params(ii).kcatdr;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcr;
                params(ii).Kmdf;
                params(ii).Kmdr];
            
        elseif motif == 19
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcr;
                params(ii).kcatdf;
                params(ii).kcatdr;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcr;
                params(ii).Kmdf;
                params(ii).Kmdr];
            
        elseif motif == 20
            X((k-1)*N+ii,:) = ...
                [params(ii).kcataf;
                params(ii).kcatbf;
                params(ii).kcatcf;
                params(ii).kcatdrb;
                params(ii).kcatdrc;
                params(ii).Kmaf;
                params(ii).Kmbf;
                params(ii).Kmcf;
                params(ii).Kmdfb;
                params(ii).Kmdrc];
        end
    end
end
end

