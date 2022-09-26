def cal_prime(start,end):
    while start <= end:
        if (start%start) == 0 and (start%1) == 0 and (start%2) != 0 and (start%3) != 0 and (start%5) != 0 and (start%7) != 0 and (start%11) != 0 and (start%13) != 0:
            print(start,end=" ")
        start = start + 1

cal_prime(100,200)