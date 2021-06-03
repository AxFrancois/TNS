clear variables;
close all;
clc;

fConvolution(13,1)
fConvolution(19,2)
fConvolution(22,3)

%On identifie complétement notre séquence pour N = 19 et N = 22. En effet,
%la séquence calculé lors de la préparation nous donne 17 valeurs, donc si
%on prend N < Card(y[n]) nous n'obtenons pas les résultats attendus
