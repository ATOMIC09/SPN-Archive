# Calculate circumference and area of a circle
print("Circumference of a circle\n")
radius = int(input("Enter radius : "))

def cal_circle_circumference(radius):
    return 2 * 3.14 * radius

def cal_circle_area(radius):
    return 3.14 * radius * radius

print("Circumference:", cal_circle_circumference(radius))
print("Area:", cal_circle_area(radius))

# Calculate th BMI
print("=========================================")
print("Calculate BMI\n")
weight = int(input("Enter weight : "))
height = int(input("Enter height : "))

def cal_bmi(weight, height):
    height_in_metre = height / 100
    return weight / (height_in_metre**2)

print("BMI:", cal_bmi(weight, height))

# Calculate the area of square
print("=========================================")
print("Calculate the area of square\n")
width = int(input("Enter width : "))
lenth = int(input("Enter length : "))

def cal_square_area(width, lenth):
    return width * lenth

print("Area in SqMetre:", cal_square_area(width, lenth))
print("Area in SqWa:", cal_square_area(width, lenth) * 0.25)
print("\n")





