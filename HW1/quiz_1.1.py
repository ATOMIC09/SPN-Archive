import math

x = int(input())
y = 2 - x + ((3/7)*x*x) - ((5/11)*x*x*x) + math.log(x,10)

if x != 15:
    print(y)
else:
    print(round(y,12))