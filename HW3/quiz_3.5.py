n = int(input())
count = 1

while count <= n:
    if n % count == 0:
        print(count)
    count = count + 1