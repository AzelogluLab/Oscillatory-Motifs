function [ active ] = get_response(t,motif,params, input,freq,first_part)
%GET_RESPONSE solves starting at the end of the equilibrated signal, for
%each type of input specified.

%   t is a time vector
%   motif is the number of the motif of interest
%   params is a struct of parameters, to be passed to DIFF_FUNK
%   input is a string specifying the type of input stimulus to be applied,
%   to be passed to DIFF_FUNK.

%Solve for equilibrium

% Set up ODE to solve system of the correct size
if any(motif==1:14) % if the motif has 3 members
    options_ode = odeset('RelTol',1e-7,'NonNegative',[1 2 3]);
elseif any(motif==14:20) % if it has 4
    options_ode = odeset('RelTol',1e-7,'NonNegative',[1 2 3 4]);
elseif any(motif==21:23) % if it has 5
    options_ode = odeset('RelTol',1e-7,'NonNegative',[1 2 3 4 5]);
elseif any(motif==1819)
    options_ode = odeset('RelTol',1e-7,'NonNegative',[1 2 3 4 5 6 7 8]);
end

%Solve over t
[~, second_part] = ode15s(@(t,active) diff_funk(t,active,params, motif,input,freq), t(t>=0), first_part(:,end)', options_ode);
active = [first_part'; second_part]';
end