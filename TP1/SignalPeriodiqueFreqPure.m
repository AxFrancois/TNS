function [s,k] = SignalPeriodiqueFreqPure(A,f0,Phi,kd,kf)

k=kd:1:kf;
s=A*sin(2*pi*f0*k+Phi);

end