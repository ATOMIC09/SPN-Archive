import random
n = int(input())
w3 = 0
x2 = 0
y2 = 0
z2 = 0

w = 1
x = 1
y = 1
z = 1
xxx = 0

while 1 <= x and x <= y and y <= z and z <= n :
    while xxx < 100 :
        w3 = random.randint(1, 100)
        x2 = random.randint(1, 100)
        y2 = random.randint(1, 100)
        z2 = random.randint(1, 100)
        
        w = w3**(1/3)
        x = x2**(1/2)
        y = y2**(1/2)
        z = z2**(1/2)
        
        if w3 == x2 + y2 + z2 :
            print(w,x,y,z)
        xxx += 1
