function sgram(x,nue,dB,fig);
% function sgram(x,nue,dB,fig);
%
% sgram calcule le spectrogramme d'un signal 
% ainsi que sa densit� spectrale
% les variables d'entr�e sont :
%   - x : le signal qui doit etre d'une dur�e sup�rieure � 10000 �chantillons
%   - nue : la fr�quence d'�chantillonnage associ�e au signal
%   - dB : la dynamique souhait�e en dB pour l'affichage du spectrogramme
%   - fig : le num�ro de la figure de destination
%
% sgram affiche sur la figure fig :
%   - le signal temporel
%   - la densit� spectrale dont le maximum est normalis� � 0 dB
%   - une image repr�sentant le spectrogramme cod� sur 8 niveaux de gris
%       dont le niveau le plus sombre est normalis� � 0 dB
%   - la palette de niveaux de gris
%
% Les param�tres de calcul du spectrogramme sont :
%   - fenetre de Hanning de 512 �chantillons
%   - recouvrement des tranches successives de 488 �chantillons
%   - FFT sur 1024 points
%

% d�velopp� par N. Gache le 25/11/2002

[tftc,nu,t]=spectrogram(x,hanning(512),488,1024,nue);
L=20*log10(abs(tftc));
TF=max(L,max(max(L))-dB);
figure(fig),clf
set(gcf,'Color',[1 1 1])
axsig  = axes('Units','normal','Visible','off','Box','On');
axcb  = axes('Units','normal','Visible','off','Box','On');
axspec = axes('Units','normal','Visible','off','Box','On');
axtfr  = axes('Units','normal','Visible','off','Box','On');
set(axtfr,'Position',[0.32 0.10 0.55 0.55]);
axes(axtfr);
map=[0.40 0.40 0.40
    0.48 0.48 0.48
    0.56 0.56 0.56
    0.64 0.64 0.64
    0.72 0.72 0.72
    0.80 0.80 0.80
    0.88 0.88 0.88
    0.96 0.96 0.96];
imagesc(t,nu,TF),axis xy
colormap(flipud(map));
set(axsig,'Position',[0.32 0.73 0.55 0.20]);
xlabel('secondes'),title('spectrogramme')
axes(axsig);
plot((0:length(x)-1)/nue,x)
set(gca,'XLim',[256/nue (length(x)-256)/nue])
set(axcb,'Position',[0.95 0.1 0.02 0.55])
axes(axcb);
%[cm,cM]=caxis;
colorpal=linspace(0.4,0.96,8);
imagesc((fliplr(colorpal))'); 
set(gca,'XTick',[],'Ytick',[0.91 8],'YTickLabel',{'0 dB';['-',num2str(dB),' dB']})
set(axspec,'Position',[0.1 0.1 0.15 0.55])
axes(axspec);
[Pxx,W] = pwelch(x,hanning(512),250,1024,nue);
plot(W,10*log10(Pxx/max(Pxx)))
grid
xlabel('Hz'),ylabel('dB')
set(gca,'XLim',[0 nue/2],'YLim',[-dB 5],'view',[-90 90])