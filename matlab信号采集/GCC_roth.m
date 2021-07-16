%标准ROTH
fs=22400;
x=music(10000:10448,:);
z=zeros(12,1);
tmp=x(1:439,:);
y=[z;tmp];
N=449;
X=fft(x,2*N-1);
Y=fft(y,2*N-1);

Sxy=X.*conj(Y);
Sxx=X.*conj(X);
gain=1./abs(Sxx);
Gxy=fftshift(ifft(Sxy.*gain));
plot(Gxy);
[Gvalue,G]=max(Gxy);
T=(1/fs)*abs(N-G)*1000;
if N>G
    sprintf("y比x延后%.5fms\n",T)
else 
    sprintf("x比y延后%.5fms\n",T)
end