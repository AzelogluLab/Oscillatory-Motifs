clc
clear all
close all

%{
le = 100;
fs = 10;
fq = 1;
vmv = 0:1/(fs*le):1;
T = 0:(1/fs):le;
s = vmv.*sin((fq*2)*pi*T);
figure
plot(T,s)

%}

f = 1;
t = [0:0.1:10];
figure
x = sin(2*pi*t*f);
j = 0;
for i = length(x)
    j = j+2;
    j = j*j;
    x(i) = x(i) + j; 
end
plot(t,x);
