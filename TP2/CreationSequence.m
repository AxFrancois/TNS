function CreationSequence(M)
i=complex(0,1);

figure(1);
%1
k = 0:1:M-1;
s = (0.91).^k;
figure(1)
subplot(1,2,1)
stem(k,s);
xlabel('k')
ylabel('s[k]')
title('$s[k]$ $a$ $40$ $echantillons$','interpreter','Latex')
axis([0,M-1,0,max(s)])


N = 2048;
Deltaf = 1/N;
S = fft(s,N);
t = 0:Deltaf:1-Deltaf;
subplot(1,2,2)
plot(t,abs(S))
xlabel('f')
ylabel('S[n]')
title('$S[n]$ $,$ $sa$ $TFD$ $2048-points$','interpreter','Latex')
axis([t(1) t(end) 0 max(S)])

%2
f = -1.5:Deltaf:1.5-Deltaf;
X = 1./(1-0.91*exp(-2*i*pi*f));


%3
figure(2)
subplot(2,2,1)
plot(t,real(S),f,real(X))
axis([f(1),f(end),min(real(X)),max(real(X))])
xlabel('f')
title('$\Re(X(f), S(f))$', 'interpreter','Latex')
legend('\Re(S(f))', '\Re(X(f))')

subplot(2,2,2)
plot(t,imag(S),f,imag(X))
axis([f(1),f(end),min(imag(X)),max(imag(X))])
xlabel('f')
title('$\Im(X(f), S(f))$', 'interpreter','Latex')
legend('\Im(S(f))', '\Im(X(f))')

subplot(2,2,3)
plot(t,abs(S),f,abs(X))
axis([f(1),f(end),min(abs(X)),max(abs(X))])
xlabel('f')
title('$|S(f)|, |X(f)|$', 'interpreter','Latex')
legend('|S(f)|', '|X(f)|')

subplot(2,2,4)
plot(t,angle(S),f,angle(X))
axis([f(1),f(end),min(angle(X)),max(angle(X))])
xlabel('f')
title('$\phi(X(f), S(f))$', 'interpreter','Latex')
legend('\phi(S(f))', '\phi(X(f))')

%4 suite
t = t - 1/2;
S = fftshift(S);
figure(3)
subplot(2,2,1)
plot(t,real(S),f,real(X))

axis([f(1),f(end),min(real(X)),max(real(X))])
xlabel('f')
title('$\Re(X(f), S(f))$', 'interpreter','Latex')
legend('\Re(S(f))', '\Re(X(f))')

subplot(2,2,2)
plot(t,imag(S),f,imag(X))
axis([f(1),f(end),min(imag(X)),max(imag(X))])
xlabel('f')
title('$\Im(X(f), S(f))$', 'interpreter','Latex')
legend('\Im(S(f))', '\Im(X(f))')

subplot(2,2,3)
plot(t,abs(S),f,abs(X))
axis([f(1),f(end),min(abs(X)),max(abs(X))])
xlabel('f')
title('$|S(f)|, |X(f)|$', 'interpreter','Latex')
legend('|S(f)|', '|X(f)|')

subplot(2,2,4)
plot(t,angle(S),f,angle(X))
axis([f(1),f(end),min(angle(X)),max(angle(X))])
xlabel('f')
title('$\phi(X(f), S(f))$', 'interpreter','Latex')
legend('\phi(S(f))', '\phi(X(f))')

end