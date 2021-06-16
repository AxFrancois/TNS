clear variables;
close all;
clc;


%Signal 7

%% 4

%20log(delta a) ~ -60 db

[s,nue]= audioread('signal7.wav');

n = 7;
Wp = 2850*2*pi;
Rp = 2; %1 initialement
Rs = 80; %Rs = 60 initialement
N= 2048;
[b,a] = ellip(n,Rp,Rs,Wp,'s');

figure(1)

w = 2*pi*[0:nue/2];
[h,f] = freqs(b,a,w);

subplot(2,1,1)
plot(f/(2*pi),20*log10(abs(h)))
title('module du gain complexe en dB')

subplot(2,1,2)
plot(f/(2*pi),unwrap(angle(h)))
title('phase du gain complexe')


num  = b;
den = a;

[numd,dend] = bilinear(num,den,nue);

[h,t] = impz(numd,dend);

[H,F] = freqz(numd,dend,N,nue);

figure(2)

subplot(2,2,1)
zplane(numd,dend)
title('diagramme pôle-zéros')

subplot(2,2,2)
stem(t,h)
title('réponse impulsionnelle')

subplot(2,2,3)
plot(F,20*log10(abs(H)))
title('module du gain complexe en dB')

subplot(2,2,4)
plot(F,unwrap(angle(H)))
title('phase du gain complexe')



figure(3)
hold on
plot(F,abs(H))
title('modules du gain complexe en échelle linéaire')
% 1 - Delta p = 0.7943
% 1 + Delta p = 1
% -delta a = -0.001
% delta a = 0.001
plot(F, ones(length(F))*0.7943)
plot(F, ones(length(F))*0.001)
%fp = 2598
%fa = 3340

S_filtre = filter(numd,dend,s);
sgram(S_filtre,nue,60,4);

soundsc(S_filtre,nue)

