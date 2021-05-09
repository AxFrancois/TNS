clear variables;
close all;
clc;

[s,t,K] = SignalFonctionComposee(8,271,25/180*pi,5,1147,38/180*pi,-0.0081,0.01205,5000);

stem(t,s)
axis([t(1),t(end),min(s),max(s)])
xlabel('t = kTe')
ylabel('x[k]')
title('échantillons x en fonction de t')
