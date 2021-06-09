close all;
clc;
clear variables;

B = 10000;
nue = 20000;

nu1 = 2625;

nu2 = 7280;

f0 = B/nue;
f1 = nu1/nue;

f2 = nu2/nue;

i = complex(0,1);

zeros1 = exp(i*2*pi*f1);

zeros1conj = conj(zeros1);

zeros2 = exp(i*2*pi*f2);

zeros2conj = conj(zeros2);

zeros3 = -1;

zeros = [zeros1,zeros1conj,zeros2,zeros2conj,zeros3];


bl = poly(zeros);

eval_zeros = sum(bl);
%zeros_eval = polyval(bl,1)

h = bl/eval_zeros;


a = 1;
b = bl;
n = 1024;

[H,w] = freqz(b,a,n,nue);


figure(1)

subplot(221)
zplane(roots(h))
title('diagramme pôle-zéros','FontSize', 12, 'FontName','times')

subplot(222)
stem(0:1:5,bl)
title('réponse impulsionnelle','FontSize', 12, 'FontName','times')

subplot(223)
plot(w,20*log10(abs(H)))
title('module du gain complexe en dB','FontSize', 12, 'FontName','times')

subplot(224)
plot(w,unwrap(angle(H)))
title('phase du gain complexe','FontSize', 12, 'FontName','times')


%3.3

figure(2)
load signal4.mat


s1 = 8*sin(2*pi*nu1*t);
s2 = 8*sin(2*pi*nu2*t);


x = s + s1 +s2;

y = filter(h,a,x);

subplot(311)
plot(t,s)
axis([t(1),t(end),min(s),max(s)])
title('signal','FontSize', 12, 'FontName','times')
xlabel('t')

subplot(312)
plot(t,x)
axis([t(1),t(end),min(x),max(x)])
title('signal brouillé','FontSize', 12, 'FontName','times')
xlabel('t')

subplot(313)
plot(t,y)
axis([t(1),t(end),min(y),max(y)])
title('signal filtré','FontSize', 12, 'FontName','times')
xlabel('t')
%densité spectrale

S = abs(fft(s,n)).^2;
X = abs(fft(x,n)).^2;
Y = abs(fft(y,n)).^2;

f = 0:nue/n:(nue-nue/n);
figure(3)
subplot(311)
plot(f,S)
axis([0,10000,-Inf,+Inf])
title('densité spectrale signal','FontSize', 12, 'FontName','times')
xlabel('f')

subplot(312)
plot(f,X)
axis([0,10000,-Inf,+Inf])
title('densité spectrale signal brouillé','FontSize', 12, 'FontName','times')
xlabel('f')

subplot(313)
plot(f,Y)
axis([0,10000,-Inf,+Inf])
title('densité spectrale signal filtré','FontSize', 12, 'FontName','times')
xlabel('f')

% fréquence à conserver intact
f4 = 2949/nue;

p1 = exp(2*i*pi*f4);
p1conj = conj(p1);

pole = [p1,p1conj];

am = poly(pole);

%zeros_eval_pole =  sum(am);

%eval = polyval(am/bl,1)
eval_pole = sum(am);

h_corr = bl*eval_pole/eval_zeros;

figure(4)

zplane(bl,am)

figure(5)

y = filter(h_corr,am,x);
Y = abs(fft(y,n)).^2;
% plot(t,y)
plot(f,Y)
axis([0,10000,-Inf,+Inf])
title('densité spectrale signal filtré corrigé')
xlabel('f')
