import math
a = int(input())

sqrt3 = a ** (1/3)
new_a = round(sqrt3)

if new_a ** 3 == a:
    print(new_a)
else:
    print("Not Found")