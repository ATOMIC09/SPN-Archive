import math

rt = str(input())
r_str, t_str = rt.split()
r = float(r_str)
t = float(t_str)

x = r*math.cos(t)
y = r*math.sin(t)

print(x, y)