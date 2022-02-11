function [t,w] = backeuler(f, dfdy, a, b, alpha, N, maxiter, tol)
h = (b-a)/N;
t = a:h:b;
w = t*0; %Creates the w array to store values from each iteration of newton’s method% 
w(1)=alpha;
for i = 1:N
	wj = w(i);
	for j = 1:maxiter
		wj = wj - (wj - w(i) - (h*f(t(i+1),wj)))/(1 - (h*dfdy(t(i+1),wj))); 
		error = (wj - w(i) - (h*f(t(i+1),wj)))/(1 - (h*dfdy(t(i+1),wj)); 
		fprintf('%d %g\ n', j. , abs(error));
		if abs(error) < = tol
			break 
		end
	end
w(i+1)= wj;
end


f = @(t,y) (y^2)*(1-y);
a = 0; b= 2000;alpha=0.9;
[t4,w4] = rk4(f,a,b,alpha,646); 
[t5,w5] = rk4(f,a,b,alpha,790);
plot(t4,w4, t5,w5)
grid on