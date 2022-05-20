import math
a = 3
b = 9
c = 4
d = 6
n = 20
ele = (2*d)/n

x1 = -d - ele
x2 = -d
sum = 0
for i in range(n):
    x1 += ele
    x2 += ele

    y1 = c/(a*math.fabs(x1) + b)
    y2 = c/(a*math.fabs(x2) + b)
    area = (y1 + y2) * ele / 2
    print(round(x1,2), round(x2,2), round(y1,2), round(y2,2), round(area, 2))
    sum += area
    
print("total",sum)