a = -1.5
b = 19.7
c = 3
n = 20
ele = (2*c)/n

x1 = -c - ele
x2 = -c
sum = 0
for i in range(n):
    x1 += ele
    x2 += ele

    y1 = a*x1*x1 + b
    y2 = a*x2*x2 + b
    area = (y1 + y2) * ele / 2
    print(round(x1,2), round(x2,2), round(y1,2), round(y2,2), round(area, 2))
    sum += area
    
print("total",sum)