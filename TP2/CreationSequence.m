function CreationSequence(M)
i=complex(0,1);

%1
k = 0:1:M-1;
s = (0.91).^k;
figure(1)
subplot(2,2,1)
stem(k,s);

N = 2048;
Deltaf = 1/N;
S = fft(s,N);
t = 0:Deltaf:1-Deltaf;
subplot(2,2,2)
plot(t,abs(S))
axis([t(1) t(end) 0 max(S)])

%2
f = -1.5:Deltaf:1.5-Deltaf;
X = 1./(1-0.91*exp(-2*i*pi*f));

subplot(2,2,3)
plot(f,abs(X))
subplot(2,2,4)
plot(f,angle(X))

%3
figure(2)
subplot(2,2,1)
plot(t,real(S),f,real(X))
subplot(2,2,2)
plot(t,imag(S),f,imag(X))
subplot(2,2,3)
plot(t,abs(S),f,abs(X))
subplot(2,2,4)
plot(t,angle(S),f,angle(X))

%4 suite
t = t - 1/2;
S = fftshift(S);
figure(3)
subplot(2,2,1)
plot(t,real(S),f,real(X))
legend(['S, M=', num2str(M)],['X, M=', num2str(M)])
subplot(2,2,2)
plot(t,imag(S),f,imag(X))
subplot(2,2,3)
plot(t,abs(S),f,abs(X))
subplot(2,2,4)
plot(t,angle(S),f,angle(X))

end