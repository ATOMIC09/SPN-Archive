first = int(input("Enter first number: "))
n = int(input("Enter n : "))

def series(first,n):
    Sn = n/2*(first+n)
    print(f"Series of {first}+{first+1}+{first+2}+...+{n}= {Sn}")

series(first,n)