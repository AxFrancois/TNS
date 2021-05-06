close all
clc;
clear variables;

[t, x, K] = fonction2(8 ,5, 271, 1147, 90, 90, -10.12*10^-3, 10.12*10^-3, 5000);


plot(t,x)

N= 512;

zeroPadding = zeros(1, N-K);
y = [x(floor(K/2)+1:K),zeroPadding, x(1:floor(K/2))];

t_y = length(y)/nue

nue = 5000;

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