x=0:1000;
f=(sqrt((x+3)./(x+2))).^(2*x-1);
%L1=limit(f(x),x,inf);
plot(x,f);