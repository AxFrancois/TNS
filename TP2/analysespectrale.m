function analysespectrale(numsig,M,nue,N)
% function analysespectrale(numsig,M,nue,N)
% 
% Génère M points du signal portant le numero numsig
% de bande maximale 10 kHz constitué de 5 composantes
% Il sera échantillonné à la fréquence nue puis affiché
%
% dans un second temps la densité spectrale d'énergie du signal généré est calculée
% à l'aide d'une TFD-N points
%
% variables d'entrée
%       numsig : numéro du signal affecté par l'intervenant en début de
%                séance
%		M :	nombre d'échantillons du signal
%				peut prendre les valeurs 125 250 500 1000 2000 4000
%		nue :	fréquence d'échantillonnage
%				doit être un multiple de 2000 compris entre 2000 et 20000 Hz
%       N : nombre de points de la TFD utilisé pour calculer la densité spectrale
%               doit être une puissance de 2
%
% développé par N. Gache mai 2016

%close all
[s,t,OK]=gene(numsig,M,nue);
if OK==1
    T=M/nue;
    figure(numsig)
    subplot(2,1,1)
    plot(t*1000,s)
    title(['\its\rm(\itt\rm) echantillonné à \nue = ',num2str(nue/1000),' kHz sur une durée de ',num2str(T*1000),' ms, soit ',num2str(M),' échantillons']);
    xlabel('\itt\rm en millisecondes')
    axis([0 t(M)*1000 -Inf +Inf])
    % test du nombre de points de TFD
    n=nextpow2(N);
    N2=2^n;
    if N~=N2
        disp('N doit être une puissance de 2 : la DSE ne peut pas être calculée')
    elseif N<M
        disp('N doit être au moins égal à M : la DSE ne peut pas être calculée')
    else
        sp=abs(fft(s,N));
        sp=sp(1:N/2).^2; 
        nu=(0:N/2-1)*nue/N;
        subplot(2,1,2)
        plot(nu/1000,sp)
        title(['\Gamma\it_s\rm(\nu) calculé sur ',num2str(N),' points'])
        xlabel('\nu en kHz')
        axis([0 nue/2/1000 0 +inf])
        grid
         
    end
end

function [s,t,OK]=gene(numsig,M,nue)
% function [s,t,OK]=gene(numsig,M,nue);
% 
% Génère M points du signal portant le numero numsig
% de bande maximale 10 kHz constitué de 5 composantes
% Il sera échantillonné à la fréquence nue
%
% variables d'entrée
%       numsig : numéro du signal affecté par l'intervenant en début de
%                séance
%		M :	nombre d'échantillons du signal
%				peut prendre les valeurs 125 250 500 1000 2000 4000
%		nue :	fréquence d'échantillonnage
%				doit être un multiple de 2000 compris entre 2000 et 20000 Hz
% 
% variables de sortie
%		s :	séquence des M échantillons du signal
%		t :	séquence telle que t=k*Te, k=0,...,M-1
%       OK = 1 si la génération s'est bien déroulée

% test de la fréquence d'échantillonnage
tnue=nue/2000;
if (tnue~=fix(tnue))|(nue<2000) |(nue>20000)
   disp('Le système d''acquisition ne fonctionne pas')
   disp('avec cette fréquence d''échantillonnage')
   if nue<2000
      disp([num2str(nue),' Hz est une fréquence trop faible'])
   end
   if nue>20000
      disp([num2str(nue),' Hz est une fréquence trop élevée'])
   end
   if (tnue~=fix(tnue))
      disp('La fréquence doit être un multiple de 2000 Hz')
   end
   s=[];t=[];
   OK=0;
else 
% test du nombre de points
   Mvalide=[125 250 500 1000 2000 4000];
   k=find(M==Mvalide);
   if isempty(k)==1
      disp(['M = ',num2str(M),' ne fait pas partie des valeurs possibles pour le nombre d''échantillons'])
      s=[];t=[];
      OK=0;
   else
      % récupération de tout le fichier
      eval(['load sig',num2str(numsig)]);
      % élaboration du vecteur temps
      t=(0:M-1)/nue;
      Mvar=[125 250 500 1000 2000 4000];
      colonne=find(Mvar==M);
      ligne=nue/2000;
      indice=0;
      % il y a 10 séquences possibles pour 10 nue possibles
      if colonne~=1
         indice=10*sum(Mvar(1:colonne-1));
      end;
      indice=indice+(ligne-1)*Mvar(colonne)+1;
      s=x(indice:indice+M-1);
      clear x
      disp(['La durée de signal généré est de ',num2str(t(M)),' secondes']);
      OK=1;
   end
end