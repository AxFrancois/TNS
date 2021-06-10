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

%sgram(s,nue,70,2)

%[3000,6400]

%un filtre RIF de type passe bas permettera de supprimer les fréquences
%correspondantes au bruit. La fréquence d e"coupure correspond à la valeur la plus basse du bruit, donc nuec = 3000, et donc Fc =
%nuc/nue = 3000/16000

%% 3.1

nuc = 3000;
fc = nuc/nue;
%{
M = 45;
b1 = fir1(M,fc*2, rectwin(M+1));
n = 2048;
[h1,f1] = freqz(b1,1,n,nue);

%{
figure(3)
subplot(2,2,1)
zplane(roots(b1))
subplot(2,2,2)
stem(0:1:length(b1)-1,b1)
subplot(2,2,3)
plot(f1,20*log10(abs(h1)))
subplot(2,2,4)
plot(f1,unwrap(angle(h1)))
%}
%% 3.2

b2 = fir1(M,fc*2, hamming(M+1));
n = 2048;
[h2,f2] = freqz(b2,1,n,nue);

%{
figure(4)
subplot(2,2,1)
zplane(roots(b2))
subplot(2,2,2)
stem(0:1:length(b2)-1,b2)
subplot(2,2,3)
plot(f2,20*log10(abs(h2)))
subplot(2,2,4)
plot(f2,unwrap(angle(h2)))
%}
%% 3.3
%{
figure(5)
hold on
plot(f1,abs(h1))
% 1 - Delta p = 0.9483
% 1 - Delta p = 1.075
% -delta a = -0.094
% delta a = 0.05338
plot(f1, ones(length(f1))*0.9483)
plot(f1, ones(length(f1))*0.05338)
%fp = 2816
%fa = 3176

figure(6)
hold on
plot(f2,abs(h2))
% 1 - Delta p = 0.9981
% 1 - Delta p = 1.002
% -delta a = -0.001854
% delta a = 0.001837
plot(f1, ones(length(f1))*0.9981)
plot(f1, ones(length(f1))*0.001837)
%fp = 2391
%fa = 3605
%}


y1 = filter(b1,1,s);
y2 = filter(b2,1,s);

%soundsc(y1)

%soundsc(y2)

%sgram(y1,nue,60,7)
%sgram(y2,nue,60,8)
%{
nuc = 2750;
fc = nuc/nue;
M = 80;
b3 = fir1(M,fc*2, rectwin(M+1));
n = 2048;
[h3,f3] = freqz(b3,1,n,nue);
b4 = fir1(M,fc*2, blackman(M+1));
n = 2048;
[h4,f4] = freqz(b4,1,n,nue);
y3 = filter(b3,1,s);
y4 = filter(b4,1,s);
sgram(y3,nue,60,9)
sgram(y4,nue,60,10)
soundsc(y4,nue)
%}
%}

%% 4

%20log(delta a) ~ -60 db

n = 7;
Wp = 2850*2*pi;
Rp = 2;
Rs = 90;
N= 2048;
[b,a] = ellip(n,Rp,Rs,Wp,'s');

figure(11)

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

figure(12)

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



figure(13)
hold on
plot(F,abs(H))
% 1 - Delta p = 0.7943
% 1 - Delta p = 1
% -delta a = -0.001
% delta a = 0.001
plot(F, ones(length(F))*0.7943)
plot(F, ones(length(F))*0.001)
%fp = 2598
%fa = 3340

S_filtre = filter(numd,dend,s);
sgram(S_filtre,nue,60,14);

%soundsc(S_filtre,nue)

