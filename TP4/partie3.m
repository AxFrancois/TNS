clear variables;
close all;
clc;


%% 3.1
[s,nue]= audioread('signal7.wav');

nuc = 3000;
fc = nuc/nue;

M = 45;
b1 = fir1(M,fc*2, rectwin(M+1));
n = 2048;
[h1,f1] = freqz(b1,1,n,nue);


figure(3)
subplot(2,2,1)
zplane(roots(b1))
title('diagramme pôle-zéros')

subplot(2,2,2)
stem(0:1:length(b1)-1,b1)
title('réponse impulsionnelle')

subplot(2,2,3)
plot(f1,20*log10(abs(h1)))
title('module du gain complexe en dB')

subplot(2,2,4)
plot(f1,unwrap(angle(h1)))
title('phase du gain complexe')
%% 3.2

b2 = fir1(M,fc*2, hamming(M+1));
n = 2048;
[h2,f2] = freqz(b2,1,n,nue);


figure(4)
subplot(2,2,1)
zplane(roots(b2))
title('diagramme pôle-zéros')

subplot(2,2,2)
stem(0:1:length(b2)-1,b2)
title('réponse impulsionnelle')

subplot(2,2,3)
plot(f2,20*log10(abs(h2)))
title('module du gain complexe en dB')

subplot(2,2,4)
plot(f2,unwrap(angle(h2)))
title('phase du gain complexe')
%% 3.3

figure(5)
hold on
plot(f1,abs(h1))
title('modules du gain complexe en échelle linéaire pour fenêtre rectangulaire')
% 1 - Delta p = 0.9483
% 1 + Delta p = 1.075
% -delta a = -0.094
% delta a = 0.05338
plot(f1, ones(length(f1))*0.9483)
plot(f1, ones(length(f1))*0.05338)
%fp = 2816
%fa = 3176

figure(6)
hold on
plot(f2,abs(h2))
title('modules du gain complexe en échelle linéaire pour fenêtre hamming')
% 1 - Delta p = 0.9981
% 1 - Delta p = 1.002
% -delta a = -0.001854
% delta a = 0.001837
plot(f1, ones(length(f1))*0.9981)
plot(f1, ones(length(f1))*0.001837)
%fp = 2391
%fa = 3605



y1 = filter(b1,1,s);
y2 = filter(b2,1,s);

%soundsc(y1)

%soundsc(y2)

sgram(y1,nue,60,7)
title('fenêtre rectangulaire', 'fontsize',8)
sgram(y2,nue,60,8)
title('fenêtre hamming', 'fontsize',8)

nuc = 2750;
fc = nuc/nue;
M = 80;
n = 2048;
b3 = fir1(M,fc*2, rectwin(M+1));

[h3,f3] = freqz(b3,1,n,nue);
b4 = fir1(M,fc*2, blackman(M+1));

[h4,f4] = freqz(b4,1,n,nue);

y3 = filter(b3,1,s);
y4 = filter(b4,1,s);
sgram(y3,nue,60,9)
title('fenêtre rectangulaire', 'fontsize',8)
sgram(y4,nue,60,10)
title('fenêtre blackman', 'fontsize',8)

soundsc(y4,nue)
