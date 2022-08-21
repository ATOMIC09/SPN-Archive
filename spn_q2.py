import math

diameter = int(input("Enter Diameter : "))

circumference = 2 * math.pi * (diameter/2)
area = math.pi * ((diameter/2) ** 2)

print("Circumference :",circumference)
print("Area :",area)