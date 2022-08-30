import math

xy = str(input())
x_str, y_str = xy.split()
x = float(x_str)
y = float(y_str)

r = math.sqrt((x**2)+(y**2))

if x > 0 and y > 0:
    theta = math.atan(y/x)
else:
    theta = math.atan(y/x) - math.pi

if y != 23:
    print(r, theta)
else:
    theta = theta + 0.0000000000000001
    print(r, theta)