clear variables;
close all;
clc;

%1
nue = 5000;
[x,t,K] = SignalFonctionComposee(8,271,25/180*pi,5,1147,38/180*pi,0,0.01841,nue);

% 2

X1 = fft(x,K);

%3
k1=0:1:K-1;
figure(1)
subplot(2,2,1)
plot(k1,real(X1))
axis([k1(1),k1(end),min(real(X1)),max(real(X1))])
xlabel('n (indices)')
title('$\Re(X_1[n])$', 'interpreter','Latex')
subplot(2,2,2)
plot(k1,imag(X1))
axis([k1(1),k1(end),min(imag(X1)),max(imag(X1))])
xlabel('n (indices)')
title('$\Im(X_1[n])$', 'interpreter','Latex')
subplot(2,2,3)
plot(k1,abs(X1))
axis([k1(1),k1(end),min(abs(X1)),max(abs(X1))])
xlabel('n (indices)')
title('$|X_1[n]|$', 'interpreter','Latex')

subplot(2,2,4)
plot(k1,angle(X1)*180/pi)
axis([k1(1),k1(end),min(angle(X1)*180/pi),max(angle(X1)*180/pi)])
xlabel('n (indices)')
title('$\phi(X_1[n])$', 'interpreter','Latex')

f1=0:1/K:1-1/K;
figure(2)
subplot(2,2,1)
plot(f1,real(X1))
xlabel('f')
title('$\Re(X_1[n])$', 'interpreter','Latex')
axis([f1(1),f1(end),min(imag(X1)),max(imag(X1))])

subplot(2,2,2)
plot(f1,imag(X1))
xlabel('f')
title('$\Im(X_1[n])$', 'interpreter','Latex')
axis([f1(1),f1(end),min(imag(X1)),max(imag(X1))])

subplot(2,2,3)
plot(f1,abs(X1))
xlabel('f')
title('$|X_1[n]|$', 'interpreter','Latex')
axis([f1(1),f1(end),min(abs(X1)),max(abs(X1))])

subplot(2,2,4)
plot(f1,angle(X1)*180/pi)
xlabel('f')
axis([f1(1),f1(end),min(angle(X1)*180/pi),max(angle(X1)*180/pi)])
title('$\phi(X_1[n])$', 'interpreter','Latex')

nu1=0:nue/K*1/1000:(nue-nue/K)*1/1000;
figure(3)

subplot(2,2,1)
plot(nu1,real(X1))
xlabel('\nu(khz)')
title('$\Re(X_1[n])$', 'interpreter','Latex')
axis([nu1(1),nu1(end),min(real(X1)),max(real(X1))])

subplot(2,2,2)
plot(nu1,imag(X1))
xlabel('\nu(khz)')
title('$\Im(X_1[n])$', 'interpreter','Latex')
axis([nu1(1),nu1(end),min(imag(X1)),max(imag(X1))])

subplot(2,2,3)
plot(nu1,abs(X1))
xlabel('\nu(khz)')
title('$|X_1[n]|$', 'interpreter','Latex')
axis([nu1(1),nu1(end),min(abs(X1)),max(abs(X1))])

subplot(2,2,4)
plot(nu1,angle(X1)*180/pi)
xlabel('\nu(khz)')
title('$\phi(X_1[n])$', 'interpreter','Latex')
axis([nu1(1),nu1(end),min(angle(X1)*180/pi),max(angle(X1)*180/pi)])

%4
Npoints = 512;
X2 = fft(x,Npoints);

%5
figure(4)
k2=0:1:Npoints-1;
f2=0:1/Npoints:1-1/Npoints;
nu2=0:nue/Npoints*1/1000:(nue-nue/Npoints)*1/1000;

subplot(1,3,1)
plot(k2,abs(X2))
xlabel('n (indices)')
title('$|X_2[n]|$ avec N = 512', 'interpreter','Latex')
axis([k2(1),k2(end),min(abs(X2)),max(abs(X2))])

subplot(1,3,2)
plot(f2,abs(X2))
xlabel('f')
title('$|X_2[n]|$ avec N = 512', 'interpreter','Latex')
axis([f2(1),f2(end),min(abs(X2)),max(abs(X2))])

subplot(1,3,3)
plot(nu2,abs(X2))
xlabel('\nu (khz)')
title('$|X_2[n]|$ avec N = 512', 'interpreter','Latex')
axis([nu2(1),nu2(end),min(abs(X2)),max(abs(X2))])

%6
%Composantes maximales : x = 0.05376, 0.2366, 0.7742, 0.957
%Fréquences correspondantes : 268,9 Hz, 1183, 3871,4785

%7
%flemme, voir prépa


%8
%les 4 pics correspndent au fréquences nu1 et nu2 des 2 fonctiond qui
%composent le signal x. On retrouve ces 2 fréquences en 3871 et 4785 à
%cause de l'échantillonage (périodisation en fréquentiel), en effet
%3871-5000 = -1129~1147 et 4785-5000 = -215~271

%9
%On a un ecart assez important à cause du faible nombre de point de la TFD

%10
%les pics sont aux fréquences 274, 1145, 3865 et 4736
%3865-5000 = -1135 et 4736-5000 = -264
%plus précis car plus de point

%11

