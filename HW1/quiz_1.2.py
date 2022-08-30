v = str(input())
u = str(input())

v1, v2, v3 = v.split(' ')
u1, u2, u3 = u.split(' ')

dot_product = (float(v1)*float(u1))+(float(v2)*float(u2))+(float(v3)*int(u3))

print(dot_product)