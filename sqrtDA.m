function [x, ea]=sqrtDA(a, guess, es)
if nargin<1, error('최소 하나의 인자는 입력해주세요.'), end
if nargin<2|isempty(guess)
    if a>0 guess=a/2;   
    else guess=-a/2;
    end
end
if nargin<3|isempty(es), es=.5*10^-3; end
x = [guess]; 
ea = [100];
k = 2;  
det = 1;
if a==0, x=0; ea=0; 
else    
    if a<0, a=-a; det = i; end
    while(1)
        x(k) = (guess+a/guess)/2;
        ea(k) = abs((x(k)-guess)/x(k));
        guess = x(k); 
        if ea(k)<es, break, end
        k=k+1;
    end
    x = x*det;
end
x(k)
