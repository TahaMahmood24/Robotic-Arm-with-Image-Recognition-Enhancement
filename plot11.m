x = 100*rand(20,1); 
y = 3*x + 5 + 15*randn(size(x)); 
plot(x,y,'bo') 
P = polyfit(x,y,1); 
xfit = 0:100; 
yfit = polyval(P,xfit); 
hold on
plot(xfit,yfit,'-')