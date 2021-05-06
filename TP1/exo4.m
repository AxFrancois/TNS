clear variables;
close all;
clc;

%1
nue = 5000;
[x,t,K] = SignalFonctionComposee(8,271,90/180*pi,5,1147,90/180*pi,-0.01012,0.01012,nue);

plot(t,x)

BorneInf = floor(length(x)/2)
XCoupe = x(BorneInf:length(x))

%2
Npoints = 512;
nu=0:nue/(Npoints-1)*1/1000:nue*1/1000;
X1 = fft(x,Npoints)
subplot(1,2,1)
plot(nu,imag(X1))
X2 = fft(XCoupe,Npoints);
subplot(1,2,2);
plot(nu,imag(X2))