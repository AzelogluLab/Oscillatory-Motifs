function [ first_part ] = get_equil(t,motif,params,input)
%GET_EQUIL finds the first part of the output signal for each type of
%input, prior to the application of stimulus.
%   t is a time vector
%   motif is the number of the motif of interest
%   params is a struct of parameters, to be passed to DIFF_FUNK
%   input is a string specifying the input at which to equilibrate

% Set up ODE to solve system of the correct size
if any(motif==1:14) % if the motif has 3 members
    options_ode = odeset('RelTol',1e-7,'AbsTol',1e-7,'NonNegative',[1 2 3]);
    active0 = 0.5*ones(1,3);
elseif any(motif==15:20) % if it has 4
    options_ode = odeset('RelTol',1e-7,'AbsTol',1e-7,'NonNegative',[1 2 3 4]);
    active0 = 0.5*ones(1,4);
elseif any(motif==21:23) % if it has 5
    options_ode = odeset('RelTol',1e-7,'AbsTol',1e-7,'NonNegative',[1 2 3 4 5]);
    active0 = 0.5*ones(1,5);
elseif any(motif==1819) % if it has 5
    options_ode = odeset('RelTol',1e-7,'AbsTol',1e-7,'NonNegative',[1 2 3 4 5 6 7 8]);
    active0 = 0.5*ones(1,8);
end
%Equilibrate over 100 hours
[~,calib] = ode15s(@(t,active) diff_funk(t,active,params,motif,input,[]),[-360000 -.01],active0,options_ode);
[~,first_part] = ode15s(@(t,active) diff_funk(t,active,params,motif,input,[]),t(t<0),calib(end,:),options_ode);
first_part = first_part';
end
