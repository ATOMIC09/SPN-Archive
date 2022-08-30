xy = input()
raw_x,raw_y = xy.split()
x = int(raw_x)
y = int(raw_y)
if x == 0 and y == 0:
    print("At the origin")

if x == 0 and y != 0:
    print("On y-axis")

if y == 0 and x != 0:
    print("On x-axis")

if x > 0 and y > 0:
    print("Quadrant I")

if x < 0 and y > 0:
    print("Quadrant II")

if x < 0 and y < 0:
    print("Quadrant III")

if x > 0 and y < 0:
    print("Quadrant IV")