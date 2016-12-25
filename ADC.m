function code = AnalogToDigital (filename)
load filename ;
n =1 ;
m = 8000;
fs=8000;
[M,Fs] = audioread(filename);
code= zeros(1 , m ) ;
for i= n : m 
samples = [n,m] ;
[y,Fs] = audioread(filename,samples);
sound(y,Fs)
plot(y);
Fs
%partition=[ -0.08 -0.04  -0.02  0 0.02 0.04 0.08 ];
%codebook=[-0.08 -0.04 -0.02  0 0.02 0.04 0.08 1 ];
min(y);
max(y);
if  and(max(y),min(y)) == 0  
num= 8192/2 ;
partition=  -num : 1 : num ;
codebook =  -num : 1 : num+1 ;
else avg=abs(min(y)+max(y))/2 
num = (8192*avg)/2
partition=  -num : avg : num ;
codebook =  -num : avg : num+avg ;
end
[index,quants] =quantiz(y,partition,codebook);
%figure 
%stem(quants);
code = dec2bin(index);
n=m
m = m+fs 
if m> length(M)
m = length(M)
end
end