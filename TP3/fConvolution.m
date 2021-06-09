function fConvolution(N,numfig)

k1 = 0:1:10;
k2 = 5:1:11;

x = 6 - abs(k1 - 5);
h = [[0 0 0 0 0], abs(k2 - 8) - 1];
k2 = 0:1:11;

X = fft(x,N);
H = fft(h,N);

Y = H.*X;
y = ifft(Y,N);
k3 = 0:1:N-1;

figure(numfig)
subplot(3,1,1)
stem(k1,x)
title('$x[k]$','interpreter','latex')
xlabel('k')
subplot(3,1,2)
stem(k2,h)
title('$h[k]$','interpreter','latex')
xlabel('k')
subplot(3,1,3)
stem(k3,y)
title('$y_c[k]$','interpreter','latex')
xlabel('k')
axis([0,21,0,20])
