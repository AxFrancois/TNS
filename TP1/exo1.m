clear variables;
close all;
clc;

%Fonction 1
[s1,k1] = SignalPeriodiqueFreqPure(2,1/34,0,0,26);
subplot(2,2,1)
stem(k1,s1)
xlabel('k')
ylabel('s1[k]')

%Fonction 2
[s2,k2] = SignalPeriodiqueFreqPure(-4,1/26,pi/2,-13,13);
subplot(2,2,2)
stem(k2,s2)
xlabel('k')
ylabel('s2[k]')

%Fonction 3
[s3,k3] = SignalPeriodiqueFreqPure(1,3/32,pi/4,-10,10);
subplot(2,2,3)
stem(k3,s3)
xlabel('k')
ylabel('s3[k]')

%Fonction 4
[s4,k4] = SignalPeriodiqueFreqPure(1,1/(2*sqrt(23)),0,0,50);
subplot(2,2,4)
stem(k4,s4)
xlabel('k')
ylabel('s4[k]')