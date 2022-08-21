##### EX3.2 #####
def do_twice(f):
    f()
    f()

def do_four(f):
    do_twice(f)
    do_twice(f)

def print_spam():
    print('spam')

#do_four(print_spam)











##### EX3.1 #####
def spacer(name):
    space_size = ' '*(70 - len(name))
    print(space_size+name)

#spacer('monty')











collumn = int(input("Enter collumn : "))
row = int(input("Enter row : "))
# Draw Function
def draw_first():
    print('o---------',end="")

# สร้าง | แนวนอน
def draw_second(collumn):
    for i in range(collumn):
        print('|         ',end="")
    print('|')

# สร้างตาราง
def draw_grid(collumn,row):
    # สร้างแถว
    for i in range(row):
        for i in range(collumn):    # สร้างแถวแนวนอน
            draw_first()
        print('o')                  # ปิดท้ายแถวแนวนอน
        
        for i in range(4):          # กำหนดช่องว่างแนวตั้งในระหว่างขอบล่างกับขอบบนในแถวนั้น ๆ
            draw_second(collumn)

    # Draw Last Line
    for i in range(collumn):        # สร้างแถวแนวนอนอันสุดท้าย
        draw_first()
    print('o')                      # ปิดท้ายแถว
  
draw_grid(collumn,row)













'''
number1 = int(input('Enter number 1: '))
number2 = int(input('Enter number 2: '))

def factorial(number):
    if number == 0:
        return 1
    else:
        return number * factorial(number-1)

def simple_math(number1, number2):
    print(f'{number1} + {number2} = {number1 + number2}')
    print(f'{number1} - {number2} = {number1 - number2}')
    print(f'{number1} * {number2} = {number1 * number2}')
    print(f'{number1} / {number2} = {number1 / number2}')
    print(f'{number1} % {number2} = {number1 % number2}')
    print(f'{number1} ** {number2} = {number1 ** number2}')
    print(f'Factorial of {number1} = {factorial(number1)}')
    print(f'Factorial of {number2} = {factorial(number2)}')

simple_math(number1, number2)

'''

