# Find min max avg of a list of numbers
value = [2,3,1,4,5,6,77,10,8,9]
palindrome = "rotator"

def mymax(value):
    count = 1
    found_index = 0
    mymaxvalue = value[count-1] # ตัวที่ 0

    while count < len(value):
        if mymaxvalue < value[count]: # ถ้าตัวก่อนน้อยกว่าตัวถัดไป
            mymaxvalue = value[count]
            found_index = count
        count = count + 1
    return mymaxvalue, found_index


def mymin(value):
    count = 1
    found_index = 0
    myminvalue = value[count-1] # ตัวที่ 0

    while count < len(value):
        if myminvalue > value[count]: # ถ้าตัวก่อนน้อยกว่าตัวถัดไป
            myminvalue = value[count]
            found_index = count
        count = count + 1
    return myminvalue, found_index


def myavg(value):
    count = 0
    sum = 0

    while count <= len(value)-1:
        sum = sum + value[count]
        count = count + 1
    
    avg = sum/len(value)
    return(avg)

def a(value):
    print("Max : ", mymax(value)[0])
    print("Min : ", mymin(value)[0])
    print("Avg : ", myavg(value))


def b(value):    
    print("Index of Max : ", mymax(value)[1])
    print("Index of Min : ", mymin(value)[1])


def c(value, search):
    count = 0
    while count <= len(value)-1:
        if search == value[count]:
            print(f"Index of {search} : {count}")
        count = count + 1


def d(number):
    result = []

    while number != 0:
        result.append(number%2)
        number = number//2

    printcount = len(result)-1
    reversed_result = []

    while printcount >= 0:
        reversed_result.append(result[printcount])
        printcount = printcount - 1

    print(reversed_result)
    #print(result[::-1])

'''
def e(text):
    list1 = []
    list2 = []

    count = 0
    while count

    print(list1)
    count = 0
    while count < len(list1):'''


'''
a(value)
b(value)
c(value,7)
d(100)
e(palindrome)
'''

data = [1,3,5,2,4]

index = 0
sum = 0

while index < 5:
    sum = sum + data[index]
    index = index + 1

print("Average : ", sum/5)
