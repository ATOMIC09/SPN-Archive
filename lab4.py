money = 1
money = int(input("Enter money : "))

while money != 0:
    ten = money // 10
    sade = money % 10

    five = sade // 5
    one = sade % 5

    print("Money :", money)
    print("Ten coins :", ten)
    print("Five coins :", five)
    print("One coins :", one)
    print("=================")
    money = int(input("Enter money : "))











"""
start = int(input("Enter start number: "))
end = int(input("Enter end number: "))

while start <= end:
    x = 1

    print(start, end=" ") # ปริ้นเลขแถว

    while start >= x:
        print("o"*x, end="")
        x += 1
    print()
    start = start + 1"""



"""weight_durian = 0
number_of_durian = 0
weight = int(input("Enter weight of Durian : "))

while weight != 0:
    weight_durian = weight_durian + weight
    number_of_durian = number_of_durian + 1
    avg = weight_durian / number_of_durian

    print("Number of Durian :", number_of_durian)
    print("Weight Durian :", weight_durian)
    print("Average weight of Durian :", avg)
    print("=================")
    weight = int(input("Enter weight of Durian : "))"""


'''
weight = 1
weight_durian = 0
number_of_durian = 0
weight = int(input("Enter weight of Durian : "))

while weight != 0:
    weight_durian = weight_durian + weight
    number_of_durian = number_of_durian + 1
    avg = weight_durian / number_of_durian

    print("Number of Durian :", number_of_durian)
    print("Weight Durian :", weight_durian)
    print("Average weight of Durian :", avg)
    print("=================")
    weight = int(input("Enter weight of Durian : "))
'''

"""
from random import randint

value = randint(1,100)
a = 101

while a != value and a != 0:
        a = int(input("Guess the number: "))
        if a > value and a != 0:
            print("Your number is higher than the random value")
        if a < value and a != 0:
            print("Your number is lower than the random value")

if a == value:
    print("You guessed the right number!")
if a == 0:
    print("Exit the game.")
"""
"""
count = 0
while count < 5:
    print("Hello")
    count = count + 1"""