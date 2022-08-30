x = input()
x_list = x.split()
x_int = []


for i in range(5):
    x_int.append(int(x_list[i]))

x_sort = []

x_sort = x_int.copy()
x_sort.sort()

if x_int == x_sort:
    print("True")
else:
    print("False")