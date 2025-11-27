i=1:1000;
v=2.5*sin(pi*i/100)+2.5;
t=0.5:0.5:500;
Matrix=[t,v];
plot(t,v);
xlabel("Time[s]");
ylabel("Amplitude");







