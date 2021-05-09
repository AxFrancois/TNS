close all
clc;
clear variables;

nue = 5000;
[x,t,K] = SignalFonctionComposee(8,271,90*pi/180,5,1147,90*pi/180,-0.01012,0.01012,nue);

t = t*1000;
stem(t,x)
xlabel('k (indices)')
title('x[k]')
axis([t(1) t(end) min(x) max(x)])

N= 512;

zeroPadding = zeros(1, N-K);
y = [x(floor(K/2)+1:K),zeroPadding, x(1:floor(K/2))];
figure(2)
t2 = -length(y)/(2*nue):1/(nue):(length(y)-1)/(2*nue);
plot(t2,y)
xlabel('k (indices)')
title('y[k]')
axis([t2(1) t2(end) min(y) max(y)])

X = fft(y,N);
figure(3);
nu = 0:nue/N:nue-nue/N;
subplot(221)
plot(nu,real(X))
xlabel('\nu (Hz)')
title('$\Re(X[n])$', 'interpreter','Latex')

subplot(222)
plot(nu,imag(X))
xlabel('\nu (Hz)')
title('$\Im(X[n])$', 'interpreter','Latex')

subplot(223)
plot(nu,abs(X))
xlabel('\nu (Hz)')
title('$|X[n]|$', 'interpreter','Latex')

subplot(224)
plot(nu,angle(X))
xlabel('\nu (Hz)')
title('$\phi(X[n])$', 'interpreter','Latex')


