# sqrtDA.m
![image](https://user-images.githubusercontent.com/44903476/48919238-ea871980-eed4-11e8-8d61-4b2996e11b22.png)
- 수치해석 과제로 주어진 이 문제를 matlab을 이용하여 해결해보고자 제곱근 a를 추정하는 함수를 만들어 보았습니다.

````
function [x, ea]=sqrtDA(a, guess, es)
````
- a, guess, es을 입력으로 받아서 [x,ea]를 출력하는 함수 sqrtDA를 만들었습니다.

````
if nargin<1, error('최소 하나의 인자는 입력해주세요.'), end
if nargin<2|isempty(guess)
    if a>0 guess=a/2;   
    else guess=-a/2;
    end
end
if nargin<3|isempty(es), es=.5*10^-3; end
````
- 입력된 인자의 개수가 하나 미만(즉, 0개)일 경우에는 '최소 하나의 인자는 입력해주세요.'라는 에러 메세지를 띄운다.
- 입력된 인자의 개수가 하나이거나 guess가 입력되지 않았을때 a>0인 경우에는 guess의 초기값을 a/2로 두고 그렇지 않으면 -a/2로 두기로 하였습니다.
- 또한 입력된 인자의 개수가 세개 미만이거나 es가 입력되지 않았을 때 es의 초기값을 0.5m로 두었습니다.

````
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
````

- x를 추정치, ea를 근사상대오차 100으로 두었습니다. 또한 if_else문을 활용하였으며 while문을 사용하여 반복되도록 하였습니다. 계속해서 반복하여 추정하다가 근사상대오차가 상대오차보다 작아지면 break를 만나서 while문이 종료되며 추정이 종료됩니다.

- 결과값으로는 [추정치, 근사상대오차]가 나오게 됩니다.
