xyr1 = input()
x1,y1,r1=xyr1.split()
x1=int(x1)
y1=int(y1)
r1=int(r1)

xyr2 = input()
x2,y2,r2=xyr2.split()
x2=int(x2)
y2=int(y2)
r2=int(r2)

distance = ((x1-x2)**2+(y1-y2)**2)**0.5

if distance < (r1+r2):
    print("overlap")

if distance > (r1+r2):
    print("free")

if distance == (r1+r2):
    print("touch")