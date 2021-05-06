function [s,t,K] = SignalFonctionComposee(A1,nu1,Phi1,A2,nu2,Phi2,td,tf,nue)

t=floor(td*nue)/nue:1/nue:ceil(tf*nue)/nue;
K=length(t);

[s1,k1]=SignalPeriodiqueFreqPure(A1,nu1/nue,Phi1,floor(td*nue),ceil(tf*nue));
[s2,k2]=SignalPeriodiqueFreqPure(A2,nu2/nue,Phi2,floor(td*nue),ceil(tf*nue));

s=s1+s2;

end