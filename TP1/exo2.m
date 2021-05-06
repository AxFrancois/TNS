clear variables;
close all;
clc;

[s,t,K] = SignalFonctionComposee(8,271,25/180*pi,5,1147,38/180*pi,-0.0081,0.01205,5000);

stem(t,s)
