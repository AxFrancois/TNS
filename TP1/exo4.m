close all
clc;
clear variables;

nue = 5000;
[x,t,K] = SignalFonctionComposee(8,271,90*pi/180,5,1147,90*pi/180,-0.01012,0.01012,nue);


plot(t,x)

N= 512;

zeroPadding = zeros(1, N-K);
y = [x(floor(K/2)+1:K),zeroPadding, x(1:floor(K/2))];

X = fft(y,N);
figure(2);
nu = 0:nue/N:nue-nue/N;
subplot(221)
plot(nu,real(X))
title('partie réelle')

subplot(222)
plot(nu,imag(X))
title('partie imaginaire')

subplot(223)
plot(nu,abs(X))
title('module')

subplot(224)
plot(nu,angle(X))
title('phase')