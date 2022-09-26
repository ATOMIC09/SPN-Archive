input_round = int(input())
count = 0

number = []

while count < input_round:
    number.append(int(input()))
    count += 1

# Reuse
def mymax(value):
    count = 1
    mymaxvalue = value[count-1] # ตัวที่ 0

    while count < len(value):
        if mymaxvalue < value[count]: # ถ้าตัวก่อนน้อยกว่าตัวถัดไป
            mymaxvalue = value[count]
            found_index = count
        count = count + 1
    return mymaxvalue


def mymin(value):
    count = 1
    myminvalue = value[count-1] # ตัวที่ 0

    while count < len(value):
        if myminvalue > value[count]: # ถ้าตัวก่อนน้อยกว่าตัวถัดไป
            myminvalue = value[count]
            found_index = count
        count = count + 1
    return myminvalue

def count_under_zero(value):
    count = 0
    for i in value:
        if i < 0:
            count += 1
    return count

max_num = mymax(number)
min_num = mymin(number)

print(max_num - min_num,end=" ")
print(count_under_zero(number))