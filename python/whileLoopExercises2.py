### 1
##n = None
##
##while n >= 10 or n < 1:
##    n = int(raw_input('Enter a number within [1,10): '))
##print 'Thanks'
##
### 2
##i = None
##
##while i < 1:
##    i = int(raw_input('Enter a positive number: '))
##
##x = i - 1
##
##while x != 0:
##    print x
##    x = x - 1
    
### 3
##isEven = lambda x : x % 2 == 0
##isOdd = lambda x : not(isEven(x))
##
##n1 = None
##n2 = None
##
##while n1 < 1:
##    n1 = int(raw_input('Enter a positive integer: '))
##
##while n2 < 1:
##    n2 = int(raw_input('Enter another: '))
##
##if isOdd(n2):
##    x = n2 - 2
##if isEven(n2):
##    x = n2 - 1
##
##if isOdd(n1):
##    y = n1
##if isEven(n1):
##    y = n1 + 1
##
##if n2 > n1:
##    if isOdd(n2):
##        x = n2 - 2
##    if isEven(n2):
##        x = n2 - 1
##    while x >= n1:
##        print x
##        x = x + 2
##if n1 > n2:
##    if isOdd(n1):
##        x = n1
##    if isEven(n1):
##        x = n1 + 1
##    while x < n2:
##        print x
##        x = x + 2

# 4
isDivisor = lambda x,y : x % y == 0
i = None
x = 1

while i < 1:
    i = int(raw_input('Enter a positive integer: '))

while x <= i:
    if isDivisor(i,x):
        print i
    i = i + 1
