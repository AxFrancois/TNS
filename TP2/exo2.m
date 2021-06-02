clear variables;
close all;
clc;

%% 2
%A
%CreationCos(1/7,35) %1/7 car 35/5 = 7
%Finesse d analyse DeltaF = 0.028571

%on obitent des composantes non nulles à la fréquence f0 du cos
% amplitude est bien M/2 = 35/2 = 17.5
%b
%CreationCos(1/7,70)

%%3 
%CreationCos(5.2/35,35)
%1/7
%non, quelle surprise holala je m'y attendais pas du tout omg щ（ﾟДﾟщ）
%pas un pas assez grand pour avoir la valeur exacte de 5.2/35
% pour pouvoir le voir il faut prendre un nombre de point multiple de
% 35/5.2 = 6.73076923076923
% si on prend donc N = 673 point on vest plutôt pas mal
CreationCos(5.2/35,673)