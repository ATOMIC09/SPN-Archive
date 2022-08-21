time = int(input("Enter Second : "))
year = int(time / 31556926)
sade1 = int(time % 31556926)

month = int(sade1 / 2629744)
sade2 = int(sade1 % 2629744)

day = int(sade2 / 86400)
sade3 = int(sade2 % 86400)

hour = int(sade3 / 3600)
sade4 = int(sade3 % 3600)

minute = int(sade4 / 60)
second = int(sade4 % 60)

print("\n================")
print("Year :",year)
print("Month :",month)
print("Day :",day)
print("Hour :",hour)
print("Minute :",minute)
print("Second :",second)
print("================\n")