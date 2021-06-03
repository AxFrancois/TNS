clear variables;
close all;
clc;

%% 3.2
i = complex(0,1);

B = 10000;
nue = 20000;
nu1 = 2625;
nu2 = 7280;

f0 = B/nue; 
f1 = nu1/nue;
f2 = nu2/nue;

z1 = exp(i*2*pi*f1);
z2 = conj(z1);
z3 = exp(i*2*pi*f2);
z4 = conj(z3);
z5 = -1;

zeros = [z1 z2 z3 z4 z5];
bl = poly(zeros);

%evaluation de la valeur du filtre aux fréquences à filtrer
zeros_eval = polyval(bl,1);
H = bl/zeros_eval;

%H = bl/(2*(1-z1)*(1-z2)*(1-z3)*(1-z4));

a = 1; %car tout zero
n = 2048;
[h,f] = freqz(bl,a,n,nue); % [réponse fréquentielle filtre, fréquences] = freqz(Pôles,Zeros,nombre de points,fréq d'echantillonnage)

subplot(2,2,1)
zplane(roots(bl))
subplot(2,2,2)
stem(0:1:5,bl)
subplot(2,2,3)
plot(f,20*log10(abs(h)))
subplot(2,2,4)
plot(f,angle(h))


%% 3.3

load signal4.mat


s1 = 8*sin(2*pi*nu1*t);
s2 = 8*sin(2*pi*nu2*t);
x = s + s1 + s2;

y = filter(H,a,x);

figure(2)
subplot(3,1,1)
plot(t,s)
subplot(3,1,2)
plot(t,x)
subplot(3,1,3)
plot(t,y)

Fred=0:nue/n:(nue-nue/n);

S = abs(fft(s,n)).^2;
X = abs(fft(x,n)).^2;
Y = abs(fft(y,n)).^2;

figure(3)
subplot(3,1,1)
plot(Fred,S)
axis([0 B -Inf +Inf])
subplot(3,1,2)
plot(Fred,X)
axis([0 B -Inf +Inf])
subplot(3,1,3)
plot(Fred,Y)
axis([0 B -Inf +Inf])

