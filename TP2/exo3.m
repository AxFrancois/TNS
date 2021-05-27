clear variables;
close all;
clc;

%signal attribué : signal 16
numsig = 16;
M = 4000;
nue = 20000;
N = 4096;

%On met la plus grande valeur d'échantillonnage possible afin de nous
%représenter au mieux le signal. OIn peut ainsi mesurer la plus grande
%fréquence qui compose ce signal, et donc grâce au critère de shanon, nous
%pouvons décidé d'une fréquence d'échantillonnage plus adapté. le fréquence
%la plus élévé est de 2,716 kHz, nousz choisissons donc une fréquence au
%moins 2 fois supérieur à cette dernière. Nous prenons donc nue = 6000 Hz

%M = 4000;
%nue = 6000;
%N = 4096;

%nue étant à préent fixé, nous devons choisir la valeur de n tel que
%nue/N<3. Ainsi, il vient N > 2000 = 2048 (plus proche valeur)

%M = 4000;
%nue = 6000;
%N = 2048;

%A présent il nous faut choisir M. on sais que pour obtenir une TFD
%correcte il faut N >= M, donc M <= 2048
%Le nombre de point influe sur la résolution de le TFD. Or, nous constatons
%que le signal présente 2 pic très proche à 2,704 et 2,716 kHZ. On diminue
%donc le nombre de point M jusqu'à ce que les 2 pics ne soient plus
%discernable, et on prendra la valeur précédente. On trouve M = 500 

M = 1000; %500 ok mais pas beau
nue = 6000;
N = 2048;

analysespectrale(numsig,M,nue,N)