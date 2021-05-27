function CreationCos(f0,N)

M = 35;
k = 0:1:M-1;
s = cos(2*pi*f0*k);
figure(1)
stem(k,s)
xlabel('k (indices)')
ylabel('s[k]')
title('$s[k]$ $a$ $35$ $echantillons$','interpreter','Latex')
axis([0,M-1,min(s),max(s)])

S = fft(s,N); %calcul de sa TFD-N points
Deltaf = 1/N;
display(['Finesse d analyse DeltaF = ', num2str(Deltaf)])
f = 0:Deltaf:1-Deltaf;

figure(2)
subplot(2,2,1)
stem(f,real(S),'.')
axis([f(1),f(end),min(real(S)),max(real(S))])
xlabel('f')
title('$\Re(S(f))$', 'interpreter','Latex')

subplot(2,2,2)
stem(f,imag(S),'.')
axis([f(1),f(end),min(imag(S)),max(imag(S))])
xlabel('f')
title('$\Im(S(f))$', 'interpreter','Latex')

subplot(2,2,3)
stem(f,abs(S),'.')
axis([f(1),f(end),min(abs(S)),max(abs(S))])
xlabel('f')
title('$|S(f)|$', 'interpreter','Latex')

subplot(2,2,4)
stem(f,angle(S),'.')
axis([f(1),f(end),min(angle(S)),max(angle(S))])
xlabel('f')
title('$\phi(S(f))$', 'interpreter','Latex')


end