import os

file_list = os.listdir()
file_size = []

i = 0 

while i < len(file_list):
    file_size.append(os.path.getsize(file_list[i]))
    i += 1

print(file_list)
print(file_size)