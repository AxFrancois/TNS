function CreationCos(f0,N)

M = 35;
k = 0:1:M-1;
s = cos(2*pi*f0*k);
figure(1)
stem(k,s)

S = fft(s,N);
Deltaf = 1/N;
display(['Finesse d analyse DeltaF = ', num2str(Deltaf)])
f = 0:Deltaf:1-Deltaf;

figure(2)
subplot(2,2,1)
stem(f,real(S),'.')
subplot(2,2,2)
stem(f,imag(S),'.')
subplot(2,2,3)
stem(f,abs(S),'.')
subplot(2,2,4)
stem(f,angle(S),'.')

end