clear variables;
close all;
clc;


%Signal 7

%% 2 
[s,nue]= audioread('signal7.wav');
%soundsc(s,nue)
L = length(s);
t1 = (0:L-1)/nue;

%plot(t1,s)

sgram(s,nue,70,2)

%[3000,6400]

%un filtre RIF de type passe bas permettera de supprimer les fréquences
%correspondantes au bruit. La fréquence d e"coupure correspond à la valeur la plus basse du bruit, donc nuec = 3000, et donc Fc =
%nuc/nue = 3000/16000