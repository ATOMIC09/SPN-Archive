x_str,y_str = input().split()

a = int(x_str)
b = int(y_str)
sum = 0
total = 0
i = a
j = i + 1

while i <= b-1:
    total += ((-1)**i) * sum

    while j <= b:
        sum += i + j
        j += 1
        
    i += 1

print(total)